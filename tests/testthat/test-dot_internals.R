test_that("it produces error outside of package", {
  expect_snapshot_error(withr::with_tempdir({
    dot_internals()
  }))
})

test_that("it produces expected message when no internal functions are found", {
  withr::with_package("dotInternals", {
    expect_snapshot(dot_internals())
  })
})

build_file <- paste0(rprojroot::find_testthat_root_file(), "/assets/testpackage1_1.0.0.tar.gz")
temp_dir <- paste0(rprojroot::find_testthat_root_file(), "/assets/pkg-with-internals-temp")

test_that("it changes only internal *function* names without `.` prefix", {
  pkg <- test_path("assets/pkg-with-internals")

  withr::with_dir(pkg, {
    pkgbuild::build(quiet = TRUE)
    expect_snapshot(dotInternals:::.extract_internal_function_names())
    pkgload::unload(quiet = TRUE)
  })

  unlink(build_file, recursive = TRUE, force = TRUE)
})

test_that("check clean up", {
  expect_false("testpackage1" %in% loadedNamespaces())
  expect_false(file.exists(build_file))
})


test_that("it changes function names", {
  pkg <- test_path("assets/pkg-with-internals")
  pkg_temp <- test_path("assets/pkg-with-internals-temp")
  fs::dir_copy(pkg, pkg_temp, overwrite = TRUE)

  withr::with_dir(pkg_temp, {
    # first time, the package runs, it should find and rename internal functions
    pkgbuild::build(quiet = TRUE)
    expect_snapshot(dotInternals::dot_internals())

    # loading the package with changed files shouldn't find any functions to dot
    pkgload::load_all(quiet = TRUE)
    expect_snapshot(dotInternals:::.extract_internal_function_names())

    # moreover, if we were to run the function again, it shouldn't do anything
    expect_snapshot(dotInternals::dot_internals())

    pkgload::unload(quiet = TRUE)
  })

  unlink(temp_dir, recursive = TRUE, force = TRUE)
})
