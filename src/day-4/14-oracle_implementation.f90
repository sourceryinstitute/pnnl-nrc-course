submodule(oracle_interface) oracle_implementation
  implicit none
  
contains
 
  module procedure within_tolerance

    class(oracle), allocatable :: error 

    call assert(all([me%user_defined(), reference%user_defined()]), &
               "(all([me%user_defined(), reference%user_defined()]) in oracle%within_tolerance")

    error = me - reference
    is_in_tolerance = (error%norm() <= tolerance)

  end procedure

end submodule oracle_implementation
