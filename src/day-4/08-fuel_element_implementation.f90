submodule(fuel_element_interface) fuel_element_implementation
  !! Define the fuel_element type-bound procedures
  use assertion_interface, only : assert
  implicit none

contains

    module procedure define
      me%pitch_ = pitch
      call me%mark_as_defined
    end procedure

    module procedure pitch
      call assert(me%user_defined(), "fuel_element%pitch: me%user_defined()" )
      my_pitch = me%pitch_
    end procedure 

    module procedure write_formatted
      call assert(me%user_defined(), "fuel_element%write_formatted: me%user_defined()" )
      print *,"pitch = ", me%pitch_
    end procedure 

end submodule fuel_element_implementation
