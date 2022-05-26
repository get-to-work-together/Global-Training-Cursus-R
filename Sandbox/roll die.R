# From Hands-on Programming with R
# https://rstudio-education.github.io/hopr

install.packages("ggplot2")

library("ggplot2")

# 2 die

roll <- function() {
  die <- 1:6
  dice <- sample(die, size = 2, replace = TRUE)
  sum(dice)
}

rolls <- replicate(10000, roll())
qplot(rolls, binwidth = 1)

# biased towards 6

roll <- function() {
  die <- 1:6
  dice <- sample(die, size = 2, replace = TRUE, 
                 prob = c(1/8, 1/8, 1/8, 1/8, 1/8, 3/8))
  sum(dice)
}

rolls <- replicate(10000, roll())
qplot(rolls, binwidth = 1)
