#' @export
"+.gg" <- function(e1, e2) {

  e2name <- deparse(substitute(e2))

  if (inherits(e1, "ggplot")) {
  e3 <- easy_add_ggplot(e1, e2, e2name)
  }

  if (inherits(e1, "theme")) {
    e3 <- add_theme(e1, e2, e2name)
  }

  e3
  
}

#' @importFrom plyr defaults
easy_add_ggplot <- 
function (p, object, objectname) 
{

  if (is.null(object)) 
    return(p)
  p <- plot_clone(p)
  if (is.data.frame(object)) {
    p$data <- object
  }
  else if (is.theme(object)) {
    p$theme <- update_theme(p$theme, object)
  }
  else if (inherits(object, "Scale")) {
    p$scales$add(object)
  }
  else if (inherits(object, "labels")) {
    p <- update_labels(p, object)
  }
  else if (inherits(object, "easy_labels")) {
    p <- easy_update_labels(p, object)
  }
  else if (inherits(object, "guides")) {
    p <- update_guides(p, object)
  }
  else if (inherits(object, "uneval")) {
    p$mapping <- defaults(object, p$mapping)
    class(p$mapping) <- class(object)
    labels <- lapply(object, deparse)
    names(labels) <- names(object)
    p <- update_labels(p, labels)
  }
  else if (is.Coord(object)) {
    p$coordinates <- object
    p
  }
  else if (is.facet(object)) {
    p$facet <- object
    p
  }
  else if (is.list(object)) {
    for (o in object) {
      p <- p %+% o
    }
  }
  else if (inherits(object, "Layer")) {
    p$layers <- append(p$layers, object)
    mapping <- make_labels(object$mapping)
    default <- make_labels(object$stat$default_aes)
    new_labels <- defaults(mapping, default)
    p$labels <- defaults(p$labels, new_labels)
  }
  else {
    stop("Don't know how to add ", objectname, " to a plot", 
         call. = FALSE)
  }
  ggplot2:::set_last_plot(p)
  p
}

add_theme <- function (t1, t2, t2name) 
{
  if (!inherits(t2, "theme")) {
    stop("Don't know how to add RHS to a theme object", call. = FALSE)
  }
  for (item in names(t2)) {
    x <- t1[[item]]
    y <- t2[[item]]
    if (is.null(x) || inherits(x, "element_blank")) {
      x <- y
    }
    else if (is.null(y) || is.character(y) || is.numeric(y) || 
             is.logical(y) || inherits(y, "element_blank")) {
      x <- y
    }
    else {
      idx <- !vapply(y, is.null, logical(1))
      idx <- names(idx[idx])
      x[idx] <- y[idx]
    }
    t1[item] <- list(x)
  }
  attr(t1, "complete") <- attr(t1, "complete") || attr(t2,"complete")
  t1
}

plot_clone <- function (plot) 
{
  p <- plot
  p$scales <- plot$scales$clone()
  p
}

easy_last_plot <- function (value){
  .store$set(value)
}
  
environment(easy_last_plot)=asNamespace('ggplot2')

make_labels <- function (mapping) 
{
  remove_dots <- function(x) {
    gsub("^\\.\\.([a-zA-Z._]+)\\.\\.$", "\\1", x)
  }
  default_label <- function(aesthetic, mapping) {
    if (is.character(mapping)) {
      aesthetic
    }
    else {
      remove_dots(deparse(mapping))
    }
  }
  Map(default_label, names(mapping), mapping)
}