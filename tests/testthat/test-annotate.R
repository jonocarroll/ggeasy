context("annotate")

test_that("annotation_* has dummy data assigned and don't inherit aes", {
  tick <- easy_ticks()

  dummy <- data.frame(x=NA)

  expect_equal(tick$data, dummy)
  expect_false(tick$inherit.aes)
})
