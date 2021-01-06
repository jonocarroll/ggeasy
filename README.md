
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ggeasy <img src='man/figures/logo.gif' align="right" height="138.5" />

<!-- http://www.clker.com/clipart-2-puzzle-pieces-connected.html -->

[![Covrpage
Summary](https://img.shields.io/badge/covrpage-Last_Build_2021_01_06-yellowgreen.svg)](https://github.com/jonocarroll/ggeasy/blob/master/tests/README.md)
[![Travis build
status](https://travis-ci.org/jonocarroll/ggeasy.svg?branch=master)](https://travis-ci.org/jonocarroll/ggeasy)
[![AppVeyor build
status](https://ci.appveyor.com/api/projects/status/github/jonocarroll/ggeasy?branch=master&svg=true)](https://ci.appveyor.com/project/jonocarroll/ggeasy)
[![R-CMD-check](https://github.com/jonocarroll/ggeasy/workflows/R-CMD-check/badge.svg)](https://github.com/jonocarroll/ggeasy/actions)
[![Codecov test
coverage](https://codecov.io/gh/jonocarroll/ggeasy/branch/master/graph/badge.svg)](https://codecov.io/gh/jonocarroll/ggeasy?branch=master)
[![CRAN
status](https://www.r-pkg.org/badges/version/ggeasy)](https://CRAN.R-project.org/package=ggeasy)

You know how to make `ggplot2` graphics, right? No worries. Piece of
cake.

Now, can you please rotate the `x` axis labels to vertical?

![](https://raw.githubusercontent.com/jonocarroll/ggeasy/master/inst/media/xkcd.png)
<!-- ![](https://raw.githubusercontent.com/jonocarroll/ggeasy/master/inst/media/winona.gif) -->
<!-- ![](https://raw.githubusercontent.com/jonocarroll/ggeasy/master/inst/media/sherlock.gif) -->

`ggeasy` is here to make that a little easier.

## Installation

You can install the latest released version of `ggeasy` from CRAN with:

``` r
install.packages("ggeasy")
```

or the bleeding-edge development version from GitHub with

``` r
# install.packages("remotes")
remotes::install_github("jonocarroll/ggeasy")
```

## Reference

See the [`pkgdown` site](https://jonocarroll.github.io/ggeasy/).

[@amrrs](https://github.com/amrrs) a.k.a.
[@1littlecoder](https://twitter.com/1littlecoder) has produced a video
walkthrough using `ggeasy` which covers some of the major features:

[![Watch the
video](https://img.youtube.com/vi/iAH1GJoBZmI/maxresdefault.jpg)](https://youtu.be/iAH1GJoBZmI)

## Examples

``` r
library(ggplot2)
library(ggeasy)

# rotate x axis labels
ggplot(mtcars, aes(hp, mpg)) + 
    geom_point() + 
    easy_rotate_x_labels()
```

![](man/figures/example-1.png)<!-- -->

``` r
# rotate y axis labels
ggplot(mtcars, aes(hp, mpg)) + 
    geom_point() + 
    easy_rotate_y_labels()
```

![](man/figures/example-2.png)<!-- -->

``` r
# remove 'size' legend
ggplot(mtcars, aes(wt, mpg, colour = cyl, size = hp)) +
    geom_point() +
    easy_remove_legend(size)
```

![](man/figures/example-3.png)<!-- -->

``` r
# make the x axis labels larger
ggplot(mtcars, aes(mpg, hp)) +
  geom_point() +
  easy_x_axis_labels_size(22)
```

![](man/figures/example-4.png)<!-- -->

``` r
# make all the text red
ggplot(mtcars, aes(mpg, hp)) +
  geom_point(aes(fill = gear)) +
  easy_all_text_color("red")
```

![](man/figures/example-5.png)<!-- -->

``` r
# remove just x axis
ggplot(mtcars, aes(wt, mpg)) +
  geom_point() + 
  easy_remove_x_axis()
```

![](man/figures/example-6.png)<!-- -->

``` r
# remove y axis ticks
ggplot(mtcars, aes(wt, mpg)) +
  geom_point() + 
  easy_remove_y_axis(what = "ticks")
```

![](man/figures/example-7.png)<!-- -->

``` r
# move legends to bottom
ggplot(mtcars, aes(wt, mpg, colour = cyl, size = hp)) +
  geom_point() + 
  easy_move_legend("bottom")
```

![](man/figures/example-8.png)<!-- -->

``` r
# move legend to left side
ggplot(mtcars, aes(wt, mpg, colour = cyl, size = hp)) +
  geom_point() +
  easy_legend_at("left")
```

![](man/figures/example-9.png)<!-- -->

``` r
# Make legends horizontal
ggplot(mtcars, aes(wt, mpg, colour = cyl, size = hp)) +
  geom_point() + easy_rotate_legend("horizontal")
```

![](man/figures/example-10.png)<!-- -->

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

![](man/figures/example-11.png)<!-- -->

These functions will try to teach you the ‘official’ way to achieve
these goal, usually via the `teach` argument (where implemented)

``` r
ggplot(mtcars, aes(hp, mpg)) + 
    geom_point() + 
    easy_rotate_y_labels(angle = "startatbottom", teach = TRUE)
#> easy_rotate_y_labels call can be substituted with:
#> theme(axis.text.y = element_text(angle = 90, hjust = 0))
```

![](man/figures/teach-1.png)<!-- -->

``` r
ggplot(mtcars, aes(wt, mpg)) +
  geom_point() + 
  easy_remove_y_axis(what = "ticks", teach = TRUE)
#> easy_remove_y_axis call can be substituted with:
#> theme(axis.ticks.y = element_blank())
```

![](man/figures/teach-2.png)<!-- -->

## Credits

Many thanks to [Sébastien Rochette (@statnmap)](https://statnmap.com/)
for the design and execution of the hex logo.
