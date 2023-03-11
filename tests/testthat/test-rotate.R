context("rotate labels")

expect_eqNe <- function(...) expect_equal(..., check.environment = FALSE)

p <- ggplot2::ggplot(mtcars, ggplot2::aes(mpg, hp)) + geom_point()

test_that("rotation of both labels", {
    hard_res_both_90_left <- p + ggplot2::theme(axis.text = element_text(angle = 90, hjust = 0))
    easy_res_both_90_left <- p + easy_rotate_labels(side = "left")
    expect_eqNe(hard_res_both_90_left, easy_res_both_90_left)

    hard_res_both_90_right <- p + ggplot2::theme(axis.text = element_text(angle = 90, hjust = 1))
    easy_res_both_90_right <- p + easy_rotate_labels(side = "right")
    expect_eqNe(hard_res_both_90_right, easy_res_both_90_right)

    hard_res_both_45_right <- p + ggplot2::theme(axis.text = element_text(angle = 45, hjust = 1))
    easy_res_both_45_right <- p + easy_rotate_labels(angle = 45, side = "right")
    expect_eqNe(hard_res_both_45_right, easy_res_both_45_right)

    hard_res_both_top_right <- p + ggplot2::theme(axis.text = element_text(angle = -90, hjust = 1))
    easy_res_both_top_right <- p + easy_rotate_labels(angle = "startattop", side = "right")
    expect_eqNe(hard_res_both_top_right, easy_res_both_top_right)

    hard_res_both_bottom_right <- p + ggplot2::theme(axis.text = element_text(angle = 90, hjust = 1))
    easy_res_both_bottom_right <- p + easy_rotate_labels(angle = "startatbottom", side = "right")
    expect_eqNe(hard_res_both_bottom_right, easy_res_both_bottom_right)

    ## correct values in teach
    expect_message(p + easy_rotate_labels(side = "left", teach = TRUE), regexp = "angle = 90, hjust = 0")
    expect_message(p + easy_rotate_labels(side = "right", teach = TRUE), regexp = "angle = 90, hjust = 1")
    expect_message(p + easy_rotate_labels(angle = 45, side = "right", teach = TRUE), regexp = "angle = 45, hjust = 1")

    ## teach message contains actual function call
    expect_message(p + easy_rotate_x_labels(angle = 45, teach = TRUE), regexp = "easy_rotate_x_labels")
    expect_message(p + easy_rotate_y_labels(angle = 45, teach = TRUE), regexp = "easy_rotate_y_labels")
    expect_message(p + easy_rotate_labels(angle = 45, teach = TRUE), regexp = "easy_rotate_labels")

    ## teach message is correct
    easy_res_test_teach <- easy_rotate_labels(angle = 45, side = "right")
    teach_message <- capture_messages({p + easy_rotate_labels(angle = 45, side = "right", teach = TRUE)})[2]
    teach_res <- rlang::eval_bare(rlang::parse_expr(teach_message))
    expect_eqNe(easy_res_test_teach, teach_res)

    easy_res_test_teach <- easy_rotate_labels(angle = "startattop", side = "right")
    teach_message <- capture_messages({p + easy_rotate_labels(angle = "startattop", side = "right", teach = TRUE)})[2]
    teach_res <- rlang::eval_bare(rlang::parse_expr(teach_message))
    expect_eqNe(easy_res_test_teach, teach_res)

    easy_res_test_teach <- easy_rotate_x_labels(angle = 45, side = "right")
    teach_message <- capture_messages({p + easy_rotate_x_labels(angle = 45, side = "right", teach = TRUE)})[2]
    teach_res <- rlang::eval_bare(rlang::parse_expr(teach_message))
    expect_eqNe(easy_res_test_teach, teach_res)

    ## unrecognised values
    expect_error(p + easy_rotate_labels(which = "foo"), regexp = "should be one of")
    expect_error(p + easy_rotate_labels(angle = "foo"), regexp = "not recognised")
    expect_error(p + easy_rotate_labels(side = "foo"), regexp = "should be one of")

})

test_that("rotation of x labels", {
    hard_res_x_90_left <- p + ggplot2::theme(axis.text.x = element_text(angle = 90, hjust = 0))
    easy_res_x_90_left <- p + easy_rotate_x_labels(side = "left")
    expect_eqNe(hard_res_x_90_left, easy_res_x_90_left)

    hard_res_x_90_right <- p + ggplot2::theme(axis.text.x = element_text(angle = 90, hjust = 1))
    easy_res_x_90_right <- p + easy_rotate_x_labels(side = "right")
    expect_eqNe(hard_res_x_90_right, easy_res_x_90_right)

    hard_res_x_45_right <- p + ggplot2::theme(axis.text.x = element_text(angle = 45, hjust = 1))
    easy_res_x_45_right <- p + easy_rotate_x_labels(angle = 45, side = "right")
    expect_eqNe(hard_res_x_45_right, easy_res_x_45_right)
})


test_that("rotation of y labels", {
    hard_res_y_90_left <- p + ggplot2::theme(axis.text.y = element_text(angle = 90, hjust = 0))
    easy_res_y_90_left <- p + easy_rotate_y_labels(side = "left")
    expect_eqNe(hard_res_y_90_left, easy_res_y_90_left)

    hard_res_y_90_right <- p + ggplot2::theme(axis.text.y = element_text(angle = 90, hjust = 1))
    easy_res_y_90_right <- p + easy_rotate_y_labels(side = "right")
    expect_eqNe(hard_res_y_90_right, easy_res_y_90_right)

    hard_res_y_45_right <- p + ggplot2::theme(axis.text.y = element_text(angle = 45, hjust = 1))
    easy_res_y_45_right <- p + easy_rotate_y_labels(angle = 45, side = "right")
    expect_eqNe(hard_res_y_45_right, easy_res_y_45_right)
})
