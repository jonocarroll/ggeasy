#' Easily rotate `x` axis labels
#'
#' A shortcut to
#'
#' theme(axis.text.x = element_text(angle, hjust))
#'
#'
#' @md
#' @param which which axis or axes to rotate, by default "both"
#' @param angle angle through which the text should be rotated. Can also be one
#'   of "startattop" or "startatbottom" to define where the text should start.
#' @param side horizontal justification of the text before rotation
#' @param teach print longer equivalent \code{\link[ggplot2]{ggplot2}}
#' expression?
#'
#' @return a \code{\link[ggplot2]{theme}} object which can be used in
#'   \code{\link[ggplot2]{ggplot2}} calls.
#' @export
#'
#' @examples
#' library(ggplot2)
#' ggplot(mtcars, aes(mpg, hp)) +
#'   geom_point() +
#'   easy_rotate_labels()
easy_rotate_labels <- function(which = c("both", "x", "y"),
                               angle = 90,
                               side = c("left", "middle", "right"),
                               teach = FALSE) {
  axis <- match.arg(which)
  hjust <- switch(
    match.arg(side),
    left = 0,
    middle = 0.5,
    right = 1
  )
  angle <- if (is.numeric(angle) || is.integer(angle)) {
    angle
  } else if (is.character(angle)) {
    switch(angle,
           startattop = -90,
           startatbottom = 90,
           stop("angle not recognised. Accepts: startattop, startatbottom", call. = FALSE)
    )
  }

  axis_suffix <- if (axis == "both") "" else paste0(".", which)

  rotations <- lapply(axis, function(x) ggplot2::element_text(angle = angle, hjust = hjust))
  names(rotations) <- paste0("axis.text", axis_suffix)

  if (teach) {
    rotation_strings <- paste0(names(rotations),
                               " = element_text(angle = ", angle,
                               ", hjust = ", hjust)
    message("easy_rotate_x_labels call can be substituted with:")
    message(strwrap(
      paste0("theme(", paste(rotation_strings), ")"),
      width = 80,
      exdent = 2,
      prefix = "\n",
      initial = ""
    ))
  }

  do.call(theme, rotations)
}

#' @export
#' @rdname easy_rotate_labels
easy_rotate_x_labels <- function(angle = 90,
                                 side = c("left", "middle", "right"),
                                 teach = FALSE) {
  easy_rotate_labels(which = "x", angle = angle, side = side, teach = teach)
}

#' @export
#' @rdname easy_rotate_labels
easy_rotate_y_labels <- function(angle = 90,
                                 side = c("left", "middle", "right"),
                                 teach = FALSE) {
  easy_rotate_labels(which = "y", angle = angle, side = side, teach = teach)
}

#' @title Easily add ggplot labels using label attribtute of `data.frame` column
#' @description Applies same logic as \code{\link[ggplot2]{labs}} but uses as default
#' the column label attribute if present as the variable label in the plot.
#' @param ... A list of new name-value pairs. The name should either be an aesthetic,
#' or one of "title", "subtitle", or "caption"
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
#' p + easy_labs(subtitle='mysubtitle', x='x axis label')
#'
#' # working with value labels
#'
#' iris_labs$Species <- as.character(iris_labs$Species)
#'
#' labelled::val_labels(iris_labs$Species) <-
#'   setNames(c('setosa','versicolor','virginica'),c('a','b','c'))
#'
#' p1 <- ggplot2::ggplot(iris_labs,ggplot2::aes(x=Sepal.Length,y=Sepal.Width))+
#'   ggplot2::geom_line(ggplot2::aes(colour=Species))
#'
#' # ggplot2 doesnt build with columns that
#' # inherit the attribute 'labels'
#'
#' attributes(iris_labs$Species)
#'
#' \dontrun{
#'
#' # This will cause an error
#'
#' p1
#' }
#'
#' # easy_labs does let you build ggplots with columns
#' # that inherit the attribute 'labels'
#' p1 + easy_labs()
#'
#' @rdname easy_labs
#' @export
#' @author Jonathan Sidi
easy_labs <- function(...){

  man_labs <- labs(list(...))

  structure(man_labs, class = "easy_labs")

}

strip_labelled <- function(data){

  data <- lapply(data,function(x){

    attribs <- attributes(x)

    lab_x <- attribs[['labels']]
    lab_col_x <- attribs[['label']]

    if(!is.null(lab_x)){
      x <- factor(as.character(x),levels=lab_x,labels=names(lab_x))
    }

    if(!is.null(lab_col_x)){
      attr(x,'label') <- lab_col_x
    }

    x
  })

  as.data.frame(data)
}

easy_update_labels <- function(p,man_labs){

  p$data <- strip_labelled(p$data)

  p$layers <- lapply(p$layers,function(x){
    if(length(x$data)>0)
      x$data <- strip_labelled(x$data)
    x
  })

  root_dat_labs <- sapply(p$data,attr,which='label')
  root_dat_labs <- root_dat_labs[!sapply(root_dat_labs,is.null)]
  root_map <- unlist(p$mapping)

  root_labs <- lapply(root_map, function(x){

    new_lab <- root_dat_labs[[strip_quo(x)]]

    if(is.null(new_lab)){
      new_lab <- strip_quo(x)
    }

    new_lab

  })


  layers_map <- lapply(p$layers,function(x){

    l_dat_labs <- sapply(x$data,attr,which='label')
    l_dat_labs <- l_dat_labs[!sapply(l_dat_labs,is.null)]
    l_map <- unlist(x$mapping)

    l_labs <- lapply(l_map, function(y){

      new_lab <- l_dat_labs[[strip_quo(y)]]

      if(is.null(new_lab))
        new_lab <-  root_dat_labs[[strip_quo(y)]]

      if(is.null(new_lab))
        new_lab <- strip_quo(y)

      new_lab

    })

    unlist(l_labs)
  })

  args <- c(root_labs,unlist(layers_map))

  # keep last duplicate aes (ie last layer added)

  args <- args[!duplicated(names(args),fromLast = TRUE)]

  if(length(man_labs)>0)
    for(nm in names(man_labs)){
      args[[nm]] <- man_labs[[nm]]
      p$labels[[nm]] <- man_labs[[nm]]
    }

  plot_names <- unique(c(names(p$data),
                         unlist(lapply(p$layers,function(x) names(x$data)))))

  for(i in names(args)){
    if(p$labels[[i]]%in%plot_names) #making sure only replacing default col names
      p$labels[[i]] <- args[[i]]
  }

  p

}

#' @export
ggplot_add.easy_labs <- function (p, object, objectname) {

    p <- easy_update_labels(object,p)

    p
}

#' @importFrom rlang quo_get_expr
strip_quo <- function(x){
  deparse(rlang::quo_get_expr(x))
}
