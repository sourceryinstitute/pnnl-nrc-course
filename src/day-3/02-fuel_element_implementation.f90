submodule(fuel_element_interface) fuel_element_implementation
  !! Define the fuel_element type-bound procedures
  implicit none

contains

    pure module function user_defined(me) result(me_defined)
      class(fuel_element), intent(in) :: me
      logical me_defined
      me_defined = me%defined
    end function

    module subroutine define(me, pitch)
      class(fuel_element), intent(out) :: me
      real, intent(in) :: pitch
      me%pitch_ = pitch
      me%defined = .true.
    end subroutine 

    pure module function pitch(me) result(my_pitch)
      class(fuel_element), intent(in) :: me
      real my_pitch
      my_pitch = me%pitch_
    end function

end submodule fuel_element_implementation
