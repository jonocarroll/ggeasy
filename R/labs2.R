#' @title Easily add ggplot labels using label attribute of `data.frame` column
#' @description Applies same logic as \code{\link[ggplot2]{labs}} but uses as default
#' the column label attribute if present as the variable label in the plot.
#' @param ... A list of new name-value pairs. The name should either be an aesthetic,
#' or one of "title", "subtitle", or "caption"
#' @param teach print longer equivalent \code{\link[ggplot2]{ggplot2}}
#' expression?
#' @return NULL
#' @examples
#'
#' iris_labs <- iris
#'
#' lbl <- c('Sepal Length', 'Sepal Width', 'Petal Length', 'Petal Width', 'Flower Species')
#'
#' labelled::var_label(iris_labs) <- split(lbl,names(iris_labs))
#'
#' p <- ggplot2::ggplot(iris_labs,ggplot2::aes(x=Sepal.Length,y=Sepal.Width))+
#'   ggplot2::geom_line(ggplot2::aes(colour=Species))
#'
#' p
#'
#' p + easy_labs()
#' p + easy_labs(title = "Plot Title", subtitle = 'Plot Subtitle', x = 'x axis label')
#'
#' p + easy_labs(teach = TRUE)
#'
#' @rdname easy_labs
#' @export
easy_labs <- function(..., teach = FALSE){
    man_labs <- ggplot2::labs(list(...))
    structure(man_labs, teach = teach, class = "easy_labs")
}

#' @export
ggplot_add.easy_labs <- function (p, object, objectname) {
    easy_update_labs(object, p)
}

#' @importFrom utils modifyList
easy_update_labs <- function(p, man_labs) {
    p_labs <- p$labels
    d <- p$data
    d_labs <- lapply(d, function(x) attr(x, "label"))
    has_labs <- sapply(d_labs, function(x) !is.null(x))
    labslist <- d_labs[has_labs]

    labs_to_update <- match(p_labs, names(labslist))
    for (lab in seq_along(labs_to_update)) {
        labval <- labs_to_update[lab]
        if (!is.na(labval)) {
            p_labs[lab] <- labslist[[labval]]
        }
    }
    ## if labs have been manually specified, use those
    if (length(unlist(man_labs)) > 0) {
        p_labs <- utils::modifyList(p_labs, as.list(unlist(man_labs)))
    }
    if (attr(man_labs, "teach")) {
        message("easy_labs call can be substituted with:")
        args <- paste(names(p_labs), "=", sQuote(p_labs), collapse = ", ")
        message(strwrap(
            paste0("labs(", args, ")"),
            width = 80,
            exdent = 2,
            prefix = "\n",
            initial = ""
        ))
    }

    ggplot2::update_labels(p, p_labs)

}
