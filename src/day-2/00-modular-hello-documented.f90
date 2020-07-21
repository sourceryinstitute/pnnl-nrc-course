program hello
  !! Image 1 prints greetings created by each other image
  use iso_fortran_env, only : output_unit
    !! import unit number from standard module
  use assertion_interface, only : assert
    !! import the assert subroutine and only that subroutine
  implicit none
    !! enforcing that entities used in the program must be declared
  integer, parameter :: max_greeting_len = 1024
  character(len=max_greeting_len) greeting[*]

  associate(me=>this_image(), ni=>num_images())
    write(greeting,*) "Hello from image ",me," of ",ni
    sync all

    block 
      integer image
      character(len=max_greeting_len) expected_greeting
      character(len=max_greeting_len) remote_image_greeting
      

        if (me==1) then
          do concurrent(image=1:ni)
            write(expected_greeting,*) "Hello from image ",image," of ",ni
            remote_image_greeting = greeting[image]
            call assert(remote_image_greeting == expected_greeting, "remote_image_greeting == expected_greeting")  
          end do
        end if

    end block

    sync all
    if (me==1) write(output_unit,'(a)') "Test passed."
  end associate

end program hello
