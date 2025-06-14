tg_bounds <- function(tg, lab, theta) {
  bounds <- grid:::grid.Call(
    grid:::L_textBounds,
    grDevices::as.graphicsAnnot(tg$label[lab]),
    tg$x[lab],
    tg$y[lab],
    resolveHJust(tg$just, tg$hjust),
    resolveVJust(tg$just, tg$vjust),
    tg$rot,
    theta
  )
  bounds <- unit(bounds, "inches")
  convertUnit(bounds, unitTo = attr(tg$x, 'unit'), valueOnly = TRUE)
}

extend_bound <- function(bounds, rot, draw = FALSE) {
  #left right center points
  xy <- rotatePoint(
    pivot = c(mean(bounds[c(180, 360), 1]), bounds[180, 2]),
    point = matrix(
      c(
        median(bounds[, 1]) - bounds[1, 3],
        bounds[180, 2],
        median(bounds[, 1]) + bounds[1, 3],
        bounds[180, 2]
      ),
      ncol = 2,
      byrow = TRUE
    ),
    rot = rot
  )

  #top/bottom left vertices
  xy_l <- rotatePoint(
    pivot = xy[1, ],
    point = matrix(
      c(xy[1, 1], xy[1, 2] + bounds1[1, 4], xy[1, 1], xy[1, 2] - bounds1[1, 4]),
      ncol = 2,
      byrow = TRUE
    ),
    rot = rot
  )
  #top/bottom right vertices
  xy_r <- rotatePoint(
    pivot = xy[2, ],
    point = matrix(
      c(xy[2, 1], xy[2, 2] + bounds1[2, 4], xy[2, 1], xy[2, 2] - bounds1[2, 4]),
      ncol = 2,
      byrow = TRUE
    ),
    rot = rot
  )

  ret <- rbind(xy_l, xy_r)

  if (draw) lines(ret[c(3, 1, 2, 4, 3), 1], ret[c(3, 1, 2, 4, 3), 2])

  ret <- ret[c(3, 1, 2, 4), ]

  return(ret)
}

rotatePoint <- function(pivot, point, rot) {
  # Rotate clockwise, angle in radians
  rad <- rot * pi / 180
  x <- (cos(rad) * (point[, 1] - pivot[1])) -
    (sin(rad) * (point[, 2] - pivot[2])) +
    pivot[1]
  y <- (sin(rad) * (point[, 1] - pivot[1])) +
    (cos(rad) * (point[, 2] - pivot[2])) +
    pivot[2]
  return(cbind(x, y))
}

txt <- c("Hi there", "Hi there")
rot <- 0 #rotation for text boxes

this_tg <- textGrob(label = txt, x = c(0.25, 0.4), y = c(0.5, 0.5), rot = rot)

bounds1 <- do.call(
  'rbind',
  lapply(seq(1, 360, 1), tg_bounds, tg = this_tg, lab = 1)
)
bounds2 <- do.call(
  'rbind',
  lapply(seq(1, 360, 1), tg_bounds, tg = this_tg, lab = 2)
)

plot(bounds1[, c(1:2)], type = 'l', xlim = c(0, .6), ylim = c(0, .6))
xy <- extend_bound(bounds1, rot = rot, draw = TRUE)
lines(bounds2[, c(1:2)])
xy2 <- extend_bound(bounds2, rot = rot, draw = TRUE)
