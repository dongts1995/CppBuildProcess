cmake_minimum_required(VERSION 3.16)
project(CppBuildProcess C CXX)

add_library(math STATIC add.cpp sub.c)
target_include_directories(math PUBLIC include)

add_executable(main main.cpp)
target_link_libraries(main PRIVATE math)
