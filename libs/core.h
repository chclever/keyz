#include "includes.h"

// include structures
#include "models/User.h"
#include "models/Password.h"
#include "models/PasswordInfo.h"
#include "models/ResponseTemplate.h"

// Users/{TOKEN}.dat <- PLATFORM:LOGIN:HASH //
struct GetRequest : User {};
struct GetResponse : ResponseTemplate, Password {};

struct AddResponse : ResponseTemplate {};
struct AddRequest : User, Password {};  

struct GetPasswdListResponse : ResponseTemplate {
    std::vector<PasswordInfo> password_data; // Все строки в файле.
};

class Core {
public:
    GetResponse get(GetRequest data); // Отправка пароля пользователю (дехеш). 
    AddResponse add(AddRequest data); // Добавления пароля в базу.
    GetPasswdListResponse get_passwords(std::string userid); // Получаем все пароли.
};
