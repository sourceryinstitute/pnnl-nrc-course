module fuel_element_interface
  !! Define the fuel_element type and type-bound procedure interface bodies
  use object_interface, only : object
  implicit none

  private
  public :: fuel_element

  type, extends(object) :: fuel_element
    !! Encapsulate fuel element data and inherit user-definition
    !! functionality from the object parent.
    private
    real pitch_
  contains
    procedure :: define
    procedure :: pitch
  end type

  interface

    module subroutine define(me, pitch)
      !! Define a whole fuel_element object
      class(fuel_element), intent(out) :: me
      real, intent(in) :: pitch
    end subroutine 

    pure module function pitch(me) result(my_pitch)
      !! Get the pitch value
      class(fuel_element), intent(in) :: me
      real my_pitch
    end function

  end interface

end module
