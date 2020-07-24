submodule(fuel_element_interface) fuel_element_implementation
  !! Define the fuel_element type-bound procedures
  use assertion_interface, only : assert
  implicit none

contains

    module procedure define
      me%pitch_ = pitch
      call me%mark_as_defined
    end procedure

    module procedure subtract
      type(fuel_element), allocatable :: local_difference
        ! prevent a nested second level of type guarding

      call assert(all([me%user_defined(), rhs%user_defined()]), &
                 "all([me%user_defined(), rhs%user_defined()]) in fuel_element%subtract" )
      call assert(same_type_as(me, rhs), "fuel_element%subtract: same_type_as(me, rhs)")

      select type(rhs)
        type is(fuel_element)
          allocate(local_difference)
          local_difference%pitch_ = me%pitch_ - rhs%pitch_
          call difference%mark_as_defined
        class default
          error stop "fuel_element%subtract: unsupported rhs type" 
      end select

      difference = local_difference

      ! Alternative:
      ! select type(rhs)
      !   type is(fuel_element)                               ! Alternative alloacations:

      !     allocate( fuel_element :: difference, stat=istat) ! Typed allocation
      !     allocate( difference, mold=rhs)                   ! Mold allocation (Prototype Pattern)

      !     select type(difference) 
      !        type is(fuel_element)
      !          difference%pitch_ = me%pitch_ - rhs%pitch_
      !          call difference%mark_as_defined
      !        class default
      !          error stop "unsupported difference type"
      !     end select

      !   class default
      !     error stop "fuel_element%subtract: unsupported rhs type" 
      ! end select

    end procedure

    module procedure norm
      call assert(me%user_defined(), "fuel_element%norm: me%user_defined()")
      my_norm = abs(me%pitch_)
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
      
      print *,"pitch = ", me%pitch_
    end procedure 

end submodule fuel_element_implementation
