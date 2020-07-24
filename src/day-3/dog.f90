module dog_interface
  !! Translate dog.py python program
  implicit none

  type Dog
    character(len=:), allocatable :: name
    integer age
  contains
    procedure description
    procedure speak
  end type

  character(len=*), parameter :: species = "mammal"

contains

  pure module function description(me) result(my_description)
    implicit none
    class(Dog), intent(in) :: me
    character(len=:), allocatable :: my_description
    character(len=*), parameter :: max_age='19'
    character(len=len(max_age)) my_age
    write(my_age,'(i2)') me%age
    my_description = me%name // " is " // my_age // " years old"
  end function

  pure module function speak(me, sound) result(my_speech)
    implicit none
    class(Dog), intent(in) :: me
    character(len=*), intent(in) :: sound
    character(len=:), allocatable :: my_speech
    my_speech = me%name // " says " // sound
  end function

end module

program main
  use dog_interface
  implicit none

  type(Dog) mikey

  mikey = Dog("Mikey", 6)
  print *, mikey%description()
  print *, mikey%speak("Gruff Gruff")
  print *, species
end program main
