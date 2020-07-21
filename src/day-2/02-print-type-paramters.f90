program main
  use iso_fortran_env, only : real64
  implicit none
  real(real64), parameter :: pi_64_oops = 3.14159265358979323846
  real(real64), parameter :: pi_64 = 3.14159265358979323846_real64
  print *,pi_64_oops, pi_64
  print *, range(pi_64_oops), range(pi_64)
  print *, precision(pi_64_oops), precision(pi_64)
end program
