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

## ------------------------------------------------------------------------
ggplot(mtcars) +
  geom_bar(aes(x = factor(cyl))) +
  scale_y_continuous(expand = c(0, 0, 0.1, 0), limits = c(0, NA))

ggplot(mtcars) +
  geom_bar(aes(x = factor(cyl))) +
  easy_exact_limits("y")

ggplot(mtcars) +
  geom_bar(aes(x = factor(cyl))) +
  easy_exact_limits("y", limits = c(-10, NA))

ggplot(mtcars) +
  geom_bar(aes(x = factor(cyl))) +
  easy_exact_ylim()

## still have control; set the limits to the extent with no expansion
ggplot(mtcars) +
    geom_point(aes(x = mpg, y = hp)) +
    easy_exact_xlim(expand = c(0, 0, 0, 0), limits = c(min(mtcars$mpg), max(mtcars$mpg))) +
    easy_exact_ylim(expand = c(0, 0, 0, 0), limits = c(min(mtcars$hp), max(mtcars$hp)))

## teach how to do this
ggplot(mtcars) +
  geom_bar(aes(x = factor(cyl))) +
  easy_exact_ylim(teach = TRUE)

ggplot(mtcars) +
  geom_bar(aes(x = factor(cyl))) +
  easy_exact_ylim(limit = c(-5, 20), teach = TRUE)

