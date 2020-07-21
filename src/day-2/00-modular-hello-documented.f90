program hello
  !! Image 1 prints greetings created by each other image
  use iso_fortran_env, only : output_unit, int32
    !! import unit number from standard module
  use assertion_interface, only : assert
    !! import the assert subroutine and only that subroutine
  use kind_parameters, only : ikind, rkind
    !! import kind parameter specifying a desired integer range
  implicit none
    !! enforcing that entities used in the program must be declared
  integer(kind=int32), parameter :: max_greeting_len = 1024
    !! declare an integer constant (parameter indicate constant)
    !! of size 32 bits.
  integer(ikind), parameter :: reporting_image=1
    !! declare integer constant of ikind kind
  integer, parameter :: first_image = 1
    !! declare a default integer constant
  character(len=max_greeting_len) greeting[*]
    !! declaress a character variable of the length specified by the
    !! length type parameter "len".
  real unused
  complex, parameter :: i=(0.,1.)
  complex :: z=(1.,0.)
  real(rkind) :: pi = 3.141592654_rkind

  associate(me=>this_image(), ni=>num_images())
    !! define associate names as aliases
    !! associating with a function result or expression, then 
    !! the associate (me or ni) is a "runtime constant" (immutable)
    !! which consistent with the functional programming paradigm
    write(greeting,*) "Hello from image ",me," of ",ni
      !! internal file output: inserts the string into the greeting
      !! character variable
    sync all
      !! image control statemt: orders segments of execution
      !! every image waits here until every image gets here


    test_greeting: &  !! continuation character joining two lines
    block
      !! define a local scope for declarations
      integer image
      character(len=max_greeting_len) expected_greeting
      character(len=max_greeting_len) remote_image_greeting

        if (me==1) then
          do concurrent(image=2:ni)
            !! specify that loop iterations are independent
            !! do image = first_image, ni
            write(expected_greeting,*) "Hello from image ",image," of ",ni
            remote_image_greeting = greeting[image]
              !! square brackets indiates communication: getting the
              !! greeting from another image
            call assert(remote_image_greeting == expected_greeting, "remote_image_greeting == expected_greeting")
          end do
        end if

    end block test_greeting

    sync all
    if (me==reporting_image) write(unit=output_unit,fmt='(a)') "Test passed."
  end associate

end program hello
