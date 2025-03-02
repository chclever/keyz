#include "includes.h"

// Users/{TOKEN}.dat <- PLATFORM:LOGIN:HASH 

struct GetRequest {

    std::string token; // id в системе для авторизации

    std::string platform; // steam, gmail и тд.

    std::string login; // чистый логин (платформы)
};

struct GetResponse {
    int code; // Код ответа

    std::string comment; // Комментарий для логов
    std::string password;
};

struct PasswordInfo {

    std::string platform;
    
    std::string login;
};

struct GetPasswdListResponse {
    int code; // Код ответа

    std::vector<PasswordInfo> password_data; // Все строки в файле.
    
    std::string comment; // Комментарий для логов
};

struct AddResponse {
    int code;

    std::string comment;
};

struct AddRequest {
    std::string token; // id в системе для авторизации

    std::string platform; // steam, gmail и тд.

    std::string login; // чистый логин (платформы)

    std::string password;
};



class Core {
public:
    GetResponse get(GetRequest data);
    GetPasswdListResponse get_passwords(std::string token);

    AddResponse add(AddRequest data);
};
