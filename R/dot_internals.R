#' @title Prepend internal functions with a dot
#'
#' @description
#'
#' @return
#'
#' Changed `.R` and `.Rmd` files with all instances of internal functions
#' replaced with their new "dotted" versions.
#'
#' @export
dot_internals <- function() {
  if (isFALSE(.is_package())) {
    cli::cli_abort("This function can only be run in the package root directory.")
  }

  files <- .find_source_files()
  fn_names <- .extract_internal_function_names()

  purrr::walk(
    .x = fn_names,
    .f = ~ xfun::gsub_files(files, .x, paste0(".", .x))
  )
}
