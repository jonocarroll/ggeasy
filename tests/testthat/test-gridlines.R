context("remove grid lines")

p <- ggplot2::ggplot(mtcars, ggplot2::aes(mpg, hp)) +
  ggplot2::geom_point()

test_that("easy_remove_gridlines works", {
  hard_res_xy <- p +
    theme(
      panel.grid.major = element_blank(),
      panel.grid.minor = element_blank()
    )
  easy_res_xy <- p + easy_remove_gridlines()
  expect_equal(easy_res_xy, hard_res_xy)

  hard_res_xy_major <- p + theme(panel.grid.major = element_blank())
  easy_res_xy_major <- p + easy_remove_gridlines(minor = FALSE)
  expect_equal(easy_res_xy_major, hard_res_xy_major)

  hard_res_xy_minor <- p + theme(panel.grid.minor = element_blank())
  easy_res_xy_minor <- p + easy_remove_gridlines(major = FALSE)
  expect_equal(easy_res_xy_minor, hard_res_xy_minor)
})

test_that("easy_remove_x_gridlines works", {
  hard_res_x <- p +
    theme(
      panel.grid.major.x = element_blank(),
      panel.grid.minor.x = element_blank()
    )
  easy_res_x <- p + easy_remove_x_gridlines()
  expect_equal(easy_res_x, hard_res_x)

  hard_res_x_major <- p + theme(panel.grid.major.x = element_blank())
  easy_res_x_major <- p + easy_remove_x_gridlines(minor = FALSE)
  expect_equal(easy_res_x_major, hard_res_x_major)

  hard_res_x_minor <- p + theme(panel.grid.minor.x = element_blank())
  easy_res_x_minor <- p + easy_remove_x_gridlines(major = FALSE)
  expect_equal(easy_res_x_minor, hard_res_x_minor)
})

test_that("easy_remove_y_gridlines works", {
  hard_res_y <- p +
    theme(
      panel.grid.major.y = element_blank(),
      panel.grid.minor.y = element_blank()
    )
  easy_res_y <- p + easy_remove_y_gridlines()
  expect_equal(easy_res_y, hard_res_y)

  hard_res_y_major <- p + theme(panel.grid.major.y = element_blank())
  easy_res_y_major <- p + easy_remove_y_gridlines(minor = FALSE)
  expect_equal(easy_res_y_major, hard_res_y_major)

  hard_res_y_minor <- p + theme(panel.grid.minor.y = element_blank())
  easy_res_y_minor <- p + easy_remove_y_gridlines(major = FALSE)
  expect_equal(easy_res_y_minor, hard_res_y_minor)
})
