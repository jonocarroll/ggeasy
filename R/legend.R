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
    inputs <- lapply(vars, function(x) "none")
    names(inputs) <- vars

    if (teach) {
      message("easy_remove_legend call can be substituted with:")
      none_strings <- lapply(vars, function(x) ' = "none"')
      args <- paste0(vars, none_strings, collapse = ", ")
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

#' Easily modify legends
#'
#' Change legend position, direction, or justification.
#'
#' Due to limitations of `ggplot2` this will apply to all legends at once
#'
#' @md
#' @param what legend component to modify
#' (`"position"`, `"direction"`, or `"justification"`)
#' @param to to what to set the legend component should be changed
#' @param teach print longer equivalent \code{\link[ggplot2]{ggplot2}}
#' expression?
#'
#' @return a \code{\link[ggplot2]{theme}} object
#' @export
#' @author Jonathan Carroll
#'
#' @examples
#'
#' library(ggplot2)
#'
#' # Move legends to bottom
#' ggplot(mtcars, aes(wt, mpg, colour = cyl, size = hp)) +
#'   geom_point() + easy_move_legend("bottom")
#'
#' # Make legends horizontal
#' ggplot(mtcars, aes(wt, mpg, colour = cyl, size = hp)) +
#'   geom_point() + easy_rotate_legend("horizontal")
#'
#' # Justify legends to the bottom and justify to the right
#' ggplot(mtcars, aes(wt, mpg, colour = cyl, size = hp)) +
#'   geom_point() +
#'   easy_move_legend("bottom") +
#'   easy_adjust_legend("right")
easy_change_legend <- function(
  what = c("position", "direction", "justification"),
  to,
  teach = FALSE
) {
  what <- match.arg(what, several.ok = FALSE)

  theme_args <- setNames(to, paste0("legend.", what))

  ## attempt to determine which function was actually called
  callingFun <- tryCatch(as.list(sys.call(-1))[[1]], error = function(e) e)
  easy_fun <- if (inherits(callingFun, "simpleError")) {
    ## the call came from inside the house!
    paste0("easy_change_legend(", what, ' = "', to, '")') #nocov
  } else {
    ## called from a helper
    paste0(callingFun, '("', to, '")')
  }

  if (teach) {
    message(paste0(easy_fun, " call can be substituted with:"))
    message(strwrap(
      paste0('theme(', names(theme_args), ' = "', theme_args, '")'),
      width = 80,
      exdent = 2,
      prefix = "\n",
      initial = ""
    ))
  }

  do.call(ggplot2::theme, as.list(theme_args))
}

#' @export
#' @rdname easy_change_legend
easy_move_legend <- function(
  to = c("right", "none", "left", "bottom", "top"),
  teach = FALSE
) {
  to <- match.arg(to, several.ok = FALSE)
  easy_change_legend(what = "position", to = to, teach = teach)
}

#' @export
#' @rdname easy_change_legend
easy_legend_at <- easy_move_legend

#' @export
#' @rdname easy_change_legend
easy_rotate_legend <- function(
  to = c("vertical", "horizontal"),
  teach = FALSE
) {
  to <- match.arg(to, several.ok = FALSE)
  easy_change_legend(what = "direction", to = to, teach = teach)
}

#' @export
#' @rdname easy_change_legend
easy_adjust_legend <- function(
  to = c("left", "right", "center"),
  teach = FALSE
) {
  to <- match.arg(to, several.ok = FALSE)
  easy_change_legend(what = "justification", to = to, teach = teach)
}

#' Easily add legend title(s)
#'
#' Update the title(s) of the specified aesthetic, or all aesthetics at once.
#'
#' @md
#' @param ... A list of new name-value pairs. The name should be an aesthetic.
#'   If only a character value is provided then *all* legend titles will be
#'   changed to that.
#' @param teach print longer equivalent \code{\link[ggplot2]{ggplot2}}
#' expression?
#'
#' @return a \code{\link[ggplot2]{theme}} object
#' @export
#' @author Jonathan Carroll
#'
#' @examples
#'
#' library(ggplot2)
#'
#' # Add legend title to a specific aesthetic
#' ggplot(mtcars, aes(wt, mpg, colour = cyl, size = hp)) +
#'   geom_point() + easy_add_legend_title(col = "Number of Cylinders")
#'
#' # Add legend title to all aesthetics
#' ggplot(mtcars, aes(wt, mpg, colour = cyl)) +
#'   geom_point() + easy_add_legend_title("Number of Cylinders")
easy_add_legend_title <- function(..., teach = FALSE) {
  dots <- rlang::dots_list(...)

  length(dots) > 0L || stop("No title provided.", call. = FALSE)

  if (length(dots) == 1L && names(dots) == "") {
    orig_dots <- dots
    dots <- setNames(rep(dots, length(.all_legend_aes)), .all_legend_aes)
    if (teach) {
      message(
        'easy_add_legend_title("',
        orig_dots,
        '") call can be substituted with:'
      )
      message('labs(YOUR_AES = "', orig_dots, '")')
    }
    return(suppressWarnings(do.call(ggplot2::labs, dots)))
  }

  if (teach) {
    easy_fun_args <- paste0(names(dots), ' = "', dots, '"', collapse = ", ")
    easy_fun <- paste0('easy_add_legend_title(', easy_fun_args, ')')
    message(paste0(easy_fun, " call can be substituted with:"))
    message(strwrap(
      paste0('labs(', easy_fun_args, ')'),
      width = 80,
      exdent = 2,
      prefix = "\n",
      initial = ""
    ))
  }

  do.call(ggplot2::labs, dots)
}

.all_legend_aes <- unique(
  ggplot2:::standardise_aes_names(
    c(
      "alpha",
      "cex",
      "col",
      "color",
      "colour",
      "fill",
      "linetype",
      "lty",
      "lwd",
      "pch",
      "radius",
      "shape",
      "size",
      "weight",
      "width"
    )
  )
)


#' Easily remove legend title
#' Remove the legend title
#' @md
#' @param teach print longer equivalent \code{\link[ggplot2]{ggplot2}}
#' expression?
#' @return a \code{\link[ggplot2]{theme}} object
#' @export
#' @examples
#' library(ggplot2)
#' # remove legend title from all aesthetics
#' ggplot(mtcars, aes(wt, mpg, colour = cyl)) +
#'   geom_point() + easy_remove_legend_title()
easy_remove_legend_title <- function(teach = FALSE) {
  if (teach) {
    message("easy_remove_legend_title call can be substituted with:")
    message(strwrap(
      'theme(legend.title = element_blank())',
      width = 80,
      exdent = 2,
      prefix = "\n",
      initial = ""
    ))
  }

  theme(legend.title = element_blank())
}
