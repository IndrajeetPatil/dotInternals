# it produces error outside of package

    This function can only be run in the package root directory.

# it changes only internal *function* names without `.` prefix

    Code
      dotInternals:::.extract_internal_function_names()
    Output
      [1] "if1" "if2"

# it changes function names

    Code
      dotInternals::dot_internals()
    Message <rlang_message>
      Prefixing names of 2 internal functions with a `.`
    Message <cliMessage>
      * `if1()`
      * `if2()`
      --------------------------------------------------------------------------------
      v Internal function names successfully changed.
      ! Please review the changes carefully!
      i Re-document with `roxygen2::roxygenise()`.
      --------------------------------------------------------------------------------

---

    Code
      dotInternals:::.extract_internal_function_names()
    Output
      character(0)

---

    Code
      dotInternals::dot_internals()
    Message <cliMessage>
      i There are no internal functions whose names need to be changed.

