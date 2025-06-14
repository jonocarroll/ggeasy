context("adjust text sizes")

expect_eqNe <- function(...) expect_equal(..., check.environment = FALSE)

expect_doppelganger <- function(title, fig, ...) {
  testthat::skip_if_not_installed("vdiffr")
  vdiffr::expect_doppelganger(title, fig, ...)
}

expect_equal_with_reorder <- function(easy, hard, debug = FALSE) {
  for (x in names(hard)) {
    for (y in names(hard[x])) {
      if (debug) message("testing: ", x, "[", y, "]")
      expect_eqNe(hard[[x]][[y]], easy[[x]][[y]])
    }
  }
}

p <- ggplot2::ggplot(mtcars, ggplot2::aes(mpg, hp)) +
  geom_point(aes(col = cyl, size = disp)) +
  labs(title = "Plot Title", subtitle = "Subtitle")

test_that("set text sizes", {
  hard_res_all <- p +
    theme(text = ggplot2::element_text(size = 22)) +
    theme(axis.text = ggplot2::element_text(size = 22)) +
    theme(title = ggplot2::element_text(size = 22))
  easy_res_all <- p + easy_all_text_size(22)
  expect_equal_with_reorder(hard_res_all, easy_res_all)
  expect_message(
    easy_all_text_size(22, teach = TRUE),
    regexp = "easy_change_text"
  )
  expect_message(
    easy_all_text_size(22, teach = TRUE),
    regexp = "can be substituted"
  )
  expect_message(
    easy_all_text_size(22, teach = TRUE),
    regexp = "theme(text = ggplot2::element_text(size = 22)",
    fixed = TRUE
  )
  expect_message(
    easy_all_text_size(22, teach = TRUE),
    regexp = "theme(axis.text = ggplot2::element_text(size = 22)",
    fixed = TRUE
  )
  expect_message(
    easy_all_text_size(22, teach = TRUE),
    regexp = "theme(title = ggplot2::element_text(size = 22)",
    fixed = TRUE
  )

  hard_res_all_indiv <- p +
    theme(text = ggplot2::element_text(size = 22)) +
    theme(axis.text = ggplot2::element_text(size = 22)) +
    theme(title = ggplot2::element_text(size = 22))
  easy_res_all_indiv <- p + easy_text_size(size = 22)
  expect_equal_with_reorder(hard_res_all_indiv, easy_res_all_indiv)
  expect_message(
    easy_text_size(size = 22, teach = TRUE),
    regexp = "easy_change_text"
  )
  expect_message(
    easy_text_size(size = 22, teach = TRUE),
    regexp = "can be substituted"
  )
  expect_message(
    easy_text_size(size = 22, teach = TRUE),
    regexp = "theme(text = ggplot2::element_text(size = 22)",
    fixed = TRUE
  )
  expect_message(
    easy_text_size(size = 22, teach = TRUE),
    regexp = "theme(axis.text = ggplot2::element_text(size = 22)",
    fixed = TRUE
  )
  expect_message(
    easy_text_size(size = 22, teach = TRUE),
    regexp = "theme(title = ggplot2::element_text(size = 22)",
    fixed = TRUE
  )

  hard_res_all_indiv_2 <- p +
    theme(text = ggplot2::element_text(size = 22)) +
    theme(axis.text = ggplot2::element_text(size = 22)) +
    theme(title = ggplot2::element_text(size = 22))
  easy_res_all_indiv_2 <- p + easy_change_text(what = "size", to = 22)
  expect_equal_with_reorder(hard_res_all_indiv_2, easy_res_all_indiv_2)
  expect_message(
    easy_change_text(what = "size", to = 22, teach = TRUE),
    regexp = "easy_change_text"
  )
  expect_message(
    easy_change_text(what = "size", to = 22, teach = TRUE),
    regexp = "can be substituted"
  )
  expect_message(
    easy_change_text(what = "size", to = 22, teach = TRUE),
    regexp = "theme(text = ggplot2::element_text(size = 22)",
    fixed = TRUE
  )
  expect_message(
    easy_change_text(what = "size", to = 22, teach = TRUE),
    regexp = "theme(axis.text = ggplot2::element_text(size = 22)",
    fixed = TRUE
  )
  expect_message(
    easy_change_text(what = "size", to = 22, teach = TRUE),
    regexp = "theme(title = ggplot2::element_text(size = 22)",
    fixed = TRUE
  )

  hard_res_all_indiv_NULL <- p +
    theme(text = ggplot2::element_text(size = 22)) +
    theme(axis.text = ggplot2::element_text(size = 22)) +
    theme(title = ggplot2::element_text(size = 22))
  easy_res_all_indiv_NULL <- p + easy_text_size(22)
  expect_equal_with_reorder(hard_res_all_indiv_NULL, easy_res_all_indiv_NULL)
  expect_message(easy_text_size(22, teach = TRUE), regexp = "easy_change_text")
  expect_message(
    easy_text_size(22, teach = TRUE),
    regexp = "can be substituted"
  )
  expect_message(
    easy_text_size(22, teach = TRUE),
    regexp = "theme(text = ggplot2::element_text(size = 22)",
    fixed = TRUE
  )
  expect_message(
    easy_text_size(22, teach = TRUE),
    regexp = "theme(axis.text = ggplot2::element_text(size = 22)",
    fixed = TRUE
  )
  expect_message(
    easy_text_size(22, teach = TRUE),
    regexp = "theme(title = ggplot2::element_text(size = 22)",
    fixed = TRUE
  )

  hard_res_x_axis_title_size <- p +
    theme(axis.title.x = ggplot2::element_text(size = 22))
  easy_res_x_axis_title_size <- p + easy_x_axis_title_size(22)
  expect_equal_with_reorder(
    hard_res_x_axis_title_size,
    easy_res_x_axis_title_size
  )
  expect_message(
    easy_x_axis_title_size(22, teach = TRUE),
    regexp = "easy_change_text"
  )
  expect_message(
    easy_x_axis_title_size(22, teach = TRUE),
    regexp = "can be substituted"
  )
  expect_message(
    easy_x_axis_title_size(22, teach = TRUE),
    regexp = "theme(axis.title.x = ggplot2::element_text(size = 22)",
    fixed = TRUE
  )

  hard_res_y_axis_title_size <- p +
    theme(axis.title.y = ggplot2::element_text(size = 22))
  easy_res_y_axis_title_size <- p + easy_y_axis_title_size(22)
  expect_equal_with_reorder(
    hard_res_y_axis_title_size,
    easy_res_y_axis_title_size
  )

  hard_res_x_axis_labels_size <- p +
    theme(axis.text.x = ggplot2::element_text(size = 22))
  easy_res_x_axis_labels_size <- p + easy_x_axis_labels_size(22)
  expect_equal_with_reorder(
    hard_res_x_axis_labels_size,
    easy_res_x_axis_labels_size
  )

  hard_res_y_axis_labels_size <- p +
    theme(axis.text.y = ggplot2::element_text(size = 22))
  easy_res_y_axis_labels_size <- p + easy_y_axis_labels_size(22)
  expect_equal_with_reorder(
    hard_res_y_axis_labels_size,
    easy_res_y_axis_labels_size
  )

  hard_res_x_axis_labels_size_NULL <- p +
    theme(axis.text.x = ggplot2::element_blank())
  easy_res_x_axis_labels_size_NULL <- p + easy_x_axis_labels_size()
  expect_equal_with_reorder(
    hard_res_x_axis_labels_size_NULL,
    easy_res_x_axis_labels_size_NULL
  )

  hard_res_y_axis_labels_size_NULL <- p +
    theme(axis.text.y = ggplot2::element_blank())
  easy_res_y_axis_labels_size_NULL <- p + easy_y_axis_labels_size()
  expect_equal_with_reorder(
    hard_res_y_axis_labels_size_NULL,
    easy_res_y_axis_labels_size_NULL
  )

  hard_res_plot_title_size <- p +
    theme(plot.title = ggplot2::element_text(size = 22))
  easy_res_plot_title_size <- p + easy_plot_title_size(22)
  expect_equal_with_reorder(hard_res_plot_title_size, easy_res_plot_title_size)

  hard_res_plot_subtitle_size <- p +
    theme(plot.subtitle = ggplot2::element_text(size = 22))
  easy_res_plot_subtitle_size <- p + easy_plot_subtitle_size(22)
  expect_equal_with_reorder(
    hard_res_plot_subtitle_size,
    easy_res_plot_subtitle_size
  )

  hard_res_plot_caption_size <- p +
    theme(plot.caption = ggplot2::element_text(size = 22))
  easy_res_plot_caption_size <- p + easy_plot_caption_size(22)
  expect_equal_with_reorder(
    hard_res_plot_caption_size,
    easy_res_plot_caption_size
  )

  hard_res_plot_legend_size <- p +
    theme(legend.text = ggplot2::element_text(size = 22))
  easy_res_plot_legend_size <- p + easy_plot_legend_size(22)
  expect_equal_with_reorder(
    hard_res_plot_legend_size,
    easy_res_plot_legend_size
  )

  hard_res_plot_legend_title_size <- p +
    theme(legend.title = ggplot2::element_text(size = 22))
  easy_res_plot_legend_title_size <- p + easy_plot_legend_title_size(22)
  expect_equal_with_reorder(
    hard_res_plot_legend_title_size,
    easy_res_plot_legend_title_size
  )

  hard_res_plot_title_size_NULL <- p +
    theme(plot.title = ggplot2::element_blank())
  easy_res_plot_title_size_NULL <- p + easy_plot_title_size()
  expect_equal_with_reorder(
    hard_res_plot_title_size_NULL,
    easy_res_plot_title_size_NULL
  )

  hard_res_plot_subtitle_size_NULL <- p +
    theme(plot.subtitle = ggplot2::element_blank())
  easy_res_plot_subtitle_size_NULL <- p + easy_plot_subtitle_size()
  expect_equal_with_reorder(
    hard_res_plot_subtitle_size_NULL,
    easy_res_plot_subtitle_size_NULL
  )

  hard_res_plot_caption_size_NULL <- p +
    theme(plot.caption = ggplot2::element_blank())
  easy_res_plot_caption_size_NULL <- p + easy_plot_caption_size()
  expect_equal_with_reorder(
    hard_res_plot_caption_size_NULL,
    easy_res_plot_caption_size_NULL
  )

  hard_res_plot_legend_size_NULL <- p +
    theme(legend.text = ggplot2::element_blank())
  easy_res_plot_legend_size_NULL <- p + easy_plot_legend_size()
  expect_equal_with_reorder(
    hard_res_plot_legend_size_NULL,
    easy_res_plot_legend_size_NULL
  )

  hard_res_plot_legend_title_size_NULL <- p +
    theme(legend.title = ggplot2::element_blank())
  easy_res_plot_legend_title_size_NULL <- p + easy_plot_legend_title_size()
  expect_equal_with_reorder(
    hard_res_plot_legend_title_size_NULL,
    easy_res_plot_legend_title_size_NULL
  )
})

context("adjust text colors")

test_that("set text colors", {
  hard_res_all <- p +
    theme(text = ggplot2::element_text(color = "red")) +
    theme(axis.text = ggplot2::element_text(color = "red")) +
    theme(title = ggplot2::element_text(color = "red"))
  easy_res_all <- p + easy_all_text_color("red")
  expect_equal_with_reorder(hard_res_all, easy_res_all)
  expect_message(
    easy_all_text_color("red", teach = TRUE),
    regexp = "easy_change_text"
  )
  expect_message(
    easy_all_text_color("red", teach = TRUE),
    regexp = "can be substituted"
  )
  expect_message(
    easy_all_text_color("red", teach = TRUE),
    regexp = "theme(text = ggplot2::element_text(colour = 'red')",
    fixed = TRUE
  )
  expect_message(
    easy_all_text_color("red", teach = TRUE),
    regexp = "theme(axis.text = ggplot2::element_text(colour = 'red')",
    fixed = TRUE
  )
  expect_message(
    easy_all_text_color("red", teach = TRUE),
    regexp = "theme(title = ggplot2::element_text(colour = 'red')",
    fixed = TRUE
  )

  hard_res_all_u <- p +
    theme(text = ggplot2::element_text(color = "red")) +
    theme(axis.text = ggplot2::element_text(color = "red")) +
    theme(title = ggplot2::element_text(color = "red"))
  easy_res_all_u <- p + easy_all_text_colour("red")
  expect_equal_with_reorder(hard_res_all_u, easy_res_all_u)

  hard_res_all_indiv <- p +
    theme(text = ggplot2::element_text(color = "red")) +
    theme(axis.text = ggplot2::element_text(color = "red")) +
    theme(title = ggplot2::element_text(color = "red"))
  easy_res_all_indiv <- p + easy_change_text(what = "color", to = "red")
  expect_equal_with_reorder(hard_res_all_indiv, easy_res_all_indiv)

  hard_res_all_indiv_2 <- p +
    theme(text = ggplot2::element_text(color = "red")) +
    theme(axis.text = ggplot2::element_text(color = "red")) +
    theme(title = ggplot2::element_text(color = "red"))
  easy_res_all_indiv_2 <- p + easy_text_color(color = "red")
  expect_equal_with_reorder(hard_res_all_indiv_2, easy_res_all_indiv_2)

  hard_res_all_indiv_2u <- p +
    theme(text = ggplot2::element_text(color = "red")) +
    theme(axis.text = ggplot2::element_text(color = "red")) +
    theme(title = ggplot2::element_text(color = "red"))
  easy_res_all_indiv_2u <- p + easy_text_colour(colour = "red")
  expect_equal_with_reorder(hard_res_all_indiv_2u, easy_res_all_indiv_2u)

  hard_res_all_indiv_NULL <- p +
    theme(text = ggplot2::element_text(color = "red")) +
    theme(axis.text = ggplot2::element_text(color = "red")) +
    theme(title = ggplot2::element_text(color = "red"))
  easy_res_all_indiv_NULL <- p + easy_text_color("red")
  expect_equal_with_reorder(hard_res_all_indiv_2, easy_res_all_indiv_2)

  hard_res_all_indiv_NULLu <- p +
    theme(text = ggplot2::element_text(color = "red")) +
    theme(axis.text = ggplot2::element_text(color = "red")) +
    theme(title = ggplot2::element_text(color = "red"))
  easy_res_all_indiv_NULLu <- p + easy_text_colour("red")
  expect_equal_with_reorder(hard_res_all_indiv_NULLu, easy_res_all_indiv_NULLu)

  hard_res_axis_color <- p +
    theme(axis.text = ggplot2::element_text(color = "red"))
  easy_res_axis_color <- p + easy_text_color(which = "axis.text", color = "red")
  expect_equal_with_reorder(hard_res_axis_color, easy_res_axis_color)
  expect_message(
    easy_text_color(which = "axis.text", color = "red", teach = TRUE),
    regexp = "easy_change_text"
  )
  expect_message(
    easy_text_color(which = "axis.text", color = "red", teach = TRUE),
    regexp = "can be substituted"
  )
  expect_message(
    easy_text_color(which = "axis.text", color = "red", teach = TRUE),
    regexp = "theme(axis.text = ggplot2::element_text(colour = 'red')",
    fixed = TRUE
  )

  hard_res_axis_color_u <- p +
    theme(axis.text = ggplot2::element_text(color = "red"))
  easy_res_axis_color_u <- p +
    easy_text_colour(which = "axis.text", colour = "red")
  expect_equal_with_reorder(hard_res_axis_color_u, easy_res_axis_color_u)

  hard_res_axis_color_man <- p +
    theme(axis.text = ggplot2::element_text(color = "red"))
  easy_res_axis_color_man <- p +
    easy_change_text(which = "axis.text", what = "color", to = "red")
  expect_equal_with_reorder(hard_res_axis_color_man, easy_res_axis_color_man)
})

context("text alignment")

test_that("easy_center_title works", {
  easy_res <- p + easy_center_title()
  hard_res <- p + ggplot2::theme(plot.title = element_text(hjust = .5))
  expect_eqNe(easy_res, hard_res)
})

context("bolding title")

test_that("bold round-trips", {
  bold <- p + easy_title_bold()
  unbold <- bold + easy_title_regular()
  expect_eqNe(p + theme(plot.title = element_text(face = "bold")), bold)
  expect_doppelganger("bolding", unbold)
})
