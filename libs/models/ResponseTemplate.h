#include <string>

#ifndef PASSWORDTEMPLATE 
#define PASSWORDTEMPLATE

struct ResponseTemplate {
    int code; // Код ответа
    std::string comment; // Комментарий для логов
};

#endif
