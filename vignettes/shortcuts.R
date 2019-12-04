## ---- warning = FALSE, message = FALSE-----------------------------------
library(ggplot2)
library(patchwork)
library(labelled)
library(ggeasy)

## ------------------------------------------------------------------------
p <- ggplot(mtcars, aes(hp, mpg)) + geom_point()

## ---- fig.width = 5, fig.height = 5--------------------------------------
p + labs(title = "ggplot2 default")

## ---- fig.width = 8, fig.height = 8--------------------------------------
p1 <- p + 
    easy_rotate_x_labels() + 
    labs(title = "default rotation")
p2 <- p + 
    easy_rotate_x_labels(angle = 45, side = "right") + 
    labs(title = "angle = 45")
p3 <- p + 
    easy_rotate_x_labels("startattop") + 
    labs(title = "text starts at top")
p4 <- p + 
    easy_rotate_x_labels("startatbottom") + 
    labs(title = "text starts at bottom")

(p1 + p2) / (p3 + p4)

## ---- fig.width = 8, fig.height = 8--------------------------------------
p <- ggplot(mtcars, aes(wt, mpg, colour = cyl, size = hp)) +
    geom_point()

p1 <- p + 
    labs(title = "With all legends")
p2 <- p + 
    easy_remove_legend() + 
    labs(title = "Remove all legends")
p3 <- p + 
    easy_remove_legend(size) + 
    labs(title = "Remove size legend")
p4 <- p + 
    easy_remove_legend(size, color) + 
    labs(title = "Remove both legends specifically")

(p1 + p2) / (p3 + p4)

## ------------------------------------------------------------------------
## create a copy of the iris data
iris_labs <- iris

## add labels to the columns
lbl <- c('Sepal Length', 'Sepal Width', 'Petal Length', 'Petal Width', 'Flower\nSpecies')
var_label(iris_labs) <- split(lbl, names(iris_labs))

## ---- fig.width = 8, fig.height = 8--------------------------------------
p <- ggplot(iris_labs, aes(x = Sepal.Length, y = Sepal.Width)) +
    geom_line(aes(colour = Species))

p1 <- p + labs(title = "default labels")
p2 <- p + 
    easy_labs() + 
    labs(title = "Replace titles with column labels")
p3 <- p + 
    easy_labs(x = 'My x axis') + 
    labs(title = "Manually add x axis label")
    
iris_labs_2 <- iris_labs
var_label(iris_labs_2$Species) <- "Sub-genera"

p4 <- p + geom_point(data = iris_labs_2, aes(fill = Species), shape = 24) +
    easy_labs() + 
    labs(title = "Additional labels can be added in other aesthetics")

(p1 + p2) / (p3 + p4)


## ---- fig.width = 8, fig.height = 8--------------------------------------
p4 + geom_point(data = iris_labs_2, aes(fill = Species), shape = 24) +
    facet_wrap(~Species) + 
    easy_labs() + 
    labs(title = "Facetting works")

