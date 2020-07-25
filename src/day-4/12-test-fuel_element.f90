program main
  use fuel_element_interface, only : fuel_element
  implicit none
  type(fuel_element) fuel_rod, reference_rod
  real, parameter :: reference_pitch=3.0

  call fuel_rod%define(pitch=reference_pitch)
  call reference_rod%define(pitch=reference_pitch)

  if (fuel_rod%within_tolerance(reference_rod, tolerance=1.E-6)) print *,"Test passed."
   
end program main
