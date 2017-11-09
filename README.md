
<!-- README.md is generated from README.Rmd. Please edit that file -->
ggeasy
======

You know how to make `ggplot2` graphics, right? No worries. Piece of

Now, can you please rotate the `x` axis labels to vertical?

![](inst/media/xkcd.png) ![](inst/media/winona.gif) ![](inst/media/sherlock.gif)

`ggeasy` is here to make that a little easier.

Installation
------------

You can install ggeasy from github with:

``` r
# install.packages("devtools")
devtools::install_github("jonocarroll/ggeasy")
```

Example
-------

``` r
library(ggplot2)
library(ggeasy)

ggplot(mtcars, aes(hp, mpg)) + 
    geom_point() + 
    easy_rotate_x_labels()
```

![](README-example-1.png)
