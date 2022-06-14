create_local_package <- function(dir = fs::file_temp(), env = parent.frame()) {
  old_project <- rprojroot::find_package_root_file()

  # create new folder and package
  usethis::create_package(dir, open = FALSE, roxygen = TRUE)
  withr::defer(fs::dir_delete(dir), envir = env)

  # change working directory
  setwd(dir)
  withr::defer(setwd(old_project), envir = env)

  # switch to new usethis project
  usethis::proj_set(dir)
  withr::defer(usethis::proj_set(old_project, force = TRUE), envir = env)

  dir
}
