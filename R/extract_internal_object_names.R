#' @title Extract names of internal package objects
#'
#' @keywords internal
.extract_internal_function_names <- function() {
  package_name <- desc::desc_get("Package")

  # to bring the library on the search path
  library(package_name, character.only = TRUE)
  on.exit(detach(), add = TRUE)

  # exported ---------------

  package_env <- pkg_env(package_name)
  exported_fns <- .extract_functions_from_environment(package_env)
  exported_fn_names <- names(exported_fns)

  # all ---------------

  namespace_env <- ns_env(package_name)
  all_fns <- .extract_functions_from_environment(namespace_env)
  all_fn_names <- names(all_fns[!purrr::map_lgl(names(all_fns), ~ .is_S3_or_S4_method(.x))])

  # internal ---------------

  internal_fn_names <- setdiff(all_fn_names, exported_fn_names)

  return(internal_fn_names)
}

#' @keywords internal
#' @noRd
.is_S3_or_S4_method <- function(x) {
  sloop::is_s3_method(x) || isS4(x)
}

#' @keywords internal
#' @noRd
.extract_functions_from_environment <- function(env) {
  purrr::keep(as.list(env), rlang::is_function)
}
