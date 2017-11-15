label <- function(.data,vars,labels){
  
  IDX <- match(vars,names(.data))
  
  for(i in 1:length(IDX)){
    attr(.data[[IDX[i]]],'label') <- labels[i]  
  } 
  
  .data
}
