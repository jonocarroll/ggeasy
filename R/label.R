#' @title Add label attribute to data.frame columns
#' @description Utility function to add label attribute to data.frame columns.
#' @param .data data.frame, data.frame to manipulate 
#' @param vars character, names of columns to add label attribute
#' @param labels character, labels to append to vars
#' @return data.frame
#' @examples 
#' lbl <- c('Sepal Length','Sepal Width','Petal Length','Petal Width','Flower Species')
#' 
#' iris_labs <- iris%>%label(vars=names(iris),labels = lbl)
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
