skip_on_ci()

test_that("it produces error outside of package", {
  expect_snapshot_error(withr::with_tempdir({
    dotInternals::dot_internals()
  }))
})

built_pkg <- paste0(rprojroot::find_testthat_root_file(), "/assets/testpackage_1.0.0.tar.gz")
temp_dir <- paste0(rprojroot::find_testthat_root_file(), "/assets/testpackage-temp")

test_that("it changes only internal *function* names without `.` prefix", {
  pkg <- test_path("assets/testpackage")

  withr::with_dir(pkg, {
    pkgbuild::build(quiet = TRUE)
    expect_snapshot(dotInternals:::.extract_internal_function_names())
    pkgload::load_all(quiet = TRUE)
    pkgload::unload(quiet = TRUE)
  })

  unlink(built_pkg, recursive = TRUE, force = TRUE)
})

test_that("check clean up", {
  expect_false("testpackage" %in% loadedNamespaces())
  expect_false(file.exists(built_pkg))
})


test_that("it changes function names", {
  pkg <- test_path("assets/testpackage")
  pkg_temp <- test_path("assets/testpackage-temp")
  fs::dir_copy(pkg, pkg_temp, overwrite = TRUE)

  withr::with_dir(pkg_temp, {
    # first time, the package runs, it should find and rename internal functions
    pkgbuild::build(quiet = TRUE)
    expect_snapshot(dotInternals::dot_internals())

    # loading the package with changed files shouldn't find any functions to dot
    pkgload::load_all(quiet = TRUE)
    expect_snapshot(dotInternals:::.extract_internal_function_names())

    # moreover, if we were to run the function again, it shouldn't do anything
    pkgbuild::build(quiet = TRUE)
    pkgload::load_all(quiet = TRUE)
    expect_snapshot(dotInternals::dot_internals())

    # TODO: tun back on after the bug is fixed
    # expect_false(env_has(ns_env(desc::desc_get("Package")), ".if1a"))

    pkgload::unload(quiet = TRUE)
  })

  unlink(temp_dir, recursive = TRUE, force = TRUE)
})
