context("barplots")


# testing the easy_bar_mean() function #################

testthat::test_that("easy bar mean draw correctly", {

  bar_mean_easy <- easy_bar_mean(mtcars, am, mpg)


  bar_mean_ggplot <- ggplot(mtcars, aes(forcats::fct_reorder(factor(am), mpg, .fun = mean), mpg)) +
    geom_bar(stat = "summary",
             fun = "mean",
             col = "brown1",
             fill = "brown4") +
    ylab("mean") +
    xlab("")

  vdiffr::expect_doppelganger("ggeasy easy_bar_mean", bar_mean_easy)
  vdiffr::expect_doppelganger("ggplot2 barplot mean", bar_mean_ggplot)

})

# testing the easy_bar_median() function #################

testthat::test_that("easy bar median draw correctly", {

  bar_median_easy <- easy_bar_median(mtcars, am, mpg)


  bar_median_ggplot <- ggplot(mtcars, aes(forcats::fct_reorder(factor(am), mpg, .fun = median), mpg)) +
    geom_bar(stat = "summary",
             fun = "median",
             col = "brown1",
             fill = "brown4") +
    ylab("median") +
    xlab("")

  vdiffr::expect_doppelganger("ggeasy easy_bar_median", bar_median_easy)
  vdiffr::expect_doppelganger("ggplot2 barplot median", bar_median_ggplot)

})


# testing the easy_bar_median() function #################




testthat::test_that("easy range bar draw correctly", {

  easy_range <- easy_range(mtcars, am, mpg)


  ggplot_range <- ggplot(mtcars, aes(forcats::fct_reorder(factor(am), mpg, .fun = max), mpg)) +
    stat_summary(fun.data = so.summary,geom = "errorbar",  colour = "brown1", size = 2) +
    xlab("")+
    ylab("range")

  vdiffr::expect_doppelganger("easy range", easy_range)
  vdiffr::expect_doppelganger("ggplot2 range", ggplot_range)

})


