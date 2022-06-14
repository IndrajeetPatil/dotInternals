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
  purrr::walk(
    .extract_internal_function_names(),
    ~ xfun::gsub_files(
      files = fs::dir_ls(".", recurse = TRUE, glob = "*.R$|*.Rmd$"),
      .x,
      paste0(".", .x),
      fixed = TRUE
    )
  )
}
