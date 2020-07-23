program main
  use object_interface, only : object
  use fuel_element_interface, only : fuel_element
  implicit none
  type(object) foo 
  type(fuel_element) bar
  
  print *,foo%user_defined()

  print *,bar%user_defined()
  
end program main
