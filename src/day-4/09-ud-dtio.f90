program main
  !! Demonstrate user-defined derived type input/output (UDDTIO)
  use fuel_element_interface, only : fuel_element
  implicit none
  type(fuel_element) fuel_rod
  
  call fuel_rod%define(pitch=2.0)

  print *, fuel_rod

end program main
