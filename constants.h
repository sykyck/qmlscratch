#ifndef CONSTANTS_H
#define CONSTANTS_H
#include <QString>
#include <strings.h>

const int MENU_ITEMS_LENGTH = 4;
const QString MENU_ITEMS[MENU_ITEMS_LENGTH]={"Account","About Us","Contact Us","Sign In"};
const QString SERVER_URL = "https://chatindiaduplicate.herokuapp.com";
//const QString SERVER_URL = "https://localhost:3000";
const QString GOOGLE_REQUEST_URL = SERVER_URL + "/routes/googlelogin/sendreq";
const QString FB_REQUEST_URL = SERVER_URL + "/routes/fblogin/sendreq";
const QString LOGIN_URL = SERVER_URL + "/routes/login";
const QString SESSIONID_KEY = "sessionid";
const QString LASTTIME_LOGIN_WITH = "lasttime_login_with";
const QString GOOGLE_AUTH = "google_oauth";
const QString FB_AUTH = "facebook_oauth";

#endif // CONSTANTS_H
