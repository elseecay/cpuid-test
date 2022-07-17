cmake_minimum_required(VERSION 3.5)

project(cpuid LANGUAGES CXX ASM)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_executable(cpuid main.cpp cpuid.s)
