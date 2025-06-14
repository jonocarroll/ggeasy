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

rg_bounds <- function(rg, lab, theta) {
  bounds <- grid:::grid.Call(
    grid:::L_rectBounds,
    rg$x[lab],
    rg$y[lab],
    rg$width[lab],
    rg$height[lab],
    resolveHJust(rg$just, rg$hjust),
    resolveVJust(rg$just, rg$vjust),
    theta
  )
  bounds <- unit(bounds, "inches")
  convertUnit(bounds, unitTo = attr(rg$x, 'unit'), valueOnly = TRUE)
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

linesIntersect <- function(x1, x2, x3, x4, y1, y2, y3, y4) {
  result = 0
  denom = (y4 - y3) * (x2 - x1) - (x4 - x3) * (y2 - y1)
  ua = ((x4 - x3) * (y1 - y3) - (y4 - y3) * (x1 - x3))

  # If the lines are parallel ...

  if (denom == 0) {
    # If the lines are coincident ...

    if (ua == 0) {
      # If the lines are vertical ...

      if (x1 == x2) {
        # Compare y-values

        if (
          !((y1 < y3 && max(y1, y2) < min(y3, y4)) ||
            (y3 < y1 && max(y3, y4) < min(y1, y2)))
        )
          result = 1
      } else {
        # Compare x-values

        if (
          !((x1 < x3 && max(x1, x2) < min(x3, x4)) ||
            (x3 < x1 && max(x3, x4) < min(x1, x2)))
        )
          result = 1
      }
    }
  } else {
    # ... otherwise, calculate where the lines intersect ...

    ub = ((x2 - x1) * (y1 - y3) - (y2 - y1) * (x1 - x3))

    ua = ua / denom

    ub = ub / denom
    # Check for overlap

    if ((ua > 0 && ua < 1) && (ub > 0 && ub < 1)) result = 1
  }
  return(result)
}

edgesIntersect <- function(x1, x2, y1, y2, r) {
  #r is LRect
  result = 0

  if (
    linesIntersect(x1, x2, r[1], r[2], y1, y2, r[5], r[6]) ||
      linesIntersect(x1, x2, r[2], r[3], y1, y2, r[6], r[7]) ||
      linesIntersect(x1, x2, r[3], r[4], y1, y2, r[7], r[8]) ||
      linesIntersect(x1, x2, r[4], r[1], y1, y2, r[8], r[1])
  )
    result = 1

  return(result)
}

rectIntersect <- function(r1, r2) {
  result = 0

  if (
    edgesIntersect(r1[1], r1[2], r1[5], r1[6], r2) ||
      edgesIntersect(r1[2], r1[2], r1[6], r1[7], r2) ||
      edgesIntersect(r1[3], r1[4], r1[7], r1[8], r2) ||
      edgesIntersect(r1[4], r1[1], r1[8], r1[1], r2)
  )
    result = 1

  return(result)
}

find_rot <- function(rot, tg) {
  this_tg <- tg0
  this_tg$rot <- rot
  bounds1 <- do.call(
    'rbind',
    lapply(seq(1, 360, 1), tg_bounds, tg = this_tg, lab = 1)
  )
  bounds2 <- do.call(
    'rbind',
    lapply(seq(1, 360, 1), tg_bounds, tg = this_tg, lab = 2)
  )
  plot(bounds1[, c(1:2)], type = 'l', xlim = c(-10, 15), ylim = c(300, 380))
  xy <- extend_bound(bounds1, rot = rot, draw = TRUE)
  lines(bounds2[, c(1:2)])
  xy2 <- extend_bound(bounds2, rot = rot, draw = TRUE)
  rectIntersect(r1 = c(xy), r2 = c(xy2))
}

txt <- c("Hi there", "Hi there")
tg <- textGrob(label = txt, x = c(0.25, 0.4), y = c(0.5, 0.5))

for (rot in 0:90) {
  if (find_rot(rot, tg) == 0) break
}

dev.off()
grid.newpage()
fg <- frameGrob()
tg <- textGrob(label = txt, x = c(0.25, 0.4), y = c(0.5, 0.5))
fg <- packGrob(fg, tg0)
grid.draw(fg)

grid.newpage()
fg <- frameGrob()
rg <- rectGrob(
  x = tg$x,
  y = tg$y,
  width = stringWidth(tg$label),
  height = stringHeight(tg$label)
)
fg <- packGrob(fg, rg)
fg <- packGrob(fg, tg)
grid.draw(fg)
