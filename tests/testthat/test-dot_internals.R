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
