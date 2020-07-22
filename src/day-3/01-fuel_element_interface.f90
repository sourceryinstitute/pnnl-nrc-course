module fuel_element_interface
  !! Define the fuel_element type and type-bound procedure interface bodies
  implicit none

  private
  public :: fuel_element

  type fuel_element
    real pitch_
    logical :: defined
  contains
    procedure :: user_defined
    procedure :: pitch
    procedure :: define
  end type

  interface

    pure module function user_defined(me) result(me_defined)
      !! Report whether me has been defined

      class(fuel_element), intent(in) :: me
        !! passed-object dummy argument
      logical me_defined

      ! Fortran 90 version:
      ! import fuel_element
      ! type(fuel_element), intent(in) :: me

    end function

    module subroutine define(me, pitch)
      !! Define a whole fuel_element object
      class(fuel_element), intent(out) :: me
        !! intent(out) provides no access to incoming state.  We use
        !! intent(out) to indicate that everything will be overwritten
        !! and so that the compiler will  prevent any use of incoming
        !! values.
      real, intent(in) :: pitch
    end subroutine 

    pure module function pitch(me) result(my_pitch)
      !! Get the pitch value
      class(fuel_element), intent(in) :: me
      real my_pitch
    end function

  end interface

end module
