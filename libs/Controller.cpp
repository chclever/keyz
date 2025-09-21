#include "Controller.h"

Controller::Controller(Core &core, QObject *parent) : QObject(parent) , core(core) {}

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
