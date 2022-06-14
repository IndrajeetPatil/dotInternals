#' @title Prepend internal functions with a dot
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
