// Copyright (C) 2023 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR BSD-3-Clause

#include "triangle.h"
#include <QGuiApplication>
#include <QFile>
#include <QtQuick3DRuntimeRender/private/qssgrendercontextcore_p.h>

static QShader getShader(const QString &name)
{
    QFile f(name);
    return f.open(QIODevice::ReadOnly) ? QShader::fromSerialized(f.readAll()) : QShader();
}

static float triangle[] = {
     0.0f,   0.5f,    1.0f, 0.0f, 0.0f,
    -0.5f,  -0.5f,    0.0f, 1.0f, 0.0f,
     0.5f,  -0.5f,    0.0f, 0.0f, 1.0f,
};

class TriangleRenderer : public QSSGRenderExtension
{
public:
    TriangleRenderer();
    ~TriangleRenderer();

    bool prepareData(QSSGFrameData &data) override;
    void prepareRender(const QSSGRenderer &renderer, QSSGFrameData &data) override;
    void render(const QSSGRenderer &renderer) override;
    void release() override;
    Type type() const override { return Type::Main; }
    RenderMode mode() const override { return RenderMode::Overlay; }

    bool canRender = false;
    QMatrix4x4 viewProjection;
    QRhiViewport mainViewport;

    std::unique_ptr<QRhiBuffer> vbuf;
    std::unique_ptr<QRhiBuffer> ubuf;
    std::unique_ptr<QRhiShaderResourceBindings> srb;
    std::unique_ptr<QRhiGraphicsPipeline> ps;
    QVector<quint32> rpFormat;

    QMatrix4x4 modelMatrix;
    void updateModelMatrix(const QVector3D &translate, float rotate, float scale)
    {
        modelMatrix.setToIdentity();
        modelMatrix.translate(translate);
        modelMatrix.rotate(rotate, 0, 1, 0);
        modelMatrix.scale(scale, scale, scale);
    }

    bool enabled = true;
};

TriangleRenderer::TriangleRenderer()
{
    qDebug() << "TriangleRenderer" << this << "ctor; current thread:" << QThread::currentThread() << "main thread:" << qGuiApp->thread();
}

TriangleRenderer::~TriangleRenderer()
{
    qDebug() << "TriangleRenderer" << this << "dtor; current thread:" << QThread::currentThread() << "main thread:" << qGuiApp->thread();
}

bool TriangleRenderer::prepareData(QSSGFrameData &data)
{
    if (!enabled)
        return true;

    QSSGRenderCamera *camera = data.camera();
    if (!camera) {
        canRender = false;
        return false;
    }

    camera->calculateViewProjectionMatrix(viewProjection);

    canRender = true;

    return true;
}

void TriangleRenderer::prepareRender(const QSSGRenderer &renderer, QSSGFrameData &data)
{
    if (!enabled)
        return;

    if (!canRender)
        return;

    const std::unique_ptr<QSSGRhiContext> &rhiCtx = renderer.contextInterface()->rhiContext();
    if (!rhiCtx)
        return;

    QRhi *rhi = rhiCtx->rhi();
    QRhiCommandBuffer *cb = rhiCtx->commandBuffer();
    QRhiResourceUpdateBatch *resourceUpdates = rhi->nextResourceUpdateBatch();

    if (ps && ps->sampleCount() != rhiCtx->mainPassSampleCount())
        ps.reset();

    QVector<quint32> currentRpFormat = rhiCtx->mainRenderPassDescriptor()->serializedFormat();
    if (ps && rpFormat != currentRpFormat)
        ps.reset();

    if (!ps) {
        vbuf.reset(rhi->newBuffer(QRhiBuffer::Immutable, QRhiBuffer::VertexBuffer, sizeof(triangle)));
        vbuf->create();

        resourceUpdates->uploadStaticBuffer(vbuf.get(), triangle);

        ubuf.reset(rhi->newBuffer(QRhiBuffer::Dynamic, QRhiBuffer::UniformBuffer, 64));
        ubuf->create();

        srb.reset(rhi->newShaderResourceBindings());
        srb->setBindings({
            QRhiShaderResourceBinding::uniformBuffer(0, QRhiShaderResourceBinding::VertexStage, ubuf.get()),
        });
        srb->create();

        ps.reset(rhi->newGraphicsPipeline());
        ps->setDepthTest(true);
        ps->setDepthWrite(true);
        ps->setShaderStages({
           { QRhiShaderStage::Vertex, getShader(QLatin1String(":/color.vert.qsb")) },
           { QRhiShaderStage::Fragment, getShader(QLatin1String(":/color.frag.qsb")) }
        });
        QRhiVertexInputLayout inputLayout;
        inputLayout.setBindings({
            { 5 * sizeof(float) }
        });
        inputLayout.setAttributes({
            { 0, 0, QRhiVertexInputAttribute::Float2, 0 },
            { 0, 1, QRhiVertexInputAttribute::Float3, 2 * sizeof(float) }
        });
        ps->setVertexInputLayout(inputLayout);
        ps->setShaderResourceBindings(srb.get());

        ps->setRenderPassDescriptor(rhiCtx->mainRenderPassDescriptor());
        rpFormat = currentRpFormat;
        ps->setSampleCount(rhiCtx->mainPassSampleCount());

        ps->create();
    }

    QMatrix4x4 mvp = rhi->clipSpaceCorrMatrix() * viewProjection * modelMatrix;
    resourceUpdates->updateDynamicBuffer(ubuf.get(), 0, 64, mvp.constData());

    cb->resourceUpdate(resourceUpdates);

    mainViewport = data.getPipelineState().viewport;
}

void TriangleRenderer::render(const QSSGRenderer &renderer)
{
    if (!enabled)
        return;

    if (!canRender)
        return;

    const std::unique_ptr<QSSGRhiContext> &rhiCtx = renderer.contextInterface()->rhiContext();
    if (!rhiCtx)
        return;

    QRhiCommandBuffer *cb = rhiCtx->commandBuffer();

    cb->debugMarkBegin(QByteArrayLiteral("Custom rhi rendering"));
    cb->setGraphicsPipeline(ps.get());
    cb->setViewport(mainViewport);
    cb->setShaderResources();
    const QRhiCommandBuffer::VertexInput vbufBinding(vbuf.get(), 0);
    cb->setVertexInput(0, 1, &vbufBinding);
    cb->draw(3);

    cb->debugMarkEnd();
}

void TriangleRenderer::release()
{
}

TriangleExtension::TriangleExtension(QQuick3DObject *parent)
    : QQuick3DRenderExtension(parent)
{
}

QSSGRenderGraphObject *TriangleExtension::updateSpatialNode(QSSGRenderGraphObject *node)
{
    if (!node)
        node = new TriangleRenderer;

    TriangleRenderer *renderer = static_cast<TriangleRenderer *>(node);

    if (m_dirtyFlag & EnabledDirty)
        renderer->enabled = m_enabled;

    if ((m_dirtyFlag & PositionDirty)
        || (m_dirtyFlag & RotationDirty)
        || (m_dirtyFlag & ScaleDirty))
    {
        renderer->updateModelMatrix(QVector3D(m_x, m_y, m_z), m_rotation, m_scale);
    }

    m_dirtyFlag = {};

    return node;
}

void TriangleExtension::markDirty(Dirty v)
{
    m_dirtyFlag |= v;
    update();
}
