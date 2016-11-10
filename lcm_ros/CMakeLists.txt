cmake_minimum_required(VERSION 2.8.3)
project(lcm_ros)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")

find_package(catkin REQUIRED COMPONENTS oh-distro
)

find_package(PkgConfig REQUIRED)
pkg_check_modules(LCM REQUIRED lcm>=1.3.0)
find_package(Java)
list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

catkin_package(
  CATKIN_DEPENDS
  DEPENDS oh-distro LCM Java 
  CFG_EXTRAS lcmtypes.cmake
)

include_directories(
  include
  ${LCM_INCLUDE_DIRS}
  ${catkin_INCLUDE_DIRS}
)

link_directories(${LCM_LIBRARY_DIRS})

install(DIRECTORY cmake
        DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}
        PATTERN ".svn" EXCLUDE)


