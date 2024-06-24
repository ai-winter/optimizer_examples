cmake_minimum_required(VERSION 3.0.2)
project(osqp_example)

find_package(osqp REQUIRED)
find_package(OsqpEigen REQUIRED)
find_package(Eigen3 REQUIRED)

add_executable(osqp_example
  src/osqp_example.cpp
)

add_executable(osqp_eigen_example
  src/osqp_eigen_example.cpp
)

target_link_libraries(osqp_example
  osqp
)


target_link_libraries(osqp_eigen_example
  osqp::osqp
  OsqpEigen
)