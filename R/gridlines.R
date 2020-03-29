#' Easily remove gridlines
#'
#' Easily remove any gridlines from a \code{ggplot}.
#'
#' @param minor Should minor grid lines be removed? By default \code{TRUE}.
#' @param major Should major grid lines be removed? By default \code{TRUE}.
#' @param teach Should the equivalent \code{ggplot2} expression be printed? By
#'        default \code{FALSE}.
#'
#' @return a \code{\link[ggplot2]{theme}} object which can be used in
#' \code{\link[ggplot2]{ggplot2}} calls
#'
#' @author Thomas Neitmann
#'
#' @examples
#' library(ggplot2)
#' p <- ggplot(mtcars, aes(hp, mpg))
#'
#' # remove all grid lines at once
#' p + easy_remove_gridlines()
#'
#' # remove all minor grid lines
#' p + easy_remove_gridlines(major = FALSE)
#'
#' # remove all major grid lines
#' p + easy_remove_gridlines(minor = FALSE)
#'
#' # remove x gridlines
#' p + easy_remove_x_gridlines()
#'
#' # remove y gridlines
#' p + easy_remove_y_gridlines()
#'
#' @export
easy_remove_gridlines <- function(minor = TRUE, major = TRUE, teach = FALSE) {
  args <- list()
  if (minor) {
    args$panel.grid.minor <- quote(element_blank())
  }
  if (major) {
    args$panel.grid.major <- quote(element_blank())
  }

  if (teach) {
    teach_message(args)
  }

  do.call(theme, args)
}

#' @export
#' @rdname easy_remove_gridlines
easy_remove_x_gridlines <- function(minor = TRUE, major = TRUE, teach = FALSE) {
  args <- list()
  if (minor) {
    args$panel.grid.minor.x <- quote(element_blank())
  }
  if (major) {
    args$panel.grid.major.x <- quote(element_blank())
  }

  if (teach) {
    teach_message(args)
  }

  do.call(theme, args)
}

#' @export
#' @rdname easy_remove_gridlines
easy_remove_y_gridlines <- function(minor = TRUE, major = TRUE, teach = FALSE) {
  args <- list()
  if (minor) {
    args$panel.grid.minor.y <- quote(element_blank())
  }
  if (major) {
    args$panel.grid.major.y <- quote(element_blank())
  }

  if (teach) {
    teach_message(args)
  }

  do.call(theme, args)
}
