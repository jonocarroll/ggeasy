#' Helper bot to change plot aesthetics
#'
#' @md
#' @param ... character vector containing lexical tokens (a command or a vector or words)
#'
#' @details Commands currently supported:
#' - change colour of points
#' - remove axis, legend, everything
#'
#' @return a \code{\link[ggplot2]{theme}} object which can be used in
#'   \code{\link[ggplot2]{ggplot2}} calls.
#' @export
#'
#' @examples
#' library(ggplot2)
#' ggplot(mtcars, aes(cyl, hp, col = "red")) +
#'   geom_point() +
#'   ggbot("blue points")
ggbot <- function(...) {

    tokens <- unlist(strsplit(unlist(rlang::exprs(...)), " "))

    all_colours <- colours()
    all_aes <- ggplot2:::.all_aesthetics
    all_funs <- c("theme", "axis", "legend", "points")
    all_remove_cmds <- c("no", "remove", "drop", "clear")

    detect_cols <- na.omit(all_colours[pmatch(tokens, all_colours)])
    detect_aes <- na.omit(all_aes[pmatch(tokens, all_aes)])
    detect_funs <- na.omit(all_funs[pmatch(tokens, all_funs)])
    detect_remove_cmds <- na.omit(all_remove_cmds[pmatch(tokens, all_remove_cmds)])

    ## change colours
    if (length(detect_cols) > 0 && "points" %in% detect_funs) {
        return(ggplot2::scale_colour_manual(values = detect_cols, labels = detect_cols))
    }

    ## remove components
    if (length(detect_remove_cmds) > 0 && length(detect_funs) > 0) {

        ## remove theme
        if (detect_funs[1] == "theme") theme_void()

        ## remove axes
        if (detect_funs[1] == "axis" && detect_aes[1] == "x") {
            return(theme(axis.title.x = element_blank(),
                  axis.text.x = element_blank(),
                  axis.ticks.x = element_blank()))
        }
        if (detect_funs[1] == "axis" && detect_aes[1] == "y") {
            return(theme(axis.title.y = element_blank(),
                  axis.text.y = element_blank(),
                  axis.ticks.y = element_blank()))
        }
        if (detect_funs[1] == "axis") {
            return(theme(axis.title = element_blank(),
                  axis.text = element_blank(),
                  axis.ticks = element_blank()))
        }

        ## remove legend(s)
        if (detect_funs[1] == "legend") {
            if (length(detect_aes) > 0) return(easy_remove_legend(detect_aes))
            return(easy_remove_legend())
        }
    }

}

