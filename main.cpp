#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QObject>
#include <QQmlComponent>
#include "registerwithfacebook.h"

int main(int argc, char *argv[])
{
#if defined(Q_OS_WIN)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/HomePage.qml")));

    RegisterWithFacebook registerWithFacebook;
    QObject::connect(registerWithFacebook, SIGNAL(registrationClicked()), &registerWithFacebook, SLOT(onRegisterWithFbClicked()));

    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
