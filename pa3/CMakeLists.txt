cmake_minimum_required(VERSION 3.17)
project(pa3 C)

set(CMAKE_C_STANDARD 11)

set (CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -Wextra")

#set (CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS_DEBUG} -fno-omit-frame-pointer -fsanitize=address")
#set (CMAKE_LINKER_FLAGS_DEBUG "${CMAKE_LINKER_FLAGS_DEBUG} -fno-omit-frame-pointer -fsanitize=address")

add_executable(pa3 first.c cache.c cache.h)