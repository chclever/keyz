#ifndef USER    
#define USER

#include "PasswordInfo.h"

struct User : PasswordInfo {
    std::string userid; // id в системе для авторизации
};

#endif