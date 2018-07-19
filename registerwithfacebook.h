#ifndef REGISTERWITHFACEBOOK_H
#define REGISTERWITHFACEBOOK_H

#include <QObject>
#include <QDebug>
#include <QString>

#include "OAuth/o2facebook.h"
#include "o0settingsstore.h"

class RegisterWithFacebook : public QObject
{
    Q_OBJECT
public:
    explicit RegisterWithFacebook(QObject *parent = nullptr);
    ~RegisterWithFacebook();

public slots:
    void onRegisterWithFbClicked();

private:
    O2Facebook *o2Facebook_;
};

#endif // REGISTERWITHFACEBOOK_H
