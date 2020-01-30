
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ggeasy <img src='man/figures/logo.png' align="right" height="138.5" />

<!-- http://www.clker.com/clipart-2-puzzle-pieces-connected.html -->

[![Covrpage
Summary](https://img.shields.io/badge/covrpage-Last_Build_2020_01_29-yellowgreen.svg)](https://github.com/jonocarroll/ggeasy/blob/master/tests/README.md)
[![Travis build
status](https://travis-ci.org/jonocarroll/ggeasy.svg?branch=master)](https://travis-ci.org/jonocarroll/ggeasy)
[![AppVeyor build
status](https://ci.appveyor.com/api/projects/status/github/jonocarroll/ggeasy?branch=master&svg=true)](https://ci.appveyor.com/project/jonocarroll/ggeasy)
[![Codecov test
coverage](https://codecov.io/gh/jonocarroll/ggeasy/branch/master/graph/badge.svg)](https://codecov.io/gh/jonocarroll/ggeasy?branch=master)
[![CRAN
status](https://www.r-pkg.org/badges/version/ggeasy)](https://CRAN.R-project.org/package=ggeasy)

You know how to make `ggplot2` graphics, right? No worries. Piece of
cake.

Now, can you please rotate the `x` axis labels to
vertical?

![](https://raw.githubusercontent.com/jonocarroll/ggeasy/master/inst/media/xkcd.png)
![](https://raw.githubusercontent.com/jonocarroll/ggeasy/master/inst/media/winona.gif)
![](https://raw.githubusercontent.com/jonocarroll/ggeasy/master/inst/media/sherlock.gif)

`ggeasy` is here to make that a little easier.

## Installation

You can install ggeasy from github with:

``` r
# install.packages("devtools")
devtools::install_github("jonocarroll/ggeasy")
```

## Reference

See the [`pkgdown` site](https://jonocarroll.github.io/ggeasy/).

## Examples

``` r
library(ggplot2)
library(ggeasy)

# rotate x axis labels
ggplot(mtcars, aes(hp, mpg)) + 
    geom_point() + 
    easy_rotate_x_labels()
```

![](tools/readme/README-example-1.png)<!-- -->

``` r

# rotate y axis labels
ggplot(mtcars, aes(hp, mpg)) + 
    geom_point() + 
    easy_rotate_y_labels()
```

![](tools/readme/README-example-2.png)<!-- -->

``` r

# remove 'size' legend
ggplot(mtcars, aes(wt, mpg, colour = cyl, size = hp)) +
    geom_point() +
    easy_remove_legend(size)
```

![](tools/readme/README-example-3.png)<!-- -->

``` r

# make the x axis labels larger
ggplot(mtcars, aes(mpg, hp)) +
  geom_point() +
  easy_x_axis_labels_size(22)
```

![](tools/readme/README-example-4.png)<!-- -->

``` r

# make all the text red
ggplot(mtcars, aes(mpg, hp)) +
  geom_point(aes(fill = gear)) +
  easy_all_text_color("red")
```

![](tools/readme/README-example-5.png)<!-- -->

``` r

# remove just x axis
ggplot(mtcars, aes(wt, mpg)) +
  geom_point() + 
  easy_remove_x_axis()
```

![](tools/readme/README-example-6.png)<!-- -->

``` r

# remove y axis ticks
ggplot(mtcars, aes(wt, mpg)) +
  geom_point() + 
  easy_remove_y_axis(what = "ticks")
```

![](tools/readme/README-example-7.png)<!-- -->

``` r

# move legends to bottom
ggplot(mtcars, aes(wt, mpg, colour = cyl, size = hp)) +
  geom_point() + 
  easy_move_legend("bottom")
```

![](tools/readme/README-example-8.png)<!-- -->

``` r

# move legend to left side
ggplot(mtcars, aes(wt, mpg, colour = cyl, size = hp)) +
  geom_point() +
  easy_legend_at("left")
```

![](tools/readme/README-example-9.png)<!-- -->

``` r

# Make legends horizontal
ggplot(mtcars, aes(wt, mpg, colour = cyl, size = hp)) +
  geom_point() + easy_rotate_legend("horizontal")
```

![](tools/readme/README-example-10.png)<!-- -->

``` r

# use labelled variables
iris_labs <- iris
labelled::var_label(iris_labs$Species) <- "Flower\nSpecies"
labelled::var_label(iris_labs$Sepal.Length) <- "Length of Sepal"
iris_labs_2 <- iris_labs
labelled::var_label(iris_labs_2$Species) <- "Sub-genera"

# use variable labels automatically
ggplot(iris_labs, aes(x = Sepal.Length, y = Sepal.Width)) +
    geom_line(aes(colour = Species)) + 
    geom_point(data = iris_labs_2, aes(fill = Species), shape = 24) +
    easy_labs()
```

![](tools/readme/README-example-11.png)<!-- -->

These functions will try to teach you the ‘official’ way to achieve
these goal, usually via the `teach` argument (where implemented)

``` r
ggplot(mtcars, aes(hp, mpg)) + 
    geom_point() + 
    easy_rotate_y_labels(angle = "startatbottom", teach = TRUE)
#> easy_rotate_y_labels call can be substituted with:
#> theme(axis.text.y = element_text(angle = 90, hjust = 0))
```

![](tools/readme/README-teach-1.png)<!-- -->

``` r

ggplot(mtcars, aes(wt, mpg)) +
  geom_point() + 
  easy_remove_y_axis(what = "ticks", teach = TRUE)
#> easy_remove_y_axis call can be substituted with:
#> theme(axis.ticks.y = element_blank())
```

![](tools/readme/README-teach-2.png)<!-- -->
