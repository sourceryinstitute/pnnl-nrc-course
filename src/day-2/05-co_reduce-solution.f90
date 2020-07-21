program main
  !! Test co_sum by summing image numbers
  implicit none
  integer image
  integer, parameter :: reporting_image=1

  associate(me=>this_image())

    image = me
    call co_sum(image)
      ! collective sum of image numbers across all images,
      ! placing the result only on reporting_image 

    verify_sum: &
    block 
      integer i
      logical test_passed

        associate( expected_sum => sum( [(i, i=1,num_images())]) )
          ! construct an array of image numbers using an implied do
          ! loop and sum the array

          test_passed = (image==expected_sum)
          call co_all(test_passed) 
          
          if (test_passed .and. me==reporting_image) print *,"Test passed."
        end associate
    end block verify_sum

  end associate

contains

  pure function both(lhs, rhs) result(lhs_and_rhs)
    !! result is true if a lhs and rhs are true
    logical, intent(in) :: lhs, rhs
    logical lhs_and_rhs 
    lhs_and_rhs = (lhs .and. rhs)
    ! alternative: lhs_and_rhs = all( [lhs, rhs] )
  end function
 
  subroutine co_all( a ) 
    !! result is true if a is true on all images
    logical, intent(inout) :: a
    call co_reduce(a, both)
  end subroutine

end program
