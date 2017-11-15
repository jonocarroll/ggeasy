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

#' Easily remove axe(s)
#'
#' easy_remove_axes by default removes both axes, but can remove only x or y
#' if "x" or "y" is given to the 'which' argument
#'
#' easy_remove_x_axis and easy_remove_y_axis remove just the x or y axis,
#' respectively.
#'
#' @md
#' @param which which axis or axes to remove, by default "both"
#' @param what what axis components to remove
#' @param teach print longer equivalent ggplot expression?
#'
#' @return  a \code{\link[ggplot2]{theme}} object  which can be used in
#' \code{\link[ggplot2]{ggplot2}} calls
#' @export
#' @author Alicia Schep
#' @import rlang
#' @import ggplot2
#'
#' @examples
#'
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
#'   geom_point() + easy_remove_y_axis(what = "ticks)
easy_remove_axes <- function(which = c("both","x","y"),
                             what = c("ticks","title","text","line"),
                             teach = FALSE){

  which <- match.arg(which)
  what <- match.arg(what, several.ok = TRUE)

  axis_suffix <- if (which == "both") "" else paste0(".", which)

  blanks <- lapply(what, function(x) element_blank())
  names(blanks) <- paste0("axis.", what, axis_suffix)

  if (teach) {
    blank_strings <- lapply(what, function(x) " = element_blank()")
    args <- paste0(names(blanks), blank_strings, collapse = ", ")
    message("easy_remove_axes call can be substituted with:\n")
    message(strwrap(paste0("theme(",args,")"),
                    width = 80,
                    exdent = 2,
                    prefix = "\n",
                    initial = ""))
  }

  do.call(theme, blanks)

}

#' @export
#' @rdname easy_remove_axes
easy_remove_y_axis <- function(what = c("ticks","title","text","line"),
                               teach = FALSE){

  easy_remove_axes("y", what = what, teach = teach)

}

#' @export
#' @rdname easy_remove_axes
easy_remove_x_axis <- function(what = c("ticks","title","text","line"),
                               teach = FALSE) {

  easy_remove_axes("x", what = what, teach = teach)

}


#' Easily specify exact limits
#'
#' @md
#' @param which "x" or "y"; which limits are to be adjusted?
#' @param limits a two-element numeric-like vector specifying the lower and upper bounds of the axis extent
#' @param expand a four-element numeric-like vector specifying the multiplicative and additive expansion parameters. See Details.
#' @param teach print longer equivalent ggplot expression?
#'
#' @details Multiplicative and additive expansion constants are defined by the four elements `c(m_lower, a_lower, m_uppper, a_upper)`.
#'
#' @return  a \code{\link[ggplot2]{theme}} object  which can be used in
#' \code{\link[ggplot2]{ggplot2}} calls
#' @export
#' @author Jonathan Carroll
#'
#' @import ggplot2
#' @examples
#'
#'ggplot(mtcars) +
#'   geom_bar(aes(x = factor(cyl))) +
#'   easy_exact_limits("y")
#'
#' ggplot(mtcars) +
#'   geom_bar(aes(x = factor(cyl))) +
#'   easy_exact_limits("y", limits = c(-10, NA))
#'
#' ggplot(mtcars) +
#'   geom_bar(aes(x = factor(cyl))) +
#'   easy_exact_ylim()
#'
#' ## still have control; set the limits to the extent with no expansion
#' ggplot(mtcars) +
#'     geom_point(aes(x = mpg, y = hp)) +
#'     easy_exact_xlim(expand = c(0, 0, 0, 0), limits = c(min(mtcars$mpg), max(mtcars$mpg))) +
#'     easy_exact_ylim(expand = c(0, 0, 0, 0), limits = c(min(mtcars$hp), max(mtcars$hp)))
#'
#' ## teach how to do this
#' ggplot(mtcars) +
#'   geom_bar(aes(x = factor(cyl))) +
#'   easy_exact_ylim(teach = TRUE)
easy_exact_limits <- function(which = c("x", "y"),
                              limits = NULL,
                              expand = c(0, 0, 0.1, 0),
                              teach = FALSE) {

    if (!is.null(limits)) {
        stopifnot(is.numeric(limits) || is.integer(limits))
        stopifnot(length(limits) == 2)
    }

    if (!isTRUE(all.equal(expand, c(0, 0, 0.1, 0)))) {
        stopifnot(is.numeric(expand) || is.integer(expand))
        stopifnot(length(expand) == 4)
    }

    which <- match.arg(which)

    ## remove NULL arguments and create a named list of the other(s)
    args <- Filter(Negate(is.null), mget(c("limits", "expand")))

    if (teach) {
        val_string <- lapply(args, function(x) paste0(" = (", paste(x, collapse = ", "), ")"))
        arg_string <- paste0(names(args), val_string, collapse = ", ")
        call_string <- paste0("scale_", which, "_continuous(", arg_string, ")")
        message("easy_exact_limits call can be substituted with:")
        message(call_string)
    }

    ## scale must be continuous; discrete scales shouldn't be altered
    if (which == "x") {
        do.call(scale_x_continuous, args)
    } else if (which == "y") {
        do.call(scale_y_continuous, args)
    }

}

#' @export
#' @rdname easy_exact_limits
easy_exact_xlim <- function(..., teach = FALSE) easy_exact_limits("x", ..., teach = teach)

#' @export
#' @rdname easy_exact_limits
easy_exact_ylim <- function(..., teach = FALSE) easy_exact_limits("y", ..., teach = teach)

