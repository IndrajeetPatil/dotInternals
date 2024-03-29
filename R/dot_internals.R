#' @title Prepend internal functions with a dot
#'
#' @description
#'
#' ```{r child="man/rmd-fragments/dot_internals_description.Rmd"}
#' ```
#'
#' @details
#'
#' ```{r child="man/rmd-fragments/dot_internals_details.Rmd"}
#' ```
#' @return
#'
#' Changed `.R` and `.Rmd` files with all instances of internal functions
#' replaced with their new "dotted" versions.
#'
#' @examples
#' if (FALSE) {
#'   # Assuming you are in the package root directory
#'   dot_internals()
#' }
#'
#' @export
dot_internals <- function() {
  if (isFALSE(.is_package())) {
    cli_abort("This function can only be run in the package root directory.")
  }

  files <- .find_source_files()
  fn_names <- .extract_internal_function_names()

  if (length(fn_names) == 0L) {
    cli_alert_info("There are no internal functions whose names need to be changed.")
    return(invisible())
  }

  cli_inform("Prefixing names of {length(fn_names)} internal functions with a `.`")
  purrr::walk(sort(fn_names), ~ cli_li("{.fn {.x}}"))

  purrr::walk(
    .x = fn_names,
    .f = ~ xfun::gsub_files(files, .x, paste0(".", .x))
  )

  cli_rule()
  cli_alert_success("Internal function names successfully changed.")
  cli_alert_warning("Please review the changes carefully!")
  cli_alert_info("Re-document with `roxygen2::roxygenise()`.")
  cli_alert_info("Please rebuild the package before using this function again.")
  cli_rule()

  invisible()
}
