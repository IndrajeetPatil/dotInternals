test_that("it produces error outside of package", {
  expect_snapshot_error(withr::with_tempdir({
    dot_internals()
  }))
})

test_that("it produces expected messages when run inside a package", {
  withr::with_package("dotInternals", {
    expect_snapshot(dot_internals())
  })
})
