context("test-rotate_labels.R")


test_that("facet label rotating works properly", {
  test_data <- rbind(
    data.frame(
      facet = c("a very very very very long facet name 1"),
      facet2 = c("a very very very very long facet name 1"),
      x = runif(10),
      y = runif(10),
      stringsAsFactors = FALSE
    ),
    data.frame(
      facet = c("a very very very long facet name 2"),
      facet2 = c("a very very very very very very very long facet name 1"),
      x = rnorm(10),
      y = rnorm(10),
      stringsAsFactors = FALSE
    ),
    data.frame(
      facet = c("a very very long facet name 3"),
      facet2 = c("a very very very very long facet name 2"),
      x = rlnorm(10),
      y = rlnorm(10),
      stringsAsFactors = FALSE
    ),
    data.frame(
      facet = c("a very long facet name 4"),
      facet2 = c("a very very very very long facet name 2"),
      x = rlnorm(10),
      y = rlnorm(10),
      stringsAsFactors = FALSE
    )
  )
  
  p <- ggplot2::ggplot(test_data, ggplot2::aes(x, y)) + ggplot2::geom_point()
  
  print(
    p +
      ggplot2::facet_grid(facet2 ~ facet) +
      easy_rotate_facet_labels(45, direction = c("x", "y")) +
      ggplot2::labs(caption = "x and y labels rotated by 45 degrees with no strip background")
  )
  
  print(
    p +
      ggplot2::facet_grid(facet2 ~ facet, switch = "both") +
      easy_rotate_facet_labels(45, direction = c("x", "y")) +
      ggplot2::labs(caption = "x and y labels rotated by 45 degrees with no strip background")
  )
  
  print(
    p +
      ggplot2::facet_grid(facet2 ~ facet) +
      easy_rotate_facet_labels(45) +
      ggplot2::labs(caption = "only x rotated by 45 degrees (default) with no strip background")
  )
  
  print(
    p +
      ggplot2::facet_grid(facet2 ~ facet, switch = "both") +
      easy_rotate_facet_labels(45, direction = "x") +
      ggplot2::labs(caption = "only x rotated by 45 degrees with no strip background (lack of clip on left is not our fault ggplot2 #2772...)")
  )
  
  print(
    p +
      ggplot2::facet_grid(facet2 ~ facet) +
      easy_rotate_facet_labels(45, direction = "y") +
      ggplot2::labs(caption = "only y rotated by 45 degrees with no strip background")
  )
  
  print(
    p +
      ggplot2::facet_grid(facet2 ~ facet, switch = "both") +
      easy_rotate_facet_labels(45, direction = "y") +
      ggplot2::labs(caption = "only y rotated by 45 degrees with no strip background")
  )
  
  print(
    p +
      ggplot2::facet_grid(facet2 ~ facet) +
      easy_rotate_facet_labels(-45, direction = c("x", "y")) +
      ggplot2::labs(caption = "labels rotated by -45 degrees in both directions (text base should align to top/right of plot)")
  )
  
  print(
    p +
      ggplot2::facet_grid(facet2 ~ facet, switch = "both") +
      easy_rotate_facet_labels(-45, direction = c("x", "y")) +
      ggplot2::labs(caption = "labels rotated by -45 degrees in both directions (text base should align to top/right of plot)")
  )
  
  print(
    p +
      ggplot2::facet_grid(facet2 ~ facet) +
      easy_rotate_facet_labels(0, direction = c("x", "y")) +
      ggplot2::labs(caption = "labels rotated by 0 degrees in both directions (text should align to middle)")
  )
  
  print(
    p +
      ggplot2::facet_grid(facet2 ~ facet, switch = "both") +
      easy_rotate_facet_labels(0, direction = c("x", "y")) +
      ggplot2::labs(caption = "labels rotated by 0 degrees in both directions (text should align to middle)")
  )
  
  print(
    p +
      ggplot2::facet_grid(facet2 ~ facet) +
      easy_rotate_facet_labels(90, direction = c("x", "y")) +
      ggplot2::labs(caption = "labels rotated by 90 degrees in both directions (text should align to middle)")
  )
  
  print(
    p +
      ggplot2::facet_grid(facet2 ~ facet, switch = "both") +
      easy_rotate_facet_labels(90, direction = c("x", "y")) +
      ggplot2::labs(caption = "labels rotated by 90 degrees in both directions (text should align to middle)")
  )
  
  print(
    p +
      ggplot2::facet_grid(facet2 ~ facet) +
      easy_rotate_facet_labels(-90, direction = c("x", "y")) +
      ggplot2::labs(caption = "labels rotated by -90 degrees in both directions (text should align to middle)")
  )
  
  print(
    p +
      ggplot2::facet_grid(facet2 ~ facet, switch = "both") +
      easy_rotate_facet_labels(-90, direction = c("x", "y")) +
      ggplot2::labs(caption = "labels rotated by -90 degrees in both directions (text should align to middle)")
  )
  
  print(
    p +
      ggplot2::facet_wrap(~facet, strip.position = "top") +
      easy_rotate_facet_labels(45, direction = c("x", "y")) +
      ggplot2::labs(caption = "facet_wrap with top labels, 45 degree rotation")
  )
  
  print(
    p +
      ggplot2::facet_wrap(~facet, strip.position = "left") +
      easy_rotate_facet_labels(45, direction = c("x", "y")) +
      ggplot2::labs(caption = "facet_wrap with left labels, 45 degree rotation")
  )
  
  print(
    p +
      ggplot2::facet_wrap(~facet, strip.position = "bottom") +
      easy_rotate_facet_labels(45, direction = c("x", "y")) +
      ggplot2::labs(caption = "facet_wrap with bottom labels, 45 degree rotation")
  )
  
  print(
    p +
      ggplot2::facet_wrap(~facet, strip.position = "right") +
      easy_rotate_facet_labels(45, direction = c("x", "y")) +
      ggplot2::labs(caption = "facet_wrap with right labels, 45 degree rotation")
  )
  
  expect_true(TRUE)
})

test_that("axis label rotating works properly", {
  p <- ggplot2::ggplot(
    data.frame(x = runif(10), y = runif(10)),
    ggplot2::aes(x, y)
  ) +
    ggplot2::geom_point() +
    ggplot2::scale_x_continuous(
      breaks = c(0, 0.2, 0.4, 0.6, 0.8, 1),
      labels = c("0", "0.2000000", "0.4", "0.6000", "0.80", "1.000"),
      limits = c(0, 1),
      sec.axis = ggplot2::dup_axis()
    ) +
    ggplot2::scale_y_continuous(
      breaks = c(0, 0.2, 0.4, 0.6, 0.8, 1),
      labels = c("0", "0.2000000", "0.4", "0.6000", "0.80", "1.000"),
      limits = c(0, 1),
      sec.axis = ggplot2::dup_axis()
    )
  
  print(
    p +
      easy_rotate_axis_labels(0, direction = c("x", "y")) +
      ggplot2::labs(caption = "axis labels rotated by 0 degrees, text aligned naturally")
  )
  
  print(
    p +
      easy_rotate_axis_labels(90, direction = c("x", "y")) +
      ggplot2::labs(caption = "axis labels rotated by 90 degrees, text aligned naturally")
  )
  
  print(
    p +
      easy_rotate_axis_labels(-90, direction = c("x", "y")) +
      ggplot2::labs(caption = "axis labels rotated by 90 degrees, text aligned naturally")
  )
  
  print(
    p +
      easy_rotate_axis_labels(45, direction = c("x", "y")) +
      ggplot2::labs(caption = "axis labels rotated by 90 degrees, text aligned naturally")
  )
  
  print(
    p +
      easy_rotate_axis_labels(-45, direction = c("x", "y")) +
      ggplot2::labs(caption = "axis labels rotated by 90 degrees, text aligned naturally")
  )
  
  # plot-generating tests
  expect_true(TRUE)
})
