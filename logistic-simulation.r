sim.logt.data <- function(x1, y1, n1, sd1, x2, y2, n2, sd2){
  wx1 = rnorm(n1, x1, sd1)
  wy1 = rnorm(n1, y1, sd1)
  z1 = rep(TRUE, n1)
  
  wx2 = rnorm(n2, x2, sd2)
  wy2 = rnorm(n2, y2, sd2)
  z2 = rep(FALSE, n2)
  
  df1 = data.frame(x = wx1, y = wy1, z = z1)
  df2 = data.frame(x = wx2, y = wy2, z = z2)
  
  rbind(df1, df2)
}

plot.class <- function(df){
  require(ggplot2)
  df$z <- as.factor(df$z)
  ggplot(df, aes(x, y)) +
    geom_point(aes(color = z, size = 3)) +
    ggtitle('X vs. Y for two classes')
}

logistic.mod <- function(df){
  glm(z ~ 0 + x + y, data = df, family = binomial)
}

logistic.prediction <- function(mod, df, prob = 0.5){
  df$score = ifelse(predict(mod, type = 'response') > prob, TRUE, FALSE)
  df
}