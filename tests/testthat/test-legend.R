context("legend")

test_that("easy_remove_legend works with no argument", {
  easy_res <- ggplot(mtcars, aes(wt, mpg, colour = cyl, size = hp)) +
    geom_point() + easy_remove_legend()
  
  hard_res <- ggplot(mtcars, aes(wt, mpg, colour = cyl, size = hp)) +
    geom_point() + theme(legend.position = "none")
  
  expect_equal(easy_res, hard_res)
})

test_that("easy_remove_legend works with single character argument", {
  easy_res <- ggplot(mtcars, aes(wt, mpg, colour = cyl, size = hp)) +
    geom_point() + easy_remove_legend("size")
  
  hard_res <- ggplot(mtcars, aes(wt, mpg, colour = cyl, size = hp)) +
    geom_point() + guides(size = FALSE)
  
  expect_equal(easy_res, hard_res)
})

test_that("easy_remove_legend works with single bare argument", {
  easy_res <- ggplot(mtcars, aes(wt, mpg, colour = cyl, size = hp)) +
    geom_point() + easy_remove_legend(size)
  
  hard_res <- ggplot(mtcars, aes(wt, mpg, colour = cyl, size = hp)) +
    geom_point() + guides(size = FALSE)
  
  expect_equal(easy_res, hard_res)
})

test_that("easy_remove_legend works with multiple character arguments", {
  easy_res <- ggplot(mtcars, aes(wt, mpg, colour = cyl, size = hp)) +
    geom_point() + easy_remove_legend("size", "color")
  
  hard_res <- ggplot(mtcars, aes(wt, mpg, colour = cyl, size = hp)) +
    geom_point() + guides(size = FALSE, color = FALSE)
  
  expect_equal(easy_res, hard_res)
})

test_that("easy_remove_legend works with multiple bare arguments", {
  easy_res <- ggplot(mtcars, aes(wt, mpg, colour = cyl, size = hp)) +
    geom_point() + easy_remove_legend(size, color)
  
  hard_res <- ggplot(mtcars, aes(wt, mpg, colour = cyl, size = hp)) +
    geom_point() + guides(size = FALSE, color = FALSE)
  
  expect_equal(easy_res, hard_res)
})

