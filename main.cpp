#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickWindow>
#include <QQmlContext>
#include <QQuickStyle>
#include "register.h"

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

    QSettings settings;
    Register _register;

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("register", &_register);

 //   if(settings.value(LASTTIME_LOGIN_WITH).toString().isEmpty())
  //  {
       engine.load(QUrl(QStringLiteral("qrc:/HomePage.qml")));
  //  }

    return app.exec();
}
