#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickWindow>
#include <QQmlContext>
#include <QQuickStyle>


#include "registerandlogin.h"

int main(int argc, char *argv[])
{
#if defined(Q_OS_WIN)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);
    app.setOrganizationName("none");
    app.setApplicationName("ChatIndia");
    qDebug()<<QQuickStyle::name();
    QQuickStyle::setStyle("Material");
    QQuickStyle::setFallbackStyle("Material");
    qDebug()<<QQuickStyle::name();

    //initialize the webengine view
    QSettings settings;
    RegisterAndLogin _registerAndLogin;

    QQmlApplicationEngine engine;
    //embedding it into qml code using context property
    // there are two more ways
    engine.rootContext()->setContextProperty("registerAndLogin", &_registerAndLogin);

 //   if(settings.value(LASTTIME_LOGIN_WITH).toString().isEmpty())
  //  {
       engine.load(QUrl(QStringLiteral("qrc:/HomePage.qml")));
  //  }

    return app.exec();
}
