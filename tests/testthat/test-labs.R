context("attr labs")

test_that("easy_labs uses column attrib", {
  lbl <- c('Sepal Length','Sepal Width','Petal Length','Petal Width','Flower Species')
   
  iris_labs <- label(iris,vars=names(iris),labels = lbl)
   
  p <- 
     ggplot(iris_labs,aes(x=Sepal.Length,y=Sepal.Width))+
     geom_line(aes(colour=Species))
     
  p_man_labs <- p + labs(x='Sepal Length',y='Sepal Width', colour='Flower Species')
     
  p_labs <- p + easy_labs()
  
  expect_equal(p_labs$labels, p_man_labs$labels)
})

test_that("regular labs overides easy_labs ", {
  lbl <- c('Sepal Length','Sepal Width','Petal Length','Petal Width','Flower Species')
  
  iris_labs <- label(iris,vars=names(iris),labels = lbl)
  
  p <- 
    ggplot(iris_labs,aes(x=Sepal.Length,y=Sepal.Width))+
    geom_line(aes(colour=Species))
  
  p_man_labs <- p + labs(x='x axis',y='Sepal Width', colour='Flower Species')
  
  p_labs <- p + easy_labs(x='x axis')
  
  expect_equal(p_labs$labels, p_man_labs$labels)
})

test_that("regular labs pass new labels through easy_labs ", {
  lbl <- c('Sepal Length','Sepal Width','Petal Length','Petal Width','Flower Species')
  
  iris_labs <- label(iris,vars=names(iris),labels = lbl)
  
  p <- 
    ggplot(iris_labs,aes(x=Sepal.Length,y=Sepal.Width))+
    geom_line(aes(colour=Species))
  
  p_man_labs <- p + labs(x='Sepal Length',y='Sepal Width', colour='Flower Species',title='my title')
  
  p_labs <- p + easy_labs(title='my title')
  
  expect_equal(p_labs$labels, p_man_labs$labels)
})

test_that("column name used when no column attrib present", {
  lbl <- c('Sepal Width','Petal Length','Petal Width','Flower Species')
  
  iris_labs <- label(iris,vars=names(iris)[-1],labels = lbl)
  
  p <- 
    ggplot(iris_labs,aes(x=Sepal.Length,y=Sepal.Width))+
    geom_line(aes(colour=Species))
  
  p_man_labs <- p + labs(y='Sepal Width', colour='Flower Species')
  
  p_labs <- p + easy_labs()

  expect_equal(p_labs$labels[c('x','y','colour')], p_man_labs$labels[c('x','y','colour')])
})