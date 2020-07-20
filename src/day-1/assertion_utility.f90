module assertion_utility
  implicit none

  logical, parameter :: assertions=.true.

contains

  pure subroutine assert(assertion, description)
    !! module subroutine to error terminate if assertion is false
    logical, intent(in) :: assertion
    character(len=*), intent(in) :: description

    if (assertions) then
      if (.not. assertion) error stop description
    end if
  end subroutine

end module
