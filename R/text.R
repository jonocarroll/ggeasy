#' Easily change text appearance
#'
#' Change any of the text parameters such as
#'
#' @md
#' @param which which element to change (see `ggeasy::.all_theme_els`)
#' @param what what attribute of the element to change (see `ggeasy::.all_element_text`)
#' @param size size to set attributes to
#' @param color colo(u)r to set attributes to
#' @param colour colo(u)r to set attributes to
#' @param to value to which the attribute should be set
#' @param teach print longer equivalent \code{\link[ggplot2]{ggplot2}}
#' expression?
#'
#' @return  a \code{\link[ggplot2]{theme}} object which can be used in
#' \code{\link[ggplot2]{ggplot2}} calls
#' @importFrom stats setNames
#' @export
#' @author Jonathan Carroll
#'
#' @examples
#'
#' library(ggplot2)
#'
#' # make all text larger
#' ggplot(mtcars, aes(mpg, hp)) +
#'   geom_point() +
#'   easy_all_text_size(22)
#' # also works if accidentally using easy_text_size(n)
#'
#' # make the x and y axis text larger
#' ggplot(mtcars, aes(mpg, hp)) +
#'   geom_point() +
#'   easy_text_size(c("axis.text.x", "axis.text.y"), 22)
#'
#' # make the x axis labels larger
#' ggplot(mtcars, aes(mpg, hp)) +
#'   geom_point() +
#'   easy_x_axis_labels_size(22)
#'
#' # make the plot title larger
#' ggplot(mtcars, aes(mpg, hp)) +
#'   geom_point() +
#'   labs(title = "My Plot") +
#'   easy_plot_title_size(22)
#'
#' # make the legend title larger
#' ggplot(mtcars, aes(mpg, hp)) +
#'   geom_point(aes(fill = gear)) +
#'   easy_plot_legend_title_size(22)
#'
#' # make all the text red
#' ggplot(mtcars, aes(mpg, hp)) +
#'   geom_point(aes(fill = gear)) +
#'   easy_all_text_color("red")
#'
#' # make all the text 45 degrees, right-justified
#' ggplot(mtcars, aes(mpg, hp)) +
#'   geom_point(aes(fill = gear)) +
#'   easy_change_text(what = "angle", to = 45) +
#'   easy_change_text(what = "hjust", to = 1)
#'
#' # make just x-axis text 45 degrees, right-justified
#' ggplot(mtcars, aes(mpg, hp)) +
#'   geom_point(aes(fill = gear)) +
#'   easy_change_text(which = "axis.text.x", what = "angle", to = 45) +
#'   easy_change_text(which = "axis.text.x", what = "hjust", to = 1)
easy_change_text <- function(which = .all_theme_els,
                             what = .all_element_text,
                             to = NULL,
                             teach = FALSE) {
    which <- match.arg(which, several.ok = TRUE)
    if (is.null(which) || identical(which, .all_theme_els)) which <- c("text", "axis.text", "title")
    if (!is.null(what)) what <- match.arg(what, several.ok = FALSE)
    length(to) <= 1L || stop("Only one value can be used at a time", call. = FALSE)

    if (is.null(what)) {
        to_arg <- ggplot2::element_blank()
        arg_str <- lapply(which, function(x) paste0(x, " = ggplot2::element_blank()"))
        arg_val <- lapply(seq_along(which), function(x) to_arg)
    } else {
        to_arg <- to
        to_arg_q <- to_arg
        if (is.character(to_arg)) {
            to_arg_q <- sQuote(to_arg)
        }
        arg_str <- lapply(which, function(x) paste0(x, ' = ggplot2::element_text(', paste0(what, ' = ', to_arg_q, collapse = ", "), ')'))
        arg_val <- lapply(seq_along(which), function(x) do.call(element_text, stats::setNames(list(to_arg), what)))
    }
    arg_val <- stats::setNames(arg_val, which)

    if (teach) {
        message(paste0("easy_change_text call can be substituted with:"))
        message(paste(paste0("theme(", arg_str, ")"), collapse = " + \n"))
    }

    do.call(ggplot2::theme, arg_val)
}

#' @export
#' @rdname easy_change_text
.all_theme_els <- c("text",                                          #nocov
                    "axis.text", "axis.text.x", "axis.text.y",       #nocov
                    "axis.title", "axis.title.x", "axis.title.y",    #nocov
                    "legend.text", "legend.title",                   #nocov
                    "plot.title", "plot.subtitle", "plot.caption",   #nocov
                    "strip.text", "strip.text.x", "strip.text.y")    #nocov

#' @export
#' @rdname easy_change_text
.all_element_text <- c("size", "family", "face", "colour", "hjust", "vjust", "angle", #nocov
                       "lineheight", "color", "margin")                               #nocov


#' @export
#' @rdname easy_change_text
easy_all_text_size <- function(size = NULL, teach = FALSE) {
    easy_change_text(what = "size", to = size, teach = teach)
}

#' @export
#' @rdname easy_change_text
easy_all_text_color <- function(color = NULL, teach = FALSE) {
    easy_change_text(what = "colour", to = color, teach = teach)
}

#' @export
#' @rdname easy_change_text
easy_all_text_colour <- function(colour = NULL, teach = FALSE) {
    easy_change_text(what = "colour", to = colour, teach = teach)
}

#' @export
#' @rdname easy_change_text
easy_text_size <- function(which = .all_theme_els, size = NULL, teach = FALSE) {
    if (is.numeric(which)) return(easy_all_text_size(size = which, teach = teach))
    easy_change_text(which = which, what = "size", to = size, teach = teach)
}

#' @export
#' @rdname easy_change_text
easy_text_color <- function(which = .all_theme_els, color = NULL, teach = FALSE) {
    if (!all(which %in% .all_theme_els)) return(easy_all_text_color(color = which, teach = teach))
    easy_change_text(which = which, what = "colour", to = color, teach = teach)
}

#' @export
#' @rdname easy_change_text
easy_text_colour <- function(which = .all_theme_els, colour = NULL, teach = FALSE) {
    if (!all(which %in% .all_theme_els)) return(easy_all_text_colour(colour = which, teach = teach))
    easy_change_text(which = which, what = "colour", to = colour, teach = teach)
}

#' @export
#' @rdname easy_change_text
easy_x_axis_title_size <- function(size, teach = FALSE) {
    easy_change_text(which = "axis.title.x", what = "size", to = size, teach = teach)
}

#' @export
#' @rdname easy_change_text
easy_y_axis_title_size <- function(size, teach = FALSE) {
    easy_change_text(which = "axis.title.y", what = "size", to = size, teach = teach)
}

#' @export
#' @rdname easy_change_text
easy_x_axis_labels_size <- function(size = NULL, teach = FALSE) {
    if (is.null(size)) return(easy_change_text(which = "axis.text.x", what = NULL, teach = teach))
    easy_change_text(which = "axis.text.x", what = "size", to = size, teach = teach)
}

#' @export
#' @rdname easy_change_text
easy_y_axis_labels_size <- function(size = NULL, teach = FALSE) {
    if (is.null(size)) return(easy_change_text(which = "axis.text.y", what = NULL, teach = teach))
    easy_change_text(which = "axis.text.y", what = "size", to = size, teach = teach)
}

#' @export
#' @rdname easy_change_text
easy_plot_title_size <- function(size = NULL, teach = FALSE) {
    if (is.null(size)) return(easy_change_text(which = "plot.title", what = NULL, teach = teach))
    easy_change_text(which = "plot.title", what = "size", to = size, teach = teach)
}

#' @export
#' @rdname easy_change_text
easy_plot_subtitle_size <- function(size = NULL, teach = FALSE) {
    if (is.null(size)) return(easy_change_text(which = "plot.subtitle", what = NULL, teach = teach))
    easy_change_text(which = "plot.subtitle", what = "size", to = size, teach = teach)
}

#' @export
#' @rdname easy_change_text
easy_plot_caption_size <- function(size = NULL, teach = FALSE) {
    if (is.null(size)) return(easy_change_text(which = "plot.caption", what = NULL, teach = teach))
    easy_change_text(which = "plot.caption", what = "size", to = size, teach = teach)
}

#' @export
#' @rdname easy_change_text
easy_plot_legend_size <- function(size = NULL, teach = FALSE) {
    if (is.null(size)) return(easy_change_text(which = "legend.text", what = NULL, teach = teach))
    easy_change_text(which = "legend.text", what = "size", to = size, teach = teach)
}

#' @export
#' @rdname easy_change_text
easy_plot_legend_title_size <- function(size = NULL, teach = FALSE) {
    if (is.null(size)) return(easy_change_text(which = "legend.title", what = NULL, teach = teach))
    easy_change_text(which = "legend.title", what = "size", to = size, teach = teach)
}
