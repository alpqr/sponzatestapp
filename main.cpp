#include <QGuiApplication>
#include <QQuickView>
#include <QQuickGraphicsConfiguration>
#include <QtQuick3D/qquick3d.h>

int main(int argc, char *argv[])
{
    qputenv("QSG_INFO", "1");
    qputenv("QSG_RHI_PROFILE", "1");
    qputenv("QT_QUICK_CONTROLS_STYLE", "Basic");
    QGuiApplication app(argc, argv);
    QSurfaceFormat::setDefaultFormat(QQuick3D::idealSurfaceFormat());

    QQuickView view;

    //QQuickGraphicsConfiguration config;
    //config.setTimestamps(true);
    //view.setGraphicsConfiguration(config);

    view.setColor(Qt::black);
    view.setResizeMode(QQuickView::SizeRootObjectToView);
    view.resize(1280, 720);
    view.setSource(QUrl("qrc:/main.qml"));
    view.show();

    int r = app.exec();

    return r;
}
