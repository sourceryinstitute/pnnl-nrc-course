module oracle_interface
  !! Template method pattern for checking actual numerical results against 
  !! reference results.
  use object_interface, only : object
  use assertion_interface, only : assert
  implicit none
  
  type, extends(object), abstract :: oracle  
  contains
    procedure :: within_tolerance
    procedure(binary_operator), deferred :: subtract
    procedure(norm_interface), deferred :: norm
    generic :: operator(-) => subtract !, negate
  end type

  interface

    module function within_tolerance(me, reference, tolerance) result(is_in_tolerance)
      implicit none
      class(oracle), intent(in) :: me , reference
      real, intent(in) :: tolerance
      logical is_in_tolerance
    end function

  end interface

  abstract interface

    module function binary_operator(me, rhs) result(difference)
      class(oracle), intent(in) :: me , rhs
      class(oracle), allocatable :: difference

      ! Alternative precludes subsequent %norm invocation
      ! real, allocatable :: difference(:)
    end function

    pure module function norm_interface(me) result(my_norm)
      class(oracle), intent(in) :: me
      real my_norm

      ! Alternative precludes subsequent %norm invocation
      ! real, allocatable :: difference(:)
    end function

  end interface

end module oracle_interface
