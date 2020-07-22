module dog_module
  implicit none

  integer, parameter :: max_length=32

  type dog
    character(len=max_length) name
    integer age
  end type

end module

program main
  use dog_module, only : dog
  implicit none

  type(dog) mikey

  mikey = dog("Mikey", 6)             

end program main
