submodule(fuel_element_interface) fuel_element_implementation
  !! Define the fuel_element type-bound procedures
  implicit none

contains

    module subroutine define(me, pitch)
      class(fuel_element), intent(out) :: me
      real, intent(in) :: pitch
      me%pitch_ = pitch
      call me%mark_as_defined
    end subroutine 

    pure module function pitch(me) result(my_pitch)
      class(fuel_element), intent(in) :: me
      real my_pitch
      my_pitch = me%pitch_
    end function

end submodule fuel_element_implementation
