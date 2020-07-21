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

  ! interface

  !   subroutine co_all( a ) 
  !     logical, intent(inout) :: a
  !   end subroutine

  !   subroutine co_reduce(a, operation)
  !     logical, intent(inout) :: a
  !     ! operation is the name of a pure function that takes two logical 
  !     ! arguments and produces one result that is .true. if and only if
        ! both arguments are true.
  !   end subroutine

  ! interface

end program
