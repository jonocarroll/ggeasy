context("remove axes")

test_that("easy_remove_axes works with no argument", {
  easy_res <- ggplot(mtcars, aes(wt, mpg)) +
    geom_point() + easy_remove_axes()

  hard_res <- ggplot(mtcars, aes(wt, mpg)) +
    geom_point() + theme(
      axis.title = element_blank(),
      axis.line = element_blank(),
      axis.ticks = element_blank(),
      axis.text = element_blank()
    )

  expect_equal(easy_res, hard_res)
})

test_that("easy_remove_axes works for x only", {
  easy_res <- ggplot(mtcars, aes(wt, mpg)) +
    geom_point() + easy_remove_axes("x")

  hard_res <- ggplot(mtcars, aes(wt, mpg)) +
    geom_point() + theme(
      axis.title.x = element_blank(),
      axis.line.x = element_blank(),
      axis.ticks.x = element_blank(),
      axis.text.x = element_blank()
    )

  expect_equal(easy_res, hard_res)
})


test_that("easy_remove_x_axis works", {
  easy_res <- ggplot(mtcars, aes(wt, mpg)) +
    geom_point() + easy_remove_x_axis()

  hard_res <- ggplot(mtcars, aes(wt, mpg)) +
    geom_point() + theme(
      axis.title.x = element_blank(),
      axis.line.x = element_blank(),
      axis.ticks.x = element_blank(),
      axis.text.x = element_blank()
    )

  expect_equal(easy_res, hard_res)
})

test_that("easy_remove_axes works for y only", {
  easy_res <- ggplot(mtcars, aes(wt, mpg)) +
    geom_point() + easy_remove_axes("y")

  hard_res <- ggplot(mtcars, aes(wt, mpg)) +
    geom_point() + theme(
      axis.title.y = element_blank(),
      axis.line.y = element_blank(),
      axis.ticks.y = element_blank(),
      axis.text.y = element_blank()
    )

  expect_equal(easy_res, hard_res)
})

test_that("easy_remove_y_axis works", {
  easy_res <- ggplot(mtcars, aes(wt, mpg)) +
    geom_point() + easy_remove_y_axis()

  hard_res <- ggplot(mtcars, aes(wt, mpg)) +
    geom_point() + theme(
      axis.title.y = element_blank(),
      axis.line.y = element_blank(),
      axis.ticks.y = element_blank(),
      axis.text.y = element_blank()
    )

  expect_equal(easy_res, hard_res)
})

test_that("easy_remove_axes works with one what element", {
  easy_res <- ggplot(mtcars, aes(wt, mpg)) +
    geom_point() + easy_remove_axes(what = "ticks")

  hard_res <- ggplot(mtcars, aes(wt, mpg)) +
    geom_point() + theme(axis.ticks = element_blank())

  expect_equal(easy_res, hard_res)
})

test_that("easy_remove_axes works with two elements", {
  easy_res <- ggplot(mtcars, aes(wt, mpg)) +
    geom_point() + easy_remove_axes(what = c("ticks", "line"))

  hard_res <- ggplot(mtcars, aes(wt, mpg)) +
    geom_point() + theme(
      axis.line = element_blank(),
      axis.ticks = element_blank()
    )

  expect_equal(easy_res, hard_res)
})

test_that("easy_remove_axes gives working teach message", {
  p <- ggplot(mtcars, aes(wt, mpg)) +
    geom_point()

  teach_message <- capture_messages({
    p + easy_remove_axes(teach = TRUE)
  })[2]

  easy_res <- easy_remove_axes()

  teach_res <- rlang::eval_bare(rlang::parse_expr(teach_message))

  expect_message(p + easy_remove_axes(teach = TRUE))

  expect_equal(easy_res, teach_res)
})
