## ---- message = FALSE----------------------------------------------------
library(ggplot2)
library(cowplot)
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
    
plot_grid(p1, p2, p3, p4, nrow = 2, align = "hv", axis = "l")

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

plot_grid(p1, p2, p3, p4, nrow = 2, align = "hv", axis = "l")

## ---- fig.width = 8, fig.height = 8--------------------------------------
p <- ggplot(mtcars, aes(cyl, hp, col = "red")) + geom_point()

p1 <- p + 
    labs(title = "Default red points")
p2 <- p + 
    ggbot("blue points") + 
    labs(title = "A string request")
p3 <- p + 
    ggbot("points", "blue") +
    labs(title = "The order is irrelevant")
p4 <- p + 
    ggbot("blue", "point") +
    labs(title = "Partial match to words")
    
plot_grid(p1, p2, p3, p4, nrow = 2, align = "hv", axis = "l")

## ---- fig.width = 5, fig.height = 5--------------------------------------
ggplot(mtcars, aes(wt, mpg, colour = factor(cyl), size = hp)) + 
    geom_point() + 
    theme_dark() + 
    ggbot("make points red white and blue")

## ---- fig.width = 8, fig.height = 8--------------------------------------
p <- ggplot(mtcars, aes(cyl, hp, col = "red")) + geom_point()

p1 <- p + 
    labs(title = "Default red points")
p2 <- p + 
    ggbot("drop x axis") + 
    labs(title = "No x axis")
p3 <- p + 
    ggbot("y axis remove") +
    labs(title = "No y axis")
p4 <- p + 
    ggbot("remove legend") +
    labs(title = "No legend")
    
plot_grid(p1, p2, p3, p4, nrow = 2, align = "hv", axis = "l")

## ---- fig.width = 5, fig.height = 5--------------------------------------
ggplot(mtcars, aes(wt, mpg, colour = factor(cyl), size = hp)) + 
    geom_point() + 
    ggbot("I don't need no theme") +
    ggbot("I don't need no legend")

