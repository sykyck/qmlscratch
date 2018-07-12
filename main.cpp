#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QObject>
#include <QQmlComponent>
#include <QQuickView>
#include <QQuickItem>
#include "registerwithfacebook.h"

int main(int argc, char *argv[])
{
#if defined(Q_OS_WIN)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);

    QQuickView *view = new QQuickView;
    view->setSource(QUrl(QStringLiteral("qrc:/HomePage.qml")));
   // view->show();

    // get root object
    QObject *rootObject = dynamic_cast<QObject *>(view->rootObject());

    // find element by name
    QObject *welcomeObject = rootObject->findChild<QObject *>(QString("welcomePageContent"));

    if (welcomeObject) { // element found
        qDebug() << "welcomeObject found";
    } else {
        qDebug() << "welcomeObject not found";
    }

//    QQmlApplicationEngine engine;
//    engine.load(QUrl(QStringLiteral("qrc:/HomePage.qml")));

    RegisterWithFacebook registerWithFacebook;
    QObject::connect(welcomeObject, SIGNAL(registrationClicked()), &registerWithFacebook, SLOT(onRegisterWithFbClicked()));

//    if (engine.rootObjects().isEmpty())
//        return -1;

    return app.exec();
}
