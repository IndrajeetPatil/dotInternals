# it produces error outside of package

    This function can only be run in the package root directory.

# it produces expected message when no internal functions are found

    Code
      dot_internals()
    Message <cliMessage>
      i There are no internal functions whose names need to be changed.

# it changes only internal *function* names without `.` prefix

    Code
      dotInternals:::.extract_internal_function_names()
    Output
      [1] "if1" "if2"

