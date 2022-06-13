#' @title Extract names of internal package objects
#'
#' @import rlang
#'
#' @export
extract_internal_object_names <- function() {
  package_name <- desc::desc_get("Package")

  # extract a list of internal objects by subtracting exported from all objects
  exported_objects <- getNamespaceExports(package_name)
  all_objects <- ls(getNamespace(package_name), all.names = TRUE)
  internal_objects <- setdiff(all_objects, exported_objects)

  # remove internal objects that already have a `.` prefix
  internal_objects <- purrr::discard(internal_objects, ~startsWith(.x, prefix = "."))

  # get a list of all S3 methods, which won't be included in `getNamespaceExports()`
  s3_method_names <- rlang::env_names(eval(rlang::call2(":::", package_name, expr(.__S3MethodsTable__. ))))

  internal_objects <- setdiff(internal_objects, s3_method_names)

  return(internal_objects)
}
