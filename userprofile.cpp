#include "userprofile.h"

UserProfile::UserProfile(QObject *parent) : QObject(parent)
{
   this->friendsList = new QList<UserProfile>();
}

void UserProfile::setFirstName(QString firstname)
{
    this->firstName = firstname;
}

void UserProfile::setSecondName(QString secondname)
{
    this->secondName = secondname;
}

void UserProfile::setEmailId(QString emailId)
{
    this->firstName = emailId;
}

void UserProfile::setSessionId(QString sessionId)
{
    this->sessionId = sessionId;
}

void UserProfile::setFriendsList(QList<UserProfile> friendsList)
{
    for(auto user=friendsList.begin();user!=friendsList.end();user++)
    {
        this->friendsList->append(*user);
    }
}

const QString UserProfile::getFirstName()
{
    return this->firstName;
}

const QString UserProfile::getSecondName()
{
    return this->secondName;
}

const QString UserProfile::getEmailId()
{
    return this->emailId;
}

const QString UserProfile::getSessionId()
{
    return this->sessionId;
}

const QList<UserProfile> UserProfile::getFriendsList()
{
    return *(this->friendsList);
}

