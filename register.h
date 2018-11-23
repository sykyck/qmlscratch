#ifndef REGISTER_H
#define REGISTER_H

#include <QObject>
#include <QDebug>
#include <QString>
#include <QDesktopServices>

#include "constants.h"
#include "settingsstore.h"

class Register : public QObject
{
    Q_OBJECT

public:
    QSettings _settings;
    explicit Register(QObject *parent = nullptr);
    ~Register();

signals:
    void showMessageToRegister();

public slots:
    void onRegisterWithFbClicked();
    void onRegisterWithGoogleClicked();

};

#endif // REGISTERWITHFACEBOOK_H
