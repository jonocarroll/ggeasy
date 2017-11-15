#' @title Create ggplot labels using label attribtute of data.frame column
#' @description Applies same logic as \code{\link[ggplot2]{labs}} but uses as default
#' the column label attribute if present as the variable label in the plot.
#' @inheritDotParams ggplot2::labs
#' @return NULL
#' @examples 
#' 
#' lbl <- c('Sepal Length','Sepal Width','Petal Length','Petal Width','Flower Species')
#' 
#' iris_labs <- iris%>%label(vars=names(iris),labels = lbl)
#' 
#' p <- iris_labs%>%
#'   ggplot(aes(x=Sepal.Length,y=Sepal.Width))+
#'   geom_line(aes(colour=Species))
#'   
#'  p + easy_labs()
#'  
#'  p + easy_labs(title='my title',subtitle='mysubtitle',x='x axis label')
#' 
#' 
#' @rdname easy_labs
#' @export 

easy_labs <- function(...){
  
  p <- ggplot2::last_plot()
  
  dat_labs <- sapply(p$data,attr,which='label')
  man_labs <- list(...)
  
  args <- lapply(p$labels,function(x){
    
    if(x%in%names(dat_labs)){
      
      if(is.null(dat_labs[[x]])){
        x  
      }else{
        dat_labs[[x]]
      }
    }
    
  })
  
  man_labs <- list(...)
  
  if(length(man_labs)>0)
    for(nm in names(man_labs))
      args[[nm]] <- man_labs[[nm]]
  
  structure(args, class = "labels")
  
}
