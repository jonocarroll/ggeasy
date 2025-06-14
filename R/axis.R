#' Easily remove one or more axes
#'
#' easy_remove_axes by default removes both axes, but can remove only x or y
#' if "x" or "y" is given to the 'which' argument
#'
#' easy_remove_x_axis and easy_remove_y_axis remove just the x or y axis,
#' respectively.
#'
#' @md
#' @param which which axis or axes to remove, by default "both"
#' @param what axis components to remove
#' (`"ticks"`, `"title"`, `"text"`, and/or `"line"`)
#' @param teach print longer equivalent \code{\link[ggplot2]{ggplot2}}
#' expression?
#'
#' @return  a \code{\link[ggplot2]{theme}} object  which can be used in
#' \code{\link[ggplot2]{ggplot2}} calls
#' @export
#' @author Alicia Schep
#'
#' @examples
#'
#' library(ggplot2)
#' # Remove all axes
#' ggplot(mtcars, aes(wt, mpg)) +
#'   geom_point() + easy_remove_axes()
#'
#' # remove just x axis
#' ggplot(mtcars, aes(wt, mpg)) +
#'   geom_point() + easy_remove_x_axis()
#'
#' # can also use:
#' ggplot(mtcars, aes(wt, mpg)) +
#'   geom_point() + easy_remove_axes("x")
#'
#' # Remove y axis
#' ggplot(mtcars, aes(wt, mpg)) +
#'   geom_point() + easy_remove_y_axis()
#'
#' # Remove just the ticks
#' # Remove y axis
#' ggplot(mtcars, aes(wt, mpg)) +
#'   geom_point() + easy_remove_y_axis(what = "ticks")
easy_remove_axes <- function(
  which = c("both", "x", "y"),
  what = c("ticks", "title", "text", "line"),
  teach = FALSE
) {
  which <- match.arg(which)
  what <- match.arg(what, several.ok = TRUE)

  fun_name <- paste0(
    "easy_remove_",
    ifelse(which == "both", "_axes", paste0(which, "_axis"))
  )
  axis_suffix <- if (which == "both") "" else paste0(".", which)

  blanks <- lapply(what, function(x) ggplot2::element_blank())
  names(blanks) <- paste0("axis.", what, axis_suffix)

  if (teach) {
    blank_strings <- lapply(what, function(x) " = element_blank()")
    args <- paste0(names(blanks), blank_strings, collapse = ", ")
    message(paste0(fun_name, " call can be substituted with:"))
    message(strwrap(
      paste0("theme(", args, ")"),
      width = 80,
      exdent = 2,
      prefix = "\n",
      initial = ""
    ))
  }

  do.call(ggplot2::theme, blanks)
}

#' @export
#' @rdname easy_remove_axes
easy_remove_y_axis <- function(
  what = c("ticks", "title", "text", "line"),
  teach = FALSE
) {
  easy_remove_axes("y", what = what, teach = teach)
}

#' @export
#' @rdname easy_remove_axes
easy_remove_x_axis <- function(
  what = c("ticks", "title", "text", "line"),
  teach = FALSE
) {
  easy_remove_axes("x", what = what, teach = teach)
}
