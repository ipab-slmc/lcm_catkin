cmake_minimum_required(VERSION 2.8.3)
project(oh-distro)
find_package(catkin REQUIRED)

catkin_package(
  CFG_EXTRAS oh-distro.cmake
)

install(DIRECTORY cmake
        DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}
        PATTERN ".svn" EXCLUDE)
