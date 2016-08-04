CMAKE_MINIMUM_REQUIRED(VERSION 2.8)
PROJECT(square)


find_package(CUDA QUIET REQUIRED)

# Specify binary name and source file to build it from
cuda_add_executable(
        square
        include/funcs.h
        funcs.cpp
        src/square.cu
        src/double.cu
        main.cpp)

