context("remove legend")

expect_eqNe <- function(...) expect_equal(..., check.environment = FALSE)

p <- ggplot2::ggplot(mtcars, ggplot2::aes(wt, mpg, colour = cyl, size = hp)) + ggplot2::geom_point()

test_that("easy_remove_legend works with no argument", {
  easy_res <- p + easy_remove_legend()
  hard_res <- p + theme(legend.position = "none")
  expect_eqNe(easy_res, hard_res)
})

test_that("easy_remove_legend works with single character argument", {
  easy_res <- p + easy_remove_legend("size")
  hard_res <- p + guides(size = FALSE)
  expect_eqNe(easy_res, hard_res)
})

test_that("easy_remove_legend works with single bare argument", {
  easy_res <- p + easy_remove_legend(size)
  hard_res <- p + guides(size = FALSE)
  expect_eqNe(easy_res, hard_res)
})

test_that("easy_remove_legend works with multiple character arguments", {
  easy_res <- p + easy_remove_legend("size", "color")
  hard_res <- p + guides(size = FALSE, color = FALSE)
  expect_eqNe(easy_res, hard_res)
})

test_that("easy_remove_legend works with multiple bare arguments", {
  easy_res <- p + easy_remove_legend(size, color)
  hard_res <- p + guides(size = FALSE, color = FALSE)
  expect_eqNe(easy_res, hard_res)
})

test_that("easy_remove_legend teach = TRUE works with no other arguments", {
  teach_message <- capture_messages({p + easy_remove_legend(teach = TRUE)})[2]
  easy_res <- easy_remove_legend()
  teach_res <- rlang::eval_bare(rlang::parse_expr(teach_message))
  expect_message(p + easy_remove_legend(teach = TRUE))
  expect_eqNe(easy_res, teach_res)
})

test_that("easy_remove_legend teach = TRUE works with specific aes", {
  teach_message <- capture_messages({p + easy_remove_legend(size, teach = TRUE)})[2]
  easy_res <- easy_remove_legend(size)
  teach_res <- rlang::eval_bare(rlang::parse_expr(teach_message))
  expect_message(p + easy_remove_legend(size, teach = TRUE))
  expect_eqNe(easy_res, teach_res)
})

test_that("easy_remove_legend teach = TRUE works with multiple aes", {
  teach_message <- capture_messages({p + easy_remove_legend(size, color, teach = TRUE)})[2]
  easy_res <- easy_remove_legend(size, color)
  teach_res <- rlang::eval_bare(rlang::parse_expr(teach_message))
  expect_message(p + easy_remove_legend(size, teach = TRUE))
  expect_eqNe(easy_res, teach_res)
})

context("move legend")

test_that("easy_change_legend errors with no argument", {
  expect_error(p + easy_change_legend(), "is missing")
})

test_that("easy_change_legend works with combinations", {
  easy_res <- p + easy_change_legend("position", "right")
  hard_res <- p + theme(legend.position = "right")
  expect_eqNe(easy_res, hard_res)
  easy_res <- p + easy_change_legend("position", "bottom")
  hard_res <- p + theme(legend.position = "bottom")
  expect_eqNe(easy_res, hard_res)
  easy_res <- p + easy_change_legend("position", "top")
  hard_res <- p + theme(legend.position = "top")
  expect_eqNe(easy_res, hard_res)
  easy_res <- p + easy_change_legend("position", "left")
  hard_res <- p + theme(legend.position = "left")
  expect_eqNe(easy_res, hard_res)
})

test_that("easy_move_legend works with no argument", {
  easy_res <- p + easy_move_legend()
  hard_res <- p + theme(legend.position = "right")
  expect_eqNe(easy_res, hard_res)
})

test_that("easy_move_legend works with specified argument", {
  easy_res <- p + easy_move_legend("bottom")
  hard_res <- p + theme(legend.position = "bottom")
  expect_eqNe(easy_res, hard_res)
  easy_res <- p + easy_move_legend("top")
  hard_res <- p + theme(legend.position = "top")
  expect_eqNe(easy_res, hard_res)
  easy_res <- p + easy_move_legend("left")
  hard_res <- p + theme(legend.position = "left")
  expect_eqNe(easy_res, hard_res)
})

test_that("easy_move_legend errors with bad argument", {
  expect_error(p + easy_move_legend("foo"), "should be one of")
})

test_that("easy_move_legend aliases work", {
  easy_res <- p + easy_legend_at("bottom")
  hard_res <- p + theme(legend.position = "bottom")
  expect_eqNe(easy_res, hard_res)
  easy_res <- p + easy_legend_at("top")
  hard_res <- p + theme(legend.position = "top")
  expect_eqNe(easy_res, hard_res)
  easy_res <- p + easy_legend_at("left")
  hard_res <- p + theme(legend.position = "left")
  expect_eqNe(easy_res, hard_res)
})

test_that("easy_move_legend teach = TRUE works with combinations", {
  easy_res <- p + easy_move_legend("bottom", teach = TRUE)
  hard_res <- p + theme(legend.position = "bottom")
  expect_message(p + easy_move_legend("bottom", teach = TRUE), regexp = 'easy_move_legend("bottom")', fixed = TRUE)
  expect_message(p + easy_move_legend("bottom", teach = TRUE), regexp = 'can be substituted with:', fixed = TRUE)
  expect_message(p + easy_move_legend("bottom", teach = TRUE), regexp = 'theme(legend.position = "bottom")', fixed = TRUE)
  expect_eqNe(easy_res, hard_res)
})

test_that("easy_legend_at teach = TRUE works with combinations", {
  easy_res <- p + easy_legend_at("bottom", teach = TRUE)
  hard_res <- p + theme(legend.position = "bottom")
  expect_message(p + easy_legend_at("bottom", teach = TRUE), regexp = 'easy_legend_at("bottom")', fixed = TRUE)
  expect_message(p + easy_legend_at("bottom", teach = TRUE), regexp = 'can be substituted with:', fixed = TRUE)
  expect_message(p + easy_legend_at("bottom", teach = TRUE), regexp = 'theme(legend.position = "bottom")', fixed = TRUE)
  expect_eqNe(easy_res, hard_res)
})

test_that("easy_change_legend teach = TRUE works with position", {
  easy_res <- p + easy_change_legend("position", "bottom", teach = TRUE)
  hard_res <- p + theme(legend.position = "bottom")
  expect_message(p + easy_change_legend("position", "bottom", teach = TRUE), regexp = 'can be substituted with:', fixed = TRUE)
  expect_message(p + easy_change_legend("position", "bottom", teach = TRUE), regexp = 'theme(legend.position = "bottom")', fixed = TRUE)
  expect_eqNe(easy_res, hard_res)
})

context("legend direction")

test_that("easy_rotate_legend works with no argument", {
  easy_res <- p + easy_rotate_legend()
  hard_res <- p + theme(legend.direction = "vertical")
  expect_eqNe(easy_res, hard_res)
})

test_that("easy_rotate_legend works with combinations", {
  easy_res <- p + easy_change_legend("direction", "vertical")
  hard_res <- p + theme(legend.direction = "vertical")
  expect_eqNe(easy_res, hard_res)
  easy_res <- p + easy_change_legend("direction", "horizontal")
  hard_res <- p + theme(legend.direction = "horizontal")
  expect_eqNe(easy_res, hard_res)
  easy_res <- p + easy_rotate_legend("vertical")
  hard_res <- p + theme(legend.direction = "vertical")
  expect_eqNe(easy_res, hard_res)
  easy_res <- p + easy_rotate_legend("horizontal")
  hard_res <- p + theme(legend.direction = "horizontal")
  expect_eqNe(easy_res, hard_res)
})

test_that("easy_rotate_legend teach = TRUE works with combinations", {
  easy_res <- p + easy_rotate_legend("horizontal", teach = TRUE)
  hard_res <- p + theme(legend.direction = "horizontal")
  expect_message(p + easy_rotate_legend("horizontal", teach = TRUE), regexp = 'easy_rotate_legend("horizontal"', fixed = TRUE)
  expect_message(p + easy_rotate_legend("horizontal", teach = TRUE), regexp = 'can be substituted with:', fixed = TRUE)
  expect_message(p + easy_rotate_legend("horizontal", teach = TRUE), regexp = 'theme(legend.direction = "horizontal")', fixed = TRUE)
  expect_eqNe(easy_res, hard_res)
})

context("legend justification")

test_that("easy_adjust_legend works with no argument", {
  easy_res <- p + easy_adjust_legend()
  hard_res <- p + theme(legend.justification = "left")
  expect_eqNe(easy_res, hard_res)
})

test_that("easy_adjust_legend works with combinations", {
  easy_res <- p + easy_change_legend("justification", "left")
  hard_res <- p + theme(legend.justification = "left")
  expect_eqNe(easy_res, hard_res)
  easy_res <- p + easy_change_legend("justification", "right")
  hard_res <- p + theme(legend.justification = "right")
  expect_eqNe(easy_res, hard_res)
  easy_res <- p + easy_change_legend("justification", "center")
  hard_res <- p + theme(legend.justification = "center")
  expect_eqNe(easy_res, hard_res)
})

test_that("easy_adjust_legend errors with bad argument", {
  expect_error(p + easy_adjust_legend("foo"), "should be one of")
})

test_that("easy_adjust_legend teach = TRUE works with justification", {
  easy_res <- p + easy_adjust_legend("right", teach = TRUE)
  hard_res <- p + theme(legend.justification = "right")
  expect_message(p + easy_adjust_legend("right", teach = TRUE), regexp = 'can be substituted with:', fixed = TRUE)
  expect_message(p + easy_adjust_legend("right", teach = TRUE), regexp = 'theme(legend.justification = "right")', fixed = TRUE)
  expect_eqNe(easy_res, hard_res)
})

test_that("easy_change_legend teach = TRUE works with justification", {
  easy_res <- p + easy_change_legend("justification", "center", teach = TRUE)
  hard_res <- p + theme(legend.justification = "center")
  expect_message(p + easy_change_legend("justification", "center", teach = TRUE), regexp = 'can be substituted with:', fixed = TRUE)
  expect_message(p + easy_change_legend("justification", "center", teach = TRUE), regexp = 'theme(legend.justification = "center")', fixed = TRUE)
  expect_eqNe(easy_res, hard_res)
})

test_that("easy_rotate_legend teach = TRUE works with combinations", {
  easy_res <- p + easy_rotate_legend("horizontal", teach = TRUE)
  hard_res <- p + theme(legend.direction = "horizontal")
  expect_message(p + easy_rotate_legend("horizontal", teach = TRUE), regexp = 'easy_rotate_legend("horizontal"', fixed = TRUE)
  expect_message(p + easy_rotate_legend("horizontal", teach = TRUE), regexp = 'can be substituted with:', fixed = TRUE)
  expect_message(p + easy_rotate_legend("horizontal", teach = TRUE), regexp = 'theme(legend.direction = "horizontal")', fixed = TRUE)
  expect_eqNe(easy_res, hard_res)
})

context("legend title")

test_that("easy_add_legend_title errors with no argument", {
  expect_error(p + easy_add_legend_title(), "No title provided")
})

test_that("easy_add_legend_title relabels a single legend title", {
  easy_res <- p + easy_add_legend_title(col = "nCylinders")
  hard_res <- p + labs(col = "nCylinders")
  expect_eqNe(easy_res, hard_res)
})

test_that("easy_add_legend_title relabels all legend titles", {
  easy_res <- p + easy_add_legend_title("title")
  hard_res <- p + labs(colour = "title", size = "title")
  for (el in setdiff(names(hard_res), "labels")) {
    expect_eqNe(easy_res[[el]], hard_res[[el]])
  }
  expect_eqNe(easy_res$labels[c("size", "colour")], hard_res$labels[c("size", "colour")])
})

test_that("easy_add_legend_title teach = TRUE works with specific aes", {
  easy_res <- p + easy_add_legend_title(col = "nCylinders", teach = TRUE)
  hard_res <- p + labs(colour = "nCylinders")
  expect_message(p + easy_add_legend_title(col = "nCylinders", teach = TRUE), regexp = 'easy_add_legend_title(col = "nCylinders"', fixed = TRUE)
  expect_message(p + easy_add_legend_title(col = "nCylinders", teach = TRUE), regexp = 'can be substituted with:', fixed = TRUE)
  expect_message(p + easy_add_legend_title(col = "nCylinders", teach = TRUE), regexp = 'labs(col = "nCylinders")', fixed = TRUE)
  expect_eqNe(easy_res, hard_res)
})

test_that("easy_add_legend_title teach = TRUE works with unspecific aes", {
  easy_res <- p + easy_add_legend_title("title", teach = TRUE)
  hard_res <- p + labs(colour = "title", size = "title")
  expect_message(p + easy_add_legend_title("title", teach = TRUE), regexp = 'easy_add_legend_title("title"', fixed = TRUE)
  expect_message(p + easy_add_legend_title("title", teach = TRUE), regexp = 'can be substituted with:', fixed = TRUE)
  expect_message(p + easy_add_legend_title("title", teach = TRUE), regexp = 'labs(YOUR_AES = "title")', fixed = TRUE)
  for (el in setdiff(names(hard_res), "labels")) {
    expect_eqNe(easy_res[[el]], hard_res[[el]])
  }
  expect_eqNe(easy_res$labels[c("size", "colour")], hard_res$labels[c("size", "colour")])
})



test_that("easy_remove_legend_title works", {
  easy_res <- p + easy_remove_legend_title()
  hard_res <- p + ggplot2::theme(legend.title = ggplot2::element_blank())
  expect_eqNe(easy_res, hard_res)
})
