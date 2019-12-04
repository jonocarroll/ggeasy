check_overlap <- function(p){
  g <- ggplotGrob(p)
  a <- g$grobs[[grep('axis-b',g$layout$name)]]$children$axis$grobs[[2]]$children[[1]]
  lab_len <- (nchar(a$label)/100)*(a$gp$fontsize/10)
  tick_diff <- as.numeric(diff(a$x))
  any(round(tick_diff-lab_len[1:length(tick_diff)],3)<=0)
}

easy_axis_angle <- function(p){
  if(check_overlap(p))
  p <- p+theme(axis.text.x = element_text(angle=90))
  p
}

p0 <- ggplot2::ggplot(iris,ggplot2::aes(x =Sepal.Length,y=Sepal.Width)) + geom_point()
p1 <- p0+scale_x_continuous(breaks = seq(4,8,.05))
p2 <- p1 + theme(axis.text = element_text(size=4))

p2

easy_axis_angle(p2)

cowplot::plot_grid(p1,easy_axis_angle(p1),nrow = 2)


g <- ggplot2::ggplotGrob(p0)
x <- g$grobs[[grep('axis-b',g$layout$name)]]$children$axis$grobs[[2]]$children[[1]]

library(grid)

hj <- resolveHJust(x$just,NULL)
vj <- resolveVJust(x$just,NULL)

tg <- textGrob(
  x$label,
  as.numeric(x$x) + 2 * (0.5 - hj),
  as.numeric(x$y) - vj,
  rot = x$rot,
  just = c(hj, vj),
  gp = x$text.gp,
  name = "text"
)

tg <- textGrob(
  strrep('R',1:3),
  seq(0.25,0.75,0.25),
  rep(0.5,3),
  rot = 0,
  just = c(0.5, 0.5),
  gp = NULL,
  name = "text"
)

x1 <- convertWidth(x$x - 0.5 * grobWidth(tg), "native", TRUE)
x2 <- convertWidth(x$x + 0.5 * grobWidth(tg), "native", TRUE)
y1 <- convertHeight(x$y - 0.5 * grobHeight(tg), "native", TRUE)
y2 <- convertHeight(x$y + 0.5 * grobHeight(tg), "native", TRUE)

newx <- convertWidth(x$x - 0 * grobWidth(tg), "native", TRUE)
newy <- convertWidth(x$y - 0 * grobWidth(tg), "native", TRUE)

diff(newx)

data.frame(Box) %>%slice(1:2)%>% ggplot(aes(x=x1,xend=x2,y=y1,yend=y2)) + geom_segment()

Box <- cbind(x1,x2,y1,y2)

overlaps <- function(a,b) {
    b['x1'] <= a['x2'] &
    b['y1'] <= a['y2'] &
    b['x2'] >= a['x1'] &
    b['y2'] >= a['y1']
}

overlaps(Box[1,],Box[2,])

centroid <- function(x1, y1, x2, y2, hj, vj){ matrix(c(x1 + (x2 - x1) * hj, y1 + (y2 - y1) * vj),ncol=2)}
center <- centroid(x1, y1, x2, y2, x$hj, x$vjust)

Rotate <- function (x, y = NULL, mx = NULL, my = NULL, rot=60, asp = 1) 
{
  theta <- rot * pi/180
  xy <- xy.coords(x, y)
  if (is.null(mx)) 
    mx <- mean(xy$x)
  if (is.null(my)) 
    my <- mean(xy$y)
  dx <- xy$x - mx
  dy <- xy$y - my
  ptx <- mx + cos(theta) * dx - sin(theta) * dy/asp
  pty <- my + sin(theta) * dx * asp + cos(theta) * dy
  return(xy.coords(x = ptx, y = pty))
}

library(polyclip)



