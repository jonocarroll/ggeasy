#' Easily rotate `x` axis labels
#'
#' A shortcut to
#'
#' theme(axis.text.x = element_text(angle, hjust))
#'
#'
#' @md
#' @param angle angle through which the text should be rotated. Can also be one
#'   of "startattop" or "startatbottom" to define where the text should start.
#' @param side horizontal justification of the text before rotation
#' @param ... additional arguments to be passed to
#'   \code{\link[ggplot2]{element_text}}
#'
#' @return a \code{\link[ggplot2]{theme}} object which can be used in
#'   \code{\link[ggplot2]{ggplot2}} calls.
#' @export
#'
#' @examples
#' library(ggplot2)
#' ggplot(mtcars, aes(mpg, hp)) +
#'   geom_point() +
#'   easy_rotate_x_labels()
easy_rotate_x_labels <- function(angle = 90, side = c("left", "middle", "right"), ...) {
    hjust <- switch(
        match.arg(side),
        left = 0,
        middle = 0.5,
        right = 1
    )
    angle <- if (is.numeric(angle) | is.integer(angle)) {
       angle
    } else if (is.character(angle)) {
       switch(angle,
              startattop = -90,
              startatbottom = 90)
    }
    ggplot2::theme(axis.text.x = ggplot2::element_text(angle = angle, hjust = hjust))
}


