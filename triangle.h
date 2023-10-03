// Copyright (C) 2023 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR BSD-3-Clause

#ifndef TRIANGLE_H
#define TRIANGLE_H

#include <QtQuick3D/private/qquick3drenderextensions_p.h>
#include <QtQmlIntegration>
#include <rhi/qrhi.h>

class TriangleExtension : public QQuick3DRenderExtension
{
    Q_OBJECT
    QML_ELEMENT

    Q_PROPERTY(bool enabled READ enabled WRITE setEnabled NOTIFY enabledChanged)

    Q_PROPERTY(float x READ x WRITE setX NOTIFY xChanged)
    Q_PROPERTY(float y READ y WRITE setY NOTIFY yChanged)
    Q_PROPERTY(float z READ z WRITE setZ NOTIFY zChanged)

    Q_PROPERTY(float rotation READ rotation WRITE setRotation NOTIFY rotationChanged)
    Q_PROPERTY(float scale READ scale WRITE setScale NOTIFY scaleChanged)

public:
    TriangleExtension(QQuick3DObject *parent = nullptr);

    bool enabled() const { return m_enabled; }
    void setEnabled(bool enable) {
        if (m_enabled != enable) {
            m_enabled = enable;
            emit enabledChanged();
            markDirty(EnabledDirty);
        }
    }

    float x() const { return m_x; }
    void setX(float value)
    {
        if (m_x != value) {
            m_x = value;
            emit xChanged();
            markDirty(PositionDirty);
        }
    }

    float y() const { return m_y; }
    void setY(float value)
    {
        if (m_y != value) {
            m_y = value;
            emit yChanged();
            markDirty(PositionDirty);
        }
    }

    float z() const { return m_z; }
    void setZ(float value)
    {
        if (m_z != value) {
            m_z = value;
            emit zChanged();
            markDirty(PositionDirty);
        }
    }

    float rotation() const { return m_rotation; }
    void setRotation(float value)
    {
        if (m_rotation != value) {
            m_rotation = value;
            emit rotationChanged();
            markDirty(RotationDirty);
        }
    }

    float scale() const { return m_scale; }
    void setScale(float value)
    {
        if (m_scale != value) {
            m_scale = value;
            emit scaleChanged();
            markDirty(ScaleDirty);
        }
    }

signals:
    void enabledChanged();
    void xChanged();
    void yChanged();
    void zChanged();
    void rotationChanged();
    void scaleChanged();

protected:
    QSSGRenderGraphObject *updateSpatialNode(QSSGRenderGraphObject *node) override;

private:
    bool m_enabled = true;

    enum Dirty : quint8
    {
        EnabledDirty = 1 << 0,
        PositionDirty = 1 << 1,
        RotationDirty = 1 << 2,
        ScaleDirty = 1 << 3
    };
    using DirtyT = std::underlying_type_t<Dirty>;
    void markDirty(Dirty v);
    DirtyT m_dirtyFlag = 0;

    float m_x = 0.0f;
    float m_y = 0.0f;
    float m_z = 0.0f;

    float m_rotation = 0.0f;
    float m_scale = 1.0f;
};

#endif
