cmake_minimum_required(VERSION 3.16)
project(fourth C)

set(CMAKE_C_STANDARD 11)

set(Sources fourth.c)

set(GCC_COVERAGE_COMPILE_FLAGS "-Wall -Wextra")
set(CMAKE_CXX_FLAGS "${CMAKE_C_FLAGS} ${GCC_COVERAGE_COMPILE_FLAGS}" )

add_executable(fourth fourth.c)