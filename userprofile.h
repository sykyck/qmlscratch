#ifndef USERPROFILE_H
#define USERPROFILE_H

#include <QObject>

class UserProfile : public QObject
{
    Q_OBJECT
public:
    explicit UserProfile(QObject *parent = nullptr);

    const QString getFirstName();
    const QString getSecondName();
    const QString getEmailId();
    const QString getSessionId();
    const QList<UserProfile *> getFriendsList();
    void setFirstName(QString firstname);
    void setSecondName(QString secondname);
    void setEmailId(QString emailId);
    void setSessionId(QString sessionId);
    void setFriendsList(QList<UserProfile *> friendsList);

private:
    QString firstName;
    QString secondName;
    QString emailId;
    QString sessionId;
    QList<UserProfile *> friendsList;

signals:

public slots:

};

#endif // USERPROFILE_H
