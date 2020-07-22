program main
  !! Test fuel_element defintion
  use fuel_element_interface, only : fuel_element
  implicit none
  real :: expected_pitch = 1.
  type(fuel_element) fuel_rod
  
  fuel_rod%pitch_ = expected_pitch ! violates the abstraction
  fuel_rod%defined = .true.       ! violates the abstraction

  ! call fuel_rod%define(pitch = expected_pitch)
   

  call time_loop(fuel_rod)

  print *, "Test passed."

contains

  subroutine time_loop(rod)
    use assertion_interface, only : assert
    type(fuel_element), intent(inout) :: rod
    integer i
    real, parameter :: tolerance = 1.E-6

    call assert(rod%user_defined(), "rod%user_defined()")

    ! Fortran 90 version:
    ! call assert(user_defined(rod), "user_defined(rod)")

    call assert(abs(rod%pitch()-expected_pitch) < tolerance, &
               "abs(rod%pitch()-expected_pitch) < tolerance")

  end subroutine

end program main
