module fuel_element_interface
  !! Define the fuel_element type and type-bound procedure interface bodies
  use object_interface, only : object
  use oracle_interface, only : oracle
  implicit none

  private
  public :: fuel_element

  type, extends(oracle) :: fuel_element
    !! Encapsulate fuel element data and inherit user-definition
    !! functionality from the object parent.
    private
    real pitch_
  contains
    procedure :: subtract
    procedure :: norm
    procedure :: define
    procedure :: pitch
    procedure :: write_formatted
  end type

  interface

    module subroutine define(me, pitch)
      !! Define a whole fuel_element object
      class(fuel_element), intent(out) :: me
      real, intent(in) :: pitch
    end subroutine 

    pure module function norm(me) result(my_norm)
      !! Compute a norm of my state vector
      class(fuel_element), intent(in) :: me
      real my_norm
    end function

    module function subtract(me, rhs) result(difference)
      !! Result is the difference between my state vector and that of the RHS operand
      class(fuel_element), intent(in) :: me
      class(oracle), intent(in) :: rhs
      class(oracle), allocatable :: difference
    end function

    elemental module function pitch(me) result(my_pitch)
      !! Get the pitch value
      class(fuel_element), intent(in) :: me
      real my_pitch
    end function

    module subroutine write_formatted(me, unit, edit_descriptor, v_list, iostat, iomsg)
      !! Interface for the fuel_element's formatted writes
      class(fuel_element), intent(in) :: me
      integer, intent(in) :: unit
      character(len=*), intent(in) :: edit_descriptor
      integer, intent(in) :: v_list(:)
      integer, intent(out) :: iostat
      character(len=*), intent(inout) :: iomsg
    end subroutine

  end interface

end module
