function(add_caf_test name num_caf_img working_dir test_target)
  add_test(NAME ${name}
    COMMAND cafrun -n ${num_caf_img} ./${test_target}
    WORKING_DIRECTORY "${working_dir}"
  )
  set_tests_properties(${name}
    PROPERTIES
    PASS_REGULAR_EXPRESSION "Test passed."
    PROCESSORS ${num_caf_img})
endfunction()
