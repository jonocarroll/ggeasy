context("remove axes")

expect_eqNe <- function(...) expect_equal(..., check.environment = FALSE)

p <- ggplot2::ggplot(mtcars, ggplot2::aes(mpg, hp)) + geom_point()

test_that("no argument", {
  hard_res_no_arg_both <- p +
    ggplot2::theme(
      axis.title = ggplot2::element_blank(),
      axis.line = ggplot2::element_blank(),
      axis.ticks = ggplot2::element_blank(),
      axis.text = ggplot2::element_blank()
    )
  easy_res_no_arg_both <- p + easy_remove_axes()
  expect_eqNe(hard_res_no_arg_both, easy_res_no_arg_both)

  hard_res_no_arg_x <- p +
    ggplot2::theme(
      axis.title.x = ggplot2::element_blank(),
      axis.line.x = ggplot2::element_blank(),
      axis.ticks.x = ggplot2::element_blank(),
      axis.text.x = ggplot2::element_blank()
    )
  easy_res_no_arg_x <- p + easy_remove_x_axis()
  expect_eqNe(hard_res_no_arg_x, easy_res_no_arg_x)

  hard_res_no_arg_y <- p +
    ggplot2::theme(
      axis.title.y = ggplot2::element_blank(),
      axis.line.y = ggplot2::element_blank(),
      axis.ticks.y = ggplot2::element_blank(),
      axis.text.y = ggplot2::element_blank()
    )
  easy_res_no_arg_y <- p + easy_remove_y_axis()
  expect_eqNe(hard_res_no_arg_y, easy_res_no_arg_y)
})

test_that("explicit axis", {
  hard_res_x_all <- p +
    ggplot2::theme(
      axis.title.x = ggplot2::element_blank(),
      axis.line.x = ggplot2::element_blank(),
      axis.ticks.x = ggplot2::element_blank(),
      axis.text.x = ggplot2::element_blank()
    )
  easy_res_x_all <- p + easy_remove_axes("x")
  easy_res_x_all_call <- p + easy_remove_x_axis()
  expect_eqNe(hard_res_x_all, easy_res_x_all)
  expect_eqNe(hard_res_x_all, easy_res_x_all_call)

  hard_res_x_ticks <- p +
    ggplot2::theme(
      axis.ticks.x = ggplot2::element_blank(),
    )
  easy_res_x_ticks <- p + easy_remove_axes("x", "ticks")
  easy_res_x_ticks_call <- p + easy_remove_x_axis("ticks")
  expect_eqNe(hard_res_x_ticks, easy_res_x_ticks)
  expect_eqNe(hard_res_x_ticks, easy_res_x_ticks_call)

  hard_res_x_title <- p +
    ggplot2::theme(
      axis.title.x = ggplot2::element_blank(),
    )
  easy_res_x_title <- p + easy_remove_axes("x", "title")
  easy_res_x_title_call <- p + easy_remove_x_axis("title")
  expect_eqNe(hard_res_x_title, easy_res_x_title)
  expect_eqNe(hard_res_x_title, easy_res_x_title_call)

  hard_res_x_line <- p +
    ggplot2::theme(
      axis.line.x = ggplot2::element_blank(),
    )
  easy_res_x_line <- p + easy_remove_axes("x", "line")
  easy_res_x_line_call <- p + easy_remove_x_axis("line")
  expect_eqNe(hard_res_x_line, easy_res_x_line)
  expect_eqNe(hard_res_x_line, easy_res_x_line_call)

  hard_res_x_text <- p +
    ggplot2::theme(
      axis.text.x = ggplot2::element_blank(),
    )
  easy_res_x_text <- p + easy_remove_axes("x", "text")
  easy_res_x_text_call <- p + easy_remove_x_axis("text")
  expect_eqNe(hard_res_x_text, easy_res_x_text)
  expect_eqNe(hard_res_x_text, easy_res_x_text_call)
})

test_that("multiple components", {
  hard_res_x_tickstitle <- p +
    ggplot2::theme(
      axis.title.x = ggplot2::element_blank(),
      axis.ticks.x = ggplot2::element_blank()
    )
  easy_res_x_tickstitle <- p + easy_remove_axes("x", c("ticks", "title"))
  easy_res_x_tickstitle_call <- p + easy_remove_x_axis(c("ticks", "title"))
  expect_eqNe(hard_res_x_tickstitle, easy_res_x_tickstitle)
  expect_eqNe(hard_res_x_tickstitle, easy_res_x_tickstitle_call)

  hard_res_both_tickstitle <- p +
    ggplot2::theme(
      axis.title = ggplot2::element_blank(),
      axis.ticks = ggplot2::element_blank()
    )
  easy_res_both_noarg_tickstitle <- p +
    easy_remove_axes(what = c("ticks", "title"))
  easy_res_both_tickstitle <- p + easy_remove_axes("both", c("ticks", "title"))
  easy_res_both_tickstitle_call <- p +
    easy_remove_axes("both", c("ticks", "title"))
  expect_eqNe(hard_res_both_tickstitle, easy_res_both_tickstitle)
  expect_eqNe(hard_res_x_tickstitle, easy_res_x_tickstitle_call)
})

test_that("teach argument produces working code", {
  easy_res_test_teach <- easy_remove_axes(what = c("ticks", "title"))
  teach_message <- capture_messages({
    p + easy_remove_axes(what = c("ticks", "title"), teach = TRUE)
  })[2]
  teach_res <- rlang::eval_bare(rlang::parse_expr(teach_message))
  expect_eqNe(easy_res_test_teach, teach_res)

  easy_res_test_teach <- easy_remove_axes("x", what = c("ticks", "title"))
  teach_message <- capture_messages({
    p + easy_remove_x_axis(what = c("ticks", "title"), teach = TRUE)
  })[2]
  teach_res <- rlang::eval_bare(rlang::parse_expr(teach_message))
  expect_eqNe(easy_res_test_teach, teach_res)

  easy_res_test_teach <- easy_remove_axes()
  teach_message <- capture_messages({
    p + easy_remove_axes(teach = TRUE)
  })[2]
  teach_res <- rlang::eval_bare(rlang::parse_expr(teach_message))
  expect_eqNe(easy_res_test_teach, teach_res)
})
