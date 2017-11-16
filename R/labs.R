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
#'  p + labs(title='my title') + easy_labs(subtitle='mysubtitle',x='x axis label')
#' 
#' 
#' @rdname easy_labs
#' @export 

easy_labs <- function(...){

  man_labs <- labs(list(...))
  
  structure(man_labs, class = "easy_labs")
  
}

#' @export
easy_update_labels <- function(p,man_labs){

  root_dat_labs <- sapply(p$data,attr,which='label')
  root_dat_labs <- root_dat_labs[!sapply(root_dat_labs,is.null)]
  root_map <- unlist(p$mapping)
  
  root_labs <- lapply(root_map, function(x){
    
    new_lab <- root_dat_labs[[deparse(x)]]
    
    if(is.null(new_lab)){
      new_lab <- deparse(x)
    }

    new_lab
    
  })
  
  
  layers_map <- lapply(p$layers,function(x){
    l_map <- unlist(x$mapping) 
    
    l_dat_labs <- sapply(x$data,attr,which='label')
    l_dat_labs <- l_dat_labs[!sapply(l_dat_labs,is.null)]
    l_map <- unlist(x$mapping)
    
    l_labs <- lapply(l_map, function(y){
      
      new_lab <- l_dat_labs[[deparse(y)]]
      
      if(is.null(new_lab)) 
        new_lab <-  root_dat_labs[[deparse(y)]]
      
      if(is.null(new_lab))
        new_lab <- deparse(y)
      
      new_lab
      
    })
    
    unlist(l_labs)
  })
  
  args <- c(root_labs,unlist(layers_map))
 
  # keep last duplicate aes (ie last layer added)
  
  args <- args[!duplicated(names(args),fromLast = TRUE)]
  
  if(length(man_labs)>0)
    for(nm in names(man_labs))
      args[[nm]] <- man_labs[[nm]]
  

  plot_names <- unique(c(names(p$data),
                         unlist(lapply(p$layers,function(x) names(x$data))))
                       )
  
  for(i in names(args)){
    if(p$labels[[i]]%in%plot_names) #making sure only replacing default col names
      p$labels[[i]] <- args[[i]]
  }
  
  p
  
}

#' @export
ggplot_add.easy_labs <- function (p, object, objectname) {
  
    p <- easy_update_labels(object,p)

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