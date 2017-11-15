#' @title Easily add ggplot labels using label attribtute of data.frame column
#' @description Applies same logic as \code{\link[ggplot2]{labs}} but uses as default
#' the column label attribute if present as the variable label in the plot.
#' @param ... A list of new name-value pairs. The name should either be an aesthetic, 
#' or one of "title", "subtitle", or "caption"
#' @return NULL
#' @examples 
#' 
#' lbl <- c('Sepal Length','Sepal Width','Petal Length','Petal Width','Flower Species')
#' 
#' iris_labs <- label(iris,vars=names(iris),labels = lbl)
#' 
#' p <- 
#'   ggplot(iris_labs,aes(x=Sepal.Length,y=Sepal.Width))+
#'   geom_line(aes(colour=Species))
#'   
#'  p 
#'   
#'  p + easy_labs()
#'  
#'  p + easy_labs(p,title='my title',subtitle='mysubtitle',x='x axis label')
#' 
#' 
#' @rdname easy_labs
#' @export 

easy_labs <- function(...){

  man_labs <- labs(list(...))
  
  structure(man_labs, class = "easy_labels")
  
}


easy_update_labels <- function(p,man_labs){

  p <- plot_clone(p)
  
  dat_labs <- sapply(p$data,attr,which='label')
  
  
  args <- lapply(p$labels,function(x){
    
    if(x%in%names(dat_labs)){
      
      if(is.null(dat_labs[[x]])){
        x  
      }else{
        dat_labs[[x]]
      }
    }
    
  })
 
  if(length(man_labs)>0)
    for(nm in names(man_labs))
      args[[nm]] <- man_labs[[nm]]
  
  p$labels <- args
  
  p
  
}


#' @title Add label attribute to data.frame columns
#' @description Utility function to add label attribute to data.frame columns.
#' @param .data data.frame, data.frame to manipulate 
#' @param vars character, names of columns to add label attribute
#' @param labels character, labels to append to vars
#' @return data.frame
#' @examples 
#' lbl <- c('Sepal Length','Sepal Width','Petal Length','Petal Width','Flower Species')
#' 
#' iris_labs <- label(iris,vars=names(iris),labels = lbl)
#' 
#' @rdname label
#' @export 
#' @author Jonathan Sidi
label <- function(.data,vars,labels){
  
  IDX <- match(vars,names(.data))
  
  for(i in 1:length(IDX)){
    attr(.data[[IDX[i]]],'label') <- labels[i]  
  } 
  
  .data
}
