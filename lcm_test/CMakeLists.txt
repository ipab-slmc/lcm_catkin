cmake_minimum_required(VERSION 2.8.3)
project(lcm_test)

find_package(catkin REQUIRED COMPONENTS
  roscpp
  drc_lcmtypes
)

catkin_package()

include_directories(
  ${catkin_INCLUDE_DIRS}
)

add_executable(test_node src/test.cpp)
target_link_libraries(test_node ${catkin_LIBRARIES})
