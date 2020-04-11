#' Easy mean bar plot
#'
#' @description Create a bar plot that displays the mean of a numeric variable according to the values of a factor variable
#' @param df the data frame
#' @param fct_var the factor variable
#' @param num_var the function will calculate the mean of num_var for each value of fct_var
#' @param col the color of the bar plot borders
#' @param fill the filling color of the bar plot
#' @param teach print longer equivalent \code{\link[ggplot2]{ggplot2}}
#' expression?
#' @return a \code{\link[ggplot2]{ggplot2}} object
#' @export
#' @author Mohamed El Fodil Ihaddaden
#' @examples
#' library(ggplot2)
#' easy_bar_mean(df = mpg, fct_var = class, num_var = hwy)
#'
#' @importFrom forcats fct_reorder
#' @importFrom ggplot2 ggplot
#'



easy_bar_mean <- function(df, fct_var, num_var, col = "brown1", fill = "brown4", teach = FALSE) {


  if (teach) {message("easy_bar_mean call can be substituted with:")
    message(strwrap(
    '
    ggplot(df, aes(forcats::fct_reorder(factor(fct_var), -num_var, .fun = mean), -num_var)) +
      geom_bar(stat = "summary", fun = "mean", color = "brown1", fill = "brown4") +
      ylab("mean") +
      xlab("")

      ',
      width = 80,
      exdent = 2,
      prefix = "\n",
      initial = ""
    ))}


    ggplot(df, aes(forcats::fct_reorder(factor({{fct_var}}), {{num_var}}, .fun = mean), {{num_var}})) +
      geom_bar(stat = "summary", fun = "mean", color = col, fill = fill) +
      ylab("mean") +
      xlab("")



  }


#' Easy median bar plot
#'
#' @description Create a bar plot that displays the median of a numeric variable according to the values of a factor variable
#' @md
#' @param df the data frame
#' @param fct_var the factor variable
#' @param num_var the function will calculate the median of num_var for each value of fct_var
#' @param col the color of the bar plot borders
#' @param fill the filling color of the bar plot
#' @param teach print longer equivalent \code{\link[ggplot2]{ggplot2}}
#' expression?
#' @return a \code{\link[ggplot2]{ggplot2}} object
#' @export
#' @author Mohamed El Fodil Ihaddaden
#' @examples
#' library(ggplot2)
#' easy_bar_median(df = mpg, fct_var = class, num_var = hwy)
#' @importFrom forcats fct_reorder
#' @importFrom ggplot2 ggplot
#'

easy_bar_median <- function(df, fct_var, num_var, col = "brown1", fill = "brown4", teach = FALSE) {


  if (teach) {message("easy_bar_median call can be substituted with:")
    message(strwrap(
      '
    ggplot(df, aes(forcats::fct_reorder(factor(fct_var), -num_var, .fun = median), -num_var)) +
      geom_bar(stat = "summary", fun = "median", color = "brown1", fill = "brown4") +
      ylab("median") +
      xlab("")

      ',
      width = 80,
      exdent = 2,
      prefix = "\n",
      initial = ""
    ))}


  ggplot(df, aes(forcats::fct_reorder(factor({{fct_var}}), {{num_var}}, .fun = median), {{num_var}})) +
    geom_bar(stat = "summary", fun = "median", color = col, fill = fill) +
    xlab("") +
    ylab("median")



}



#' Easy range bar plot
#'
#' @description Create a range plot in the for of error bars that displays the range of a numeric variable according to the values of a factor variable
#' @md
#' @param df the data frame
#' @param fct_var the factor variable
#' @param num_var the function will calculate the range of num_var for each value of fct_var
#' @param col the color of the range bar plot borders
#' @param teach print longer equivalent \code{\link[ggplot2]{ggplot2}}
#' expression?
#' @return a \code{\link[ggplot2]{ggplot2}} object
#' @export
#' @author Mohamed El Fodil Ihaddaden
#' @examples
#' library(ggplot2)
#' easy_range(df = mpg, fct_var = class, num_var = hwy)
#'
#' @importFrom forcats fct_reorder
#' @importFrom ggplot2 ggplot
#

easy_range <- function(df, fct_var, num_var, col = "brown1", teach = FALSE) {


  if (teach) {message("easy_range call can be substituted with:")
    message(strwrap(
      '
  summary <- function (y) {
  return(data.frame(min = min(y), max = max(y)))
  }

  ggplot(df, aes(forcats::fct_reorder(factor(fct_var), num_var, .fun = max), num_var)) +
    stat_summary(fun.data = summary, geom = "errorbar",  colour = "brown1", size = 2) +
    xlab("") +
    ylab("range")




      ',
      width = 80,
      exdent = 2,
      prefix = "\n",
      initial = ""
    ))}


  summary <- function(y) {
    return(data.frame(min = min(y), max = max(y)))

  }

  ggplot(df, aes(forcats::fct_reorder(factor({{fct_var}}), {{num_var}}, .fun = max), {{num_var}})) +
    stat_summary(fun.data = summary,geom = "errorbar",  colour = "brown1", size = 2) +
    xlab("")+
    ylab("range")


}



