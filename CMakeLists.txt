cmake_minimum_required(VERSION 3.11)
set(CMAKE_CXX_STANDARD 20)
project(Keyz)

include(FetchContent)

FetchContent_Declare(json URL https://github.com/nlohmann/json/releases/download/v3.11.3/json.tar.xz)
FetchContent_MakeAvailable(json)

add_executable(keyz_out libs/includes.h libs/core.h libs/core.cpp main.cpp)
target_link_libraries(keyz_out PRIVATE nlohmann_json::nlohmann_json)