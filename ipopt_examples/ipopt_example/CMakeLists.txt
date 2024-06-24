cmake_minimum_required(VERSION 3.0.2)
project(ipopt_example)

add_executable(cppad_example
  src/cppad_example.cpp
)
target_link_libraries(cppad_example
    ipopt
)

link_directories(/usr/local/lib)

add_executable(cppad_ipopt_example
  src/cppad_ipopt_example.cpp
)
target_link_libraries(cppad_ipopt_example
    ipopt
)