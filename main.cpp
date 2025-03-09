#include "libs/includes.h"

std::string time_now() {
    std::time_t t = std::time(0);   // get time now
    std::tm* now = std::localtime(&t);

    std::string formated_time = "[" + std::to_string(now->tm_hour) + ":" + std::to_string(now->tm_min) + ":" + std::to_string(now->tm_sec) + "]";
    return formated_time;
}

int main() {

    std::cout << "Hi. Time now: " << time_now() << std::endl;

    return 0;
}
