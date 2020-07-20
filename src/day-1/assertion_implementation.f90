submodule(assertion_interface) assertion_implementation
  implicit none

contains

  module procedure assert

    if (assertions) then
      if (.not. assertion) error stop description
    end if

  end procedure

end submodule
