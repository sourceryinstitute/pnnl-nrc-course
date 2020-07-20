program hello
  implicit none
  integer, parameter :: max_greeting_len = 1024
  character(len=max_greeting_len) greeting[*]
  integer image

  associate(me=>this_image(), ni=>num_images())
    write(greeting,*) "Hello from image ",me," of ",ni
    sync all

    if (me==1) then
      do image=1,ni
        print *, "greeting from image ",image,":", trim(adjustl(greeting[image]))
      end do
    end if
  end associate
end program hello
