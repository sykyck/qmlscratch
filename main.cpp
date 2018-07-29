#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickWindow>
#include <QQmlContext>
#include "registerwithfacebook.h"
#include "o0globals.h"

const char OPT_OAUTH_CODE[] = "-o";
const char OPT_VALIDATE_TOKEN[] = "-v";

const char USAGE[] = "\n"
                     "Usage: facebookdemo [OPTION]...\n"
                     "Get OAuth2 access tokens from Facebook's OAuth service\n"
                     "\nOptions:\n"
                     "  %1\t\tLink with Facebook OAuth2 service using Authorization Code\n"
                     "  %2\t\tValidate Access Token\n";


int main(int argc, char *argv[])
{
#if defined(Q_OS_WIN)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);
    app.setOrganizationName("none");
    app.setApplicationName("ChatIndia");

    O0SettingsStore *store = new O0SettingsStore(O2_ENCRYPTION_KEY);
    RegisterWithFacebook registerWithFacebook(store);

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("registerWithFacebook",&registerWithFacebook);

    qWarning()<<"Value of Login with fbtoken="<<store->value(LOGIN_WITH_FBTOKEN);

    if(store->value(LOGIN_WITH_FBTOKEN).isEmpty())
    {
       engine.load(QUrl(QStringLiteral("qrc:/HomePage.qml")));
    } else if(store->value(LOGIN_WITH_FBTOKEN).compare("true",Qt::CaseSensitivity::CaseInsensitive)){
       registerWithFacebook.validateToken();
    } else if(store->value(LOGIN_WITH_FBTOKEN).compare("false",Qt::CaseSensitivity::CaseInsensitive)) {
       engine.load(QUrl(QStringLiteral("qrc:/HomePage.qml")));
    }

    return app.exec();
}
