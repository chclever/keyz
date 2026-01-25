#include "core.h"
    
#include <QObject>
#include <QString>
#include <QVariantList>
#include <QVariantMap>

struct KeyData {
    QString userid;
    QString login;
    QString platform;
};

class Controller : public QObject
{
    Q_OBJECT

public:
    Controller(Core &core, QObject *parent = nullptr); 

private:
    Core &core;
    QVariantList convertPasswordListToVariantList(std::vector<PasswordInfo> data);

signals:        // C++ -> QML
    void sendError(int code,const QString comment);
    void sendLogin(const QString login);
    void sendUserData(QVariantList data); // name & platform 
    void sendUserPassword(const QString password);
    void sendUpdatePasswordSuccess();
    void sendUpdatePasswordError(const QString comment);

public slots:   // QML -> C++  
    void handleLogin(const QString &text);
    void handleRenderMainDataFromUser(const QString &login); // принимаем логин
    void handleRenderKeyDataFromUser(const QString userid, const QString login, const QString platform);
    void handleUpdatePassword(const QString userid, const QString login, const QString mainPassword , const QString platform);
};
