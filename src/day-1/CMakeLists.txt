add_executable(flying-blind  
  05-assertion_utility.f
  06-flying-blind.f90 
)

add_library(utilities
  assertion_interface.f90
  assertion_implementation.f90
  ../day-2/kind_parameters.f90
)

foreach(main_program_file_base_name
  03-concurrent-hello
  04-pure-hello
  08-modular-hello
)
  string(REGEX REPLACE "^[0-9]*-" "" base_without_prefix "${main_program_file_base_name}")
  set(target_name "${base_without_prefix}")
  message(STATUS "target_name: ${target_name}")
  add_executable("${target_name}"  "${main_program_file_base_name}.f90")
  target_link_libraries(${target_name} PRIVATE utilities)
endforeach()
