module dog_module
  implicit none

  integer, parameter :: max_length=32

  private ! Information hiding
  public :: dog
  

  type dog
    !! Encapsulate information descriing a dog abstraction
    private ! make components private
    character(len=max_length) name
    integer age
  end type

end module

program main
  use dog_module, only : dog
  implicit none

  type(dog) mikey

  mikey = dog("Mikey", 6)             

  !print *, mikey%description()        ! print *, description(mikey)
  !print *, mikey%speak("Gruff Gruff") ! print *, speak("Gruff Gruff")
 
end program main
