#' Easily remove gridlines
#'
#' Easily remove any gridlines from a \code{ggplot}.
#'
#' @param axis From which axis should grid lines be removed? By default \code{"both"}.
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
#'  + geom_point()
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
#' # or
#' p + easy_remove_gridlines(axis = "x")
#'
#' # remove y gridlines
#' p + easy_remove_y_gridlines()
#'
#' @export
easy_remove_gridlines <- function(axis = c("both", "x", "y"), minor = TRUE, major = TRUE, teach = FALSE) {

  axis <- match.arg(axis)
  suffix <- ifelse(axis == "both", "", paste0(".", axis))

  args <- list()
  if (minor) {
    args[[paste0("panel.grid.minor", suffix)]] <- quote(element_blank())
  }
  if (major) {
    args[[paste0("panel.grid.major", suffix)]] <- quote(element_blank())
  }

  if (teach) {
    teach_message(args)
  }

  do.call(theme, args)
}

#' @export
#' @rdname easy_remove_gridlines
easy_remove_x_gridlines <- function(minor = TRUE, major = TRUE, teach = FALSE) {
  easy_remove_gridlines(axis = "x", minor = minor, major = major, teach = teach)
}

#' @export
#' @rdname easy_remove_gridlines
easy_remove_y_gridlines <- function(minor = TRUE, major = TRUE, teach = FALSE) {
  easy_remove_gridlines(axis = "y", minor = minor, major = major, teach = teach)
}

