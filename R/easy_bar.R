#' Easy mean bar plot
#'
#' @description Create a bar plot that displays the mean of a numeric variable according to the values of a factor variable (factor in a statistical sense, it doesn't need to be of a  factor class)
#' @md
#' @param df the dataframe
#' @param fct_var the factor variable
#' @param num_var the function will calculate the mean of num_var for each value of fct_var
#' @param teach print longer equivalent \code{\link[ggplot2]{ggplot2}}
#' expression?
#' @return a \code{\link[ggplot2]{ggplot2}} object
#' @export
#' @author Mohamed El Fodil Ihaddaden
#' @examples
#' library(ggplot2)
#' easy_bar_mean(df = mpg, fct_var = class, num_var = hwy)
#'
#'
#'



easy_bar_mean <- function(df, fct_var, num_var, teach = FALSE) {


  if (teach) {message("easy_bar_mean call can be substituted with:")
    message(strwrap('ggplot(df, aes(reorder(fct_var, -num_var), num_var)) +
    geom_bar(stat = "summary", fun = "mean") +
      xlab("") +
      xlab("mean")

      ',
      width = 80,
      exdent = 2,
      prefix = "\n",
      initial = ""
    ))}



    ggplot({{df}}, aes(reorder({{fct_var}}, -{{num_var}}), {{num_var}})) +
        geom_bar(stat = "summary", fun = "mean") +
        ylab("mean") +
        xlab("")


  }





#' Easy median bar plot
#'
#' @description Create a bar plot that displays the median of a numeric variable according to the values of a factor variable (factor in a statistical sense, it doesn't need to be a  factor class)
#' @md
#' @param df the dataframe
#' @param fct_var the factor variable
#' @param num_var the function will calculate the mean of num_var for each value of fct_var
#' @param teach print longer equivalent \code{\link[ggplot2]{ggplot2}}
#' expression?
#' @return a \code{\link[ggplot2]{theme}} object
#' @export
#' @author Mohamed El Fodil Ihaddaden
#' @examples
#' library(ggplot2)
#' easy_bar_median(df = mpg, fct_var = class, num_var = hwy)
#'
#'
#'




easy_bar_median<- function(df, fct_var, num_var, teach = FALSE) {




  return(ggplot(df, aes(reorder({{fct_var}}, -{{num_var}}), {{num_var}})) +
      geom_bar(stat = "summary", fun = "median") +
      ylab("median") +
      xlab(""))


  if (teach) {
    message("easy_bar_mean call can be substituted with:")
    message(strwrap('ggplot(df, aes(reorder(fct_var, -num_var), num_var)) +
    geom_bar(stat = "summary", fun.y = "median") +
      xlab("") +
      xlab("mean")

      ',
      width = 80,
      exdent = 2,
      prefix = "\n",
      initial = ""
    ))

  }



}


