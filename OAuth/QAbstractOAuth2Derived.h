#include <QObject>
#include <QDebug>
#include <QString>
#include <QtNetworkAuth\QAbstractOAuth2>

class QAbstractOAuth2Derived : public QAbstractOAuth2
{
    Q_OBJECT
public:
    explicit QAbstractOAuth2Derived(QString clienIdentifier, QObject *parent = nullptr);
    ~QAbstractOAuth2Derived();

public slots:
};
