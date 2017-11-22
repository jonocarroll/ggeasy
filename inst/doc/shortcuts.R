## ---- message = FALSE----------------------------------------------------
library(ggplot2)
library(cowplot)
library(labelled)
library(ggeasy)

p <- ggplot(mtcars, aes(hp, mpg)) + geom_point()

## ---- fig.width = 6, fig.height = 6--------------------------------------
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
    
plot_grid(p1, p2, p3, p4, nrow = 2)

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

plot_grid(p1, p2, p3, p4, nrow = 2)

## ---- fig.width = 8, fig.height = 8--------------------------------------
iris_labs <- iris

lbl <- c('Sepal Length','Sepal Width','Petal Length','Petal Width','Flower Species')

var_label(iris_labs) <- split(lbl,names(iris_labs))

p <- 
     ggplot(iris_labs,aes(x=Sepal.Length,y=Sepal.Width))+
     geom_line(aes(colour=Species)) +
     theme(text=element_text(size=7))

#basic usage
p1 <- p + easy_labs()

#supplying own label (like regular ggplot2::labs)
p2 <- p + easy_labs(x='My x axis')

#adding new label (like regular ggplot2::labs)
p3 <- p + easy_labs(title='Plot Title')

#complex usage: 
#  adding layer level data with same column names but different labels

iris_labs_2 <- iris_labs
var_label(iris_labs_2$Species) <- "Sub-genera"

p4 <- p + 
  geom_point(data=iris_labs_2, aes(fill=Species),shape=24) +
  facet_wrap(~Species,labeller = label_both) + 
  easy_labs()

plot_grid(p1, p2, p3, p4, nrow = 2)

