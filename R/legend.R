#' Easily remove legend(s)
#'
#' With no argument, will remove all legends. Provide the name(s) of 
#' specific aesthetic to remove only certain legends.
#'
#'
#' @md
#' @param ... additional arguments to be passed to
#'   \code{\link[ggplot2]{element_text}}
#'
#' @return either a \code{\link[ggplot2]{theme}} object or a 
#' \code{\link[ggplot2]{guides}}object, both of which can be used in 
#' \code{\link[ggplot2]{ggplot2}} calls 
#' @export
#' @import rlang
#' @import ggplot2
#'
#' @examples
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
easy_remove_legend <- function(...){

  vars <- exprs(...)
  if (length(vars) == 0) {
    theme(legend.position = "none")
  } else {
    inputs <- lapply(vars, function(x) FALSE)
    names(inputs) <- vars
    
    do.call(guides, inputs)
  }
}

