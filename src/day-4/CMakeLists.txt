add_executable(private-pitch 
  00-pitch.f90
  01-fuel_element_interface.f90
  02-fuel_element_implementation.f90
  03-object_interface.f90
  04-object_implementation.f90
)
target_link_libraries(private-pitch  utilities)

add_executable(polymorphism
  01-fuel_element_interface.f90
  02-fuel_element_implementation.f90
  03-object_interface.f90
  04-object_implementation.f90
  05-polymorphism.f90
)
target_link_libraries(polymorphism utilities)

add_executable(uddtio
  04-object_implementation.f90
  06-abstract_object_interface.f90
  07-fuel_element_interface.f90
  08-fuel_element_implementation.f90
  09-ud-dtio.f90
)
target_link_libraries(uddtio utilities)

add_executable(oracle
  04-object_implementation.f90
  06-abstract_object_interface.f90
  10-oracle_interface.f90
  11-fuel_element_interface.f90
  12-test-fuel_element.f90
  13-fuel_element_implementation.f90
  14-oracle_implementation.f90
)
target_link_libraries(oracle utilities)
