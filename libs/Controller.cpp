#include "Controller.h"
#include <iostream>

Controller::Controller(QObject *parent) : QObject(parent) {}

void Controller::handleLogin(const QString &text) {
    std::cout << "QML TEXT: " << text.toStdString() << std::endl;
}
