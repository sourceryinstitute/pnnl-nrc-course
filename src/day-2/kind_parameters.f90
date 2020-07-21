module kind_parameters
  implicit none
  private
  public :: ikind
  public :: rkind

  integer, parameter :: decades=9
  integer, parameter :: ikind = selected_int_kind(decades)
  integer, parameter :: range_=307, precision_=15
  integer, parameter :: rkind = selected_real_kind(r=range_, p=precision_)
end module
