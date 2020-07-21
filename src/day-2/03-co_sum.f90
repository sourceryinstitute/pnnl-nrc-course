program main
  !! Test co_sum by summing image numbers
  use assertion_interface, only : assert
  implicit none
  integer image
  integer, parameter :: reporting_image=1

  associate(me=>this_image())

    image = me
    call co_sum(image, result_image=reporting_image)
      ! collective sum of image numbers across all images,
      ! placing the result only on reporting_image 

    verify_sum: &
    block 
      integer i

      if (me==reporting_image) then
        call assert(image == sum( [(i, i=1,num_images())]) , &
                   "image == sum( [(i, i=1,num_images())])" )
          ! construct an array of image numbers using an implied do
          ! loop and sum the array

        print *,"Test passed."
      end if
    end block verify_sum

    just_for_show: &
    associate( immutable => (image), mutable => image)
      !! demonstrate difference between associating with a variable
      !! versus an expression
    end associate just_for_show

  end associate

end program
