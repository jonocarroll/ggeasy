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
    
plot_grid(p1, p2, p3, p4, nrow = 2)

