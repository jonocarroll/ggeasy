#' @title Easily add ggplot labels using label attribute of `data.frame` column
#' @description Applies same logic as \code{\link[ggplot2]{labs}} but uses as default
#' the column label attribute if present as the variable label in the plot.
#' @param ... A list of new name-value pairs. The name should either be an aesthetic,
#' or one of "title", "subtitle", or "caption"
#' @param teach print longer equivalent \code{\link[ggplot2]{ggplot2}}
#' expression?
#' @return NULL
#'
#' @rdname easy_labs
#' @export
easy_labs <- function(..., teach = FALSE) {
  .Deprecated("This functionality is now handled natively in ggplot2")
  man_labs <- ggplot2::labs(list(...))
  structure(man_labs, teach = teach, class = "easy_labs")
}

#' @keywords internal
#' @noRd
get_labs <- if ("get_labs" %in% getNamespaceExports("ggplot2")) {
  ggplot2::get_labs
} else {
  function(plot) plot$labels
}
