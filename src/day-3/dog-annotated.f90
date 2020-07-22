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

  ! If the derived type components were private, we could not use
  ! the language's structure constructor.  We could instead write 
  ! a user-defined structure constructor and use a generic interface
  ! to give it the same name as the type:
  !
  ! interface Dog
  !   module procedure construct_dog
  ! end interface

  character(len=*), parameter :: species = "mammal"

contains

  ! User-defined structure desctructor
  ! pure module function construct_dog(name, age) result(new_dog)
  !   implicit none
  !   character(len=*), intent(in) :: name
  !   integer, intent(in) :: age
  !   type(Dog) new_dog
  !   new_dog%name = name
  !   new_dog%age = age
  ! end function

  pure module function description(me) result(my_description)
    implicit none
    class(Dog), intent(in) :: me
    character(len=:), allocatable :: my_description
    character(len=*), parameter :: max_age='999'
    character(len=len(max_age)) my_age
    write(my_age,'(i3)') me%age
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

  ! mikey = Dog(age=6, name="Mikey") ! allowed
  ! mikey = Dog(age=6, "Mikey") ! not allowed
end program main
