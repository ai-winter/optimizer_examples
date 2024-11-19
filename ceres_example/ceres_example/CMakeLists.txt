cmake_minimum_required(VERSION 3.0.2)
project(ceres_example)

set(CMAKE_CXX_STANDARD 17)
find_package(Python3 REQUIRED COMPONENTS Interpreter Development NumPy)

get_filename_component(PROJECT_ROOT_DIR ${CMAKE_SOURCE_DIR} DIRECTORY)
include(${PROJECT_ROOT_DIR}/ceres_dir/conanbuildinfo.cmake)
conan_basic_setup()

add_executable(ceres_example_powell
  src/powell_example.cpp
)

add_executable(ceres_example_curve_fitting
  src/curve_fitting_example.cpp
)

target_include_directories(ceres_example_powell PUBLIC
  ${CONAN_INCLUDE_DIRS}
)

target_link_libraries(ceres_example_powell
  ${CONAN_LIBS}
)

target_include_directories(ceres_example_curve_fitting PUBLIC
  ${CONAN_INCLUDE_DIRS}
)

message("${PYTHON_LIBRARIES}")
target_link_libraries(ceres_example_curve_fitting
  ${CONAN_LIBS}
  Python3::Python
  Python3::NumPy
)