cmake_minimum_required(VERSION 3.15)

set (PNNL_NRC_VERSION "1.0.0")
set (ALLOWED_BUILD_TYPES "Debug" "Release")

get_property(multi_config GLOBAL PROPERTY GENERATOR_IS_MULTI_CONFIG)
if(multi_config)
  set (CMAKE_CONFIGURATION_TYPES "${ALLOWED_BUILD_TYPES}" CACHE STRING "list of supported configuration types" FORCE)
else()
  set (CMAKE_BUILD_TYPE "Debug" CACHE STRING "Select which configuration to build.")
  set_property (CACHE CMAKE_BUILD_TYPE PROPERTY STRINGS ${ALLOWED_BUILD_TYPES})
endif()

file    (READ ${CMAKE_CURRENT_LIST_DIR}/graphics/text-art.txt LOGO)
string  (JOIN "\n " GREETING "${LOGO}" "Version: ${PNNL_NRC_VERSION}\n Build type: ${CMAKE_BUILD_TYPE}\n")
message (STATUS "\n${GREETING}")

project(pnnl_nrc
  VERSION "${PNNL_NRC_VERSION}"
  LANGUAGES Fortran
  DESCRIPTION "Autoliv Inflator Prediction Program"
)

if ("${PROJECT_SOURCE_DIR}" STREQUAL "${PROJECT_BINARY_DIR}")
  message(FATAL_ERROR
    "\n"
    "Error: PROJECT_SOURCE_DIR matches PROJECT_BINARY_DIR: ${PROJECT_BINARY_DIR}\n"
    "This project does not support identical build and source paths.\n"
    "Please delete ${PROJECT_SOURCE_DIR}/CMakeCache.txt and ${PROJECT_SOURCE_DIR}/CMakeFiles/"
    "and then build in a different directory.  This may be accomplished in a bash shell by executing\n"
    "  rm -r CMakeCache.txt CMakeFiles/\n"
    "  mkdir build\n"
    "  cd build\n"
    "  export CC=gcc FC=gfortran\n"
    "  cmake .. \n"
    "or by substituting the appropriate syntax for shells other than bash."
  )
endif()

list(INSERT CMAKE_MODULE_PATH 0 "${PROJECT_SOURCE_DIR}/cmake/modules")
include(AddCafTest)

set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreaded$<$<CONFIG:Debug>:Debug>")
if(MSVC)
   string(APPEND CMAKE_EXE_LINKER_FLAGS " -STACK:10000000000")
endif()

set(CMAKE_Fortran_MODULE_DIRECTORY "${CMAKE_BINARY_DIR}/mod")

foreach(directory src)
  add_subdirectory("${directory}")
endforeach()

enable_testing()

foreach(example  concurrent-hello  pure-hello  flying-blind  modular-hello)
  add_caf_test("${example}" 4  "src/day-1/" "${example}")
endforeach()

foreach(example  modular-hello-documented  co_sum  co_reduce)
  add_caf_test("${example}" 4  "src/day-2/" "${example}")
endforeach()

add_caf_test("pitch" 4  "src/day-3/" "pitch")

foreach(example  private-pitch  polymorphism  uddtio  oracle)
  add_caf_test("${example}" 4  "src/day-4/" "${example}")
endforeach()
