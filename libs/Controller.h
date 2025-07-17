#include <QObject>
#include <QString>

class Controller : public QObject
{
    Q_OBJECT
public:
    Controller(QObject *parent = nullptr);

public slots:
    void handleLogin(const QString &text);
};
