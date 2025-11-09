#include "Controller.h"

Controller::Controller(Core &core, QObject *parent) : QObject(parent) , core(core) {}

QVariantList Controller::convertPasswordListToVariantList(std::vector<PasswordInfo> data) {

    QVariantList result; // [  ]

    std::cout << "[ convertPasswordListToVariantList ]" << std::endl;

    for (const auto &mass : data) {
        QVariantMap structure;

        std::cout << "> Обработка: " << mass.login << ":" << mass.platform << std::endl;
    
        structure["login"] = QString::fromStdString(mass.login);
        structure["platform"] = QString::fromStdString(mass.platform);
    

        result.append(structure);
    }

    std::cout << "'result' len: " << result.length() << std::endl;

    return result;

}

void Controller::handleLogin(const QString &text) {

    // check login 

    auto data = this->core.get_user_data(text.toStdString()); 
    std::cout << "--- response code: " << data.code 
    <<  "\n--- comment: " << data.comment 
    << "\n--- StdText: "  << text.toStdString() << std::endl;

    if (data.code == 404) {
        std::cout << "[Auth]: login failed!" << std::endl;
        emit sendError(data.code, QString::fromStdString(data.comment));
    }

    if (data.code == 200) {
        std::cout << "[Auth]: OK." << std::endl;
        emit sendLogin(text);
    }
}

void Controller::handleRenderMainDataFromUser(const QString &login) {

    auto data = this->core.get_user_data(login.toStdString());
    
    if (data.code == 200) {
        
        std::cout << "[OK]: 'emit sendUserData(data);' | Code: 200" << std::endl;

        emit sendUserData( this->convertPasswordListToVariantList(data.password_data) );

    } else {
        std::cout << "[error]: error while 'emit sendUserData(data);' | Code: " << data.code << std::endl;
    }

}
