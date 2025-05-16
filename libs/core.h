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
    AddResponse add_user_password(const AddRequest& data);                           // Добавления пароля в базу.             //
    GetResponse get_user_password(const GetRequest& data);                          // Отправка пароля пользователю (дехеш). //
    GetPasswdListResponse get_user_passwords(std::string userid);                  // Получаем все пароли.                  //
private:
    nlohmann::json read_base();
};
