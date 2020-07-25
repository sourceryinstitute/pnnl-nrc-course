module assertion_interface
  !! Utiltiy for checking runtime constraints
  implicit none

  private
  public :: assert

  logical, parameter :: assertions=.true.
    ! toggle assertions off (.false.) or on (.true.) via a compile-time constant
    ! that enables an optimizing compiler to eliminate the executable statements
    ! via dead-code removal.

  interface
    ! interface block
  
    pure module subroutine assert(assertion, description)
      !! interface body for a module subroutine to error terminate if assertion is false
      implicit none
      logical, intent(in) :: assertion
        !! usually an expression that must be true for subsequent code to work
      character(len=*), intent(in) :: description
        !! a statement of what is being asserted (might be a literal copy of the expression)
    end subroutine
  
  end interface

end module
