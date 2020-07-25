add_executable(modular-hello-documented  00-modular-hello-documented.f90)
add_executable(co_sum      03-co_sum.f90)
add_executable(co_reduce   04-co_reduce.f90)

target_link_libraries(modular-hello-documented PRIVATE utilities)
target_link_libraries(co_sum  PRIVATE utilities)
