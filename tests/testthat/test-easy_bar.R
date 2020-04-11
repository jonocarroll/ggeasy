library(ggeasy)
library(tidyverse)



test_that("easy_remove_legend_title works", {


  easy_res <- easy_bar_mean(mpg, class, hwy)



  hard_res <- ggplot(mpg, aes(reorder(class, -hwy), hwy)) +
    geom_bar(stat = "summary", fun = "mean") +
    xlab("") +
    xlab("mean")


  expect_equal(easy_res, hard_res)
})
