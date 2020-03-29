easy_remove_gridlines <- function(minor = TRUE, major = TRUE) {
  args <- list()
  if (minor) {
    args$panel.grid.minor <- element_blank()
  }
  if (major) {
    args$panel.grid.major <- element_blank()
  }
  do.call(theme, args)
}

easy_remove_x_gridlines <- function(minor = TRUE, major = TRUE) {
  args <- list()
  if (minor) {
    args$panel.grid.minor.x <- element_blank()
  }
  if (major) {
    args$panel.grid.major.x <- element_blank()
  }
  do.call(theme, args)
}

easy_remove_y_gridlines <- function(minor = TRUE, major = TRUE) {
  args <- list()
  if (minor) {
    args$panel.grid.minor.y <- element_blank()
  }
  if (major) {
    args$panel.grid.major.y <- element_blank()
  }
  do.call(theme, args)
}
