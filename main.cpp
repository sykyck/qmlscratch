#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickWindow>
#include <QQmlContext>
#include "registerwithfacebook.h"

int main(int argc, char *argv[])
{
#if defined(Q_OS_WIN)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);

    RegisterWithFacebook registerWithFacebook;

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("registerWithFacebook",&registerWithFacebook);
    engine.load(QUrl(QStringLiteral("qrc:/HomePage.qml")));

    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
