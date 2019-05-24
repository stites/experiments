cmake_minimum_required(VERSION 3.13)
project(fpcpp-ch1)
set(CMAKE_CXX_STANDARD 17)

find_package(range-v3 REQUIRED)

add_executable(run_chapter1 Chapter1Examples.cpp)

install(TARGETS run_chapter1 DESTINATION bin)
