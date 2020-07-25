submodule(assertion_interface) assertion_implementation
  !! define the assert procedure
  implicit none

contains

  module procedure assert

    if (assertions) then
      ! eliminate the executable code if assertions are turned off
      if (.not. assertion) error stop description
    end if

  end procedure

end submodule
