#' Easily remove legend(s)
#'
#' With no argument, will remove all legends. Provide the name(s) of
#' specific aesthetic to remove only certain legends.
#'
#'
#' @md
#' @param ... optional name(s) specific aesthetics for which to remove the 
#' legend
#' @param teach print longer equivalent \code{\link[ggplot2]{ggplot2}} 
#' expression?
#'
#' @return either a \code{\link[ggplot2]{theme}} object or a
#' \code{\link[ggplot2]{guides}}object, both of which can be used in
#' \code{\link[ggplot2]{ggplot2}} calls
#' @export
#' @author Alicia Schep
#' 
#' @examples
#'
#' library(ggplot2)
#' 
#' # Remove all legends
#' ggplot(mtcars, aes(wt, mpg, colour = cyl, size = hp)) +
#'   geom_point() + easy_remove_legend()
#'
#' # remove just size legend
#' ggplot(mtcars, aes(wt, mpg, colour = cyl, size = hp)) +
#'   geom_point() + easy_remove_legend("size")
#'
#' # can also use:
#' ggplot(mtcars, aes(wt, mpg, colour = cyl, size = hp)) +
#'   geom_point() + easy_remove_legend(size)
#'
#' # Remove more than one
#' ggplot(mtcars, aes(wt, mpg, colour = cyl, size = hp)) +
#'   geom_point() + easy_remove_legend(size, color)
easy_remove_legend <- function(..., teach = FALSE) {
  vars <- rlang::exprs(...)
  if (length(vars) == 0) {
    if (teach) {
      message("easy_remove_legend call can be substituted with:")
      message('theme(legend.position = "none")')
    }
    theme(legend.position = "none")
  } else {
    inputs <- lapply(vars, function(x) FALSE)
    names(inputs) <- vars
    
    if (teach){
      message("easy_remove_legend call can be substituted with:")
      false_strings <- lapply(vars, function(x) " = FALSE")
      args <- paste0(vars, false_strings, collapse = ", ")
      message(strwrap(
        paste0("guides(", args, ")"),
        width = 80,
        exdent = 2,
        prefix = "\n",
        initial = ""
      ))
    }
    
    do.call(guides, inputs)
  }
}