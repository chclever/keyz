#include "core.h"
#include <QObject>
#include <QString>

class Controller : public QObject
{
    Q_OBJECT

public:
    Controller(Core &core, QObject *parent = nullptr); 

private:
    Core &core;

signals:
    void sendError(int code,const QString comment);
    void sendLogin(const QString login);
    void sendUserData(std::vector<PasswordInfo> data); // name & platform 

public slots:
    void handleLogin(const QString &text);
    void handleRenderMainDataFromUser(const QString &login); // принимаем логин
};
