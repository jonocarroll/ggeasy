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
#'   geom_point() + easy_remove_y_axis(what = "ticks")
easy_remove_axes <- function(which = c("both","x","y"),
                             what = c("ticks","title","text","line"), 
                             teach = FALSE){
  
  which <- match.arg(which)
  what <- match.arg(what, several.ok = TRUE)
  
  axis_suffix <- if (which == "both") "" else paste0(".", which)
  
  blanks <- lapply(what, function(x) ggplot2::element_blank())
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
