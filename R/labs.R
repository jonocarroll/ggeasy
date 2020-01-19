#' Easily rotate `x` axis labels
#'
#' A shortcut to
#'
#' theme(axis.text.x = element_text(angle, hjust))
#'
#' @md
#' @param which which axis or axes to rotate, by default "both"
#' @param angle angle through which the text should be rotated. Can also be one
#'   of "startattop" or "startatbottom" to define where the text should start.
#' @param side horizontal justification of the text before rotation
#' @param teach print longer equivalent \code{\link[ggplot2]{ggplot2}}
#' expression?
#'
#' @return a \code{\link[ggplot2]{theme}} object which can be used in
#'   \code{\link[ggplot2]{ggplot2}} calls.
#' @export
#'
#' @examples
#' library(ggplot2)
#' ggplot(mtcars, aes(mpg, hp)) +
#'   geom_point() +
#'   easy_rotate_labels()
easy_rotate_labels <- function(which = c("both", "x", "y"),
                               angle = 90,
                               side = c("left", "middle", "right"),
                               teach = FALSE) {
  axis <- match.arg(which)
  hjust <- switch(
    match.arg(side),
    left = 0,
    middle = 0.5,
    right = 1
  )
  angle <- if (is.numeric(angle) || is.integer(angle)) {
    angle
  } else if (is.character(angle)) {
    switch(angle,
           startattop = -90,
           startatbottom = 90,
           stop("angle not recognised. Accepts: startattop, startatbottom", call. = FALSE)
    )
  }

  fun_name <- paste0("easy_rotate_", ifelse(axis == "both", "", paste0(which, "_")), "labels")
  axis_suffix <- if (axis == "both") "" else paste0(".", which)

  rotations <- lapply(axis, function(x) ggplot2::element_text(angle = angle, hjust = hjust))
  names(rotations) <- paste0("axis.text", axis_suffix)

  if (teach) {
    rotation_strings <- paste0(names(rotations),
                               " = element_text(angle = ", angle,
                               ", hjust = ", hjust, ")")
    message(paste0(fun_name, " call can be substituted with:"))
    message(strwrap(
      paste0("theme(", paste(rotation_strings), ")"),
      width = 80,
      exdent = 2,
      prefix = "\n",
      initial = ""
    ))
  }

  do.call(theme, rotations)
}

#' @export
#' @rdname easy_rotate_labels
easy_rotate_x_labels <- function(angle = 90,
                                 side = c("left", "middle", "right"),
                                 teach = FALSE) {
  easy_rotate_labels(which = "x", angle = angle, side = side, teach = teach)
}

#' @export
#' @rdname easy_rotate_labels
easy_rotate_y_labels <- function(angle = 90,
                                 side = c("left", "middle", "right"),
                                 teach = FALSE) {
  easy_rotate_labels(which = "y", angle = angle, side = side, teach = teach)
}
