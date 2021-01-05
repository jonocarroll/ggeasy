testthat::context("attr labs")
library(labelled)
library(ggplot2)
library(ggeasy)

expect_eqNe <- function(...) expect_equal(..., check.environment = FALSE)

expect_doppelganger <- function(title, fig, path = NULL, ...) {
  testthat::skip_if_not_installed("vdiffr")
  vdiffr::expect_doppelganger(title, fig, path = path, ...)
}

iris_labs <- iris

lbl <- c('Sepal Length', 'Sepal Width', 'Petal Length', 'Petal Width', 'Flower Species')

labelled::var_label(iris_labs) <- split(lbl, names(iris_labs))

p <- ggplot2::ggplot(iris_labs,
                     ggplot2::aes(x = Sepal.Length,
                                  y = Sepal.Width)) +
  ggplot2::geom_line(ggplot2::aes(colour = Species))

test_that("easy_labs uses column attrib", {

  hard_res <- p + ggplot2::labs(x = 'Sepal Length', y = 'Sepal Width', colour = 'Flower Species')
  easy_res <- p + easy_labs()

  expect_eqNe(easy_res, hard_res)
  expect_message(p + easy_labs(teach = TRUE), regexp = "colour = 'Flower Species')")

  easy_res_test_teach <- p + easy_labs()
  teach_message <- capture_messages({p + easy_labs(teach = TRUE)})[2]
  teach_res <- rlang::eval_bare(rlang::parse_expr(teach_message))
  expect_eqNe(easy_res_test_teach, p + teach_res)

  expect_doppelganger("labels_attrib", easy_res)

})

testthat::test_that("regular labs overides easy_labs ", {

  hard_res <- p + ggplot2::labs(x = 'x axis', y = 'Sepal Width', colour = 'Flower Species')
  easy_res <- p + easy_labs(x = 'x axis')

  expect_eqNe(easy_res$labels[sort(names(easy_res$labels))],
               hard_res$labels[sort(names(hard_res$labels))])
  expect_doppelganger("labels_manual", easy_res)

})

testthat::test_that("regular labs pass new labels through easy_labs ", {

  hard_res <- p + ggplot2::labs(x = 'Sepal Length', y = 'Sepal Width', colour = 'Flower Species', title = 'my title')
  easy_res <- p + easy_labs(title = 'my title')

  expect_eqNe(easy_res$labels[sort(names(easy_res$labels))],
               hard_res$labels[sort(names(hard_res$labels))])
  expect_doppelganger("labels_mytitle", easy_res)

})

test_that("column name used when no column attrib present", {

  labelled::var_label(iris_labs$Sepal.Length) <- NULL

  p <- ggplot2::ggplot(iris_labs,
                       ggplot2::aes(x = Sepal.Length,
                                    y = Sepal.Width)) +
    ggplot2::geom_line(ggplot2::aes(colour = Species))


  hard_res <- p + ggplot2::labs(y = 'Sepal Width', colour = 'Flower Species')
  easy_res <- p + ggeasy::easy_labs()

  expect_eqNe(easy_res$labels[sort(names(easy_res$labels))],
               hard_res$labels[sort(names(hard_res$labels))])
  expect_doppelganger("labels_y_col", easy_res)

})
