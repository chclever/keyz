cmake_minimum_required(VERSION 3.11)
set(CMAKE_CXX_STANDARD 20)
project(Keyz)

include(FetchContent)

FetchContent_Declare(json URL https://github.com/nlohmann/json/releases/download/v3.11.3/json.tar.xz)
FetchContent_MakeAvailable(json)
find_package(Qt6 REQUIRED COMPONENTS Quick)

qt_standard_project_setup()

qt_add_executable(keyz_out libs/includes.h libs/core.h libs/core.cpp libs/init.cpp libs/Controller.cpp main.cpp)

qt6_add_resources(
    keyz_out
    "resources"
    FILES
        UI/auth.qml
        UI/main.qml
        UI/app.qml
        UI/keyzScreen.qml
)
target_link_libraries(keyz_out PRIVATE nlohmann_json::nlohmann_json Qt6::Quick)


