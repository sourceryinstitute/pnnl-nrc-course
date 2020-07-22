module dog_interface
  !! Translate dog.py python program
  implicit none

  type Dog
    private
    character(len=:), allocatable :: name
    integer age
  contains
    procedure description
    procedure speak
  end type

  interface Dog
    module procedure construct_dog
  end interface

  character(len=*), parameter :: species = "mammal"

  interface

    pure module function construct_dog(name, age) result(new_dog)
      implicit none
      character(len=*), intent(in) :: name
      integer, intent(in) :: age
      type(Dog) new_dog
    end function

    pure module function description(me) result(my_description)
      implicit none
      class(Dog), intent(in) :: me
      character(len=:), allocatable :: my_description
    end function

    pure module function speak(me, sound) result(my_speech)
      implicit none
      class(Dog), intent(in) :: me
      character(len=*), intent(in) :: sound
      character(len=:), allocatable :: my_speech
    end function

  end interface

end module

submodule(dog_interface) dog_implementation
  implicit none
contains

    module procedure construct_dog
      new_dog%name = name
      new_dog%age = age
    end procedure

    module procedure description
      character(len=*), parameter :: max_age='999'
      character(len=len(max_age)) my_age

      write(my_age,'(i3)') me%age
      my_description = me%name // " is " // my_age // " years old"
    end procedure

    module procedure speak
      my_speech = me%name // " says " // sound
    end procedure

end submodule


program main
  use dog_interface
  implicit none

  type(Dog) mikey

  mikey = Dog("Mikey", 6)
  print *, mikey%description()
  print *, mikey%speak("Gruff Gruff")
  print *, species
end program main
