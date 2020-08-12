cmake_minimum_required(VERSION 3.16)
project(third C)

set(CMAKE_C_STANDARD 11)

set(Sources third.c)

set (CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -Wextra")

add_executable(third third.c)