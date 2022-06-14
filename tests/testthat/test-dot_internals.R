test_that("it produces error outside of package", {
  expect_snapshot_error(withr::with_tempdir({dot_internals()}))
})
