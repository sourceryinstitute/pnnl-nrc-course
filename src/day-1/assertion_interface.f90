module assertion_interface
  implicit none

  private
  public :: assert

  logical, parameter :: assertions=.true.

  interface
  
    pure module subroutine assert(assertion, description)
      !! module subroutine to error terminate if assertion is false
      implicit none
      logical, intent(in) :: assertion
      character(len=*), intent(in) :: description
    end subroutine
  
  end interface

end module
