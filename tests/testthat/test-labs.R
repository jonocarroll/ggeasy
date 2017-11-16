context("attr labs")

iris_labs <- iris

lbl <- c('Sepal Length','Sepal Width','Petal Length','Petal Width','Flower Species')

labelled::var_label(iris_labs) <- split(lbl,names(iris_labs))

test_that("easy_labs uses column attrib", {
  
  p <- 
     ggplot(iris_labs,aes(x=Sepal.Length,y=Sepal.Width))+
     geom_line(aes(colour=Species))
     
  hard_res <- p + labs(x='Sepal Length',y='Sepal Width', colour='Flower Species')
     
  easy_res <- p + easy_labs()
  
  expect_equal(easy_res, hard_res)
})

test_that("regular labs overides easy_labs ", {

  p <- 
    ggplot(iris_labs,aes(x=Sepal.Length,y=Sepal.Width))+
    geom_line(aes(colour=Species))
  
  hard_res <- p + labs(x='x axis',y='Sepal Width', colour='Flower Species')
  
  easy_res <- p + easy_labs(x='x axis')
  
  expect_equal(easy_res, hard_res)
})

test_that("regular labs pass new labels through easy_labs ", {

  p <- 
    ggplot(iris_labs,aes(x=Sepal.Length,y=Sepal.Width))+
    geom_line(aes(colour=Species))
  
  hard_res <- p + labs(x='Sepal Length',y='Sepal Width', colour='Flower Species',title='my title')
  
  easy_res <- p + easy_labs(title='my title')
  
  expect_equal(easy_res, hard_res)
})

test_that("column name used when no column attrib present", {
  
  labelled::var_label(iris_labs$Sepal.Length) <- NULL
  
  p <- 
    ggplot(iris_labs,aes(x=Sepal.Length,y=Sepal.Width))+
    geom_line(aes(colour=Species))
  
  hard_res <- p + labs(y='Sepal Width', colour='Flower Species')
  
  hard_res$labels[c('x','y','colour')]
  
  easy_res <- p + easy_labs()
  
  easy_res$labels[c('x','y','colour')]
  
  expect_equal(easy_res, hard_res)
  
})