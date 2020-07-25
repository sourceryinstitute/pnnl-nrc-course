submodule(fuel_element_interface) fuel_element_implementation
  !! Define the fuel_element type-bound procedures
  use assertion_interface, only : assert
  implicit none

  enum, bind(C)
    enumerator :: LISTDIRECTED, FORMATTED, UNFORMATTED
    !! these names correspond to integer(c_int) values assigned by the compiler
    !! in the manner C does for enumerations (starting with 0 and incrementing by 1)
  end enum 

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

      select case(edit_descriptor)
      case("LISTDIRECTED")
        print *,"pitch = ", me%pitch_
      case("FORMATTED")
        error stop "fuel_element%write_formatted: formatted output not yet implemented"
      case("UNFORMATTED")
        error stop "fuel_element%write_formatted: unformatted output not yet implemented"
      case default
        error stop "fuel_element%write_formatted: unrecognized edit_descriptor"
      end select
      
      ! The alternative is more general:
      ! if (edit_descriptor == "LISTDIRECTED") then
      ! else if (edit_descriptor == "FORMATTED") then
      !   !...
      ! else
      !   error stop "fuel_element%write_formatted: unrecognized edit_descriptor"
      ! end if
      
      print *,"pitch = ", me%pitch_

      ! No arguments are optional so the compiler passes default values
      ! if the user does nothing to make the arguments otherwise.  They might
      ! have zero values if scalor, zero-sizei if arrays, or zero length if
      ! character values
      !      
      ! print *,"unit = ",unit
      ! print *,"edit_descriptor = ",edit_descriptor
      ! print *,"v_list = ",v_list
      ! print *,"iostat = ",iostat
      ! print *,"iomsg= ",iomsg
    end procedure 

end submodule fuel_element_implementation
