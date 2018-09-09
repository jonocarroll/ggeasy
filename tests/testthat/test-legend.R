context("remove legend")

p <- ggplot2::ggplot(mtcars, ggplot2::aes(wt, mpg, colour = cyl, size = hp)) + ggplot2::geom_point()

test_that("easy_remove_legend works with no argument", {
  easy_res <- p + easy_remove_legend()
  hard_res <- p + theme(legend.position = "none")
  expect_equal(easy_res, hard_res)
})

test_that("easy_remove_legend works with single character argument", {
  easy_res <- p + easy_remove_legend("size")
  hard_res <- p + guides(size = FALSE)
  expect_equal(easy_res, hard_res)
})

test_that("easy_remove_legend works with single bare argument", {
  easy_res <- p + easy_remove_legend(size)
  hard_res <- p + guides(size = FALSE)
  expect_equal(easy_res, hard_res)
})

test_that("easy_remove_legend works with multiple character arguments", {
  easy_res <- p + easy_remove_legend("size", "color")
  hard_res <- p + guides(size = FALSE, color = FALSE)
  expect_equal(easy_res, hard_res)
})

test_that("easy_remove_legend works with multiple bare arguments", {
  easy_res <- p + easy_remove_legend(size, color)
  hard_res <- p + guides(size = FALSE, color = FALSE)
  expect_equal(easy_res, hard_res)
})

test_that("easy_remove_legend teach = TRUE works with no other arguments", {
  teach_message <- capture_messages({p + easy_remove_legend(teach = TRUE)})[2]
  easy_res <- easy_remove_legend()
  teach_res <- rlang::eval_bare(rlang::parse_expr(teach_message))
  expect_message(p + easy_remove_legend(teach = TRUE))
  expect_equal(easy_res, teach_res)
})

test_that("easy_remove_legend teach = TRUE works with specific aes", {
  teach_message <- capture_messages({p + easy_remove_legend(size, teach = TRUE)})[2]
  easy_res <- easy_remove_legend(size)
  teach_res <- rlang::eval_bare(rlang::parse_expr(teach_message))
  expect_message(p + easy_remove_legend(size, teach = TRUE))
  expect_equal(easy_res, teach_res)
})

test_that("easy_remove_legend teach = TRUE works with multiple aes", {
  teach_message <- capture_messages({p + easy_remove_legend(size, color, teach = TRUE)})[2]
  easy_res <- easy_remove_legend(size, color)
  teach_res <- rlang::eval_bare(rlang::parse_expr(teach_message))
  expect_message(p + easy_remove_legend(size, teach = TRUE))
  expect_equal(easy_res, teach_res)
})
