# From Hands-on Programming with R
# https://rstudio-education.github.io/hopr

hand1 <- c("ace", "king", "queen", "jack", "ten", "spades", "spades", 
           "spades", "spades", "spades")

matrix(hand1, nrow = 5)
matrix(hand1, ncol = 2)
dim(hand1) <- c(5, 2)

hand1


deck <- data.frame(
  face = rep(c("king", "queen", "jack", "ten", "nine", "eight", "seven", 
               "six", "five", "four", "three", "two", "ace"), times = 4),  
  suit = c(rep("spades", times = 13), 
           rep("clubs", times = 13), 
           rep("diamonds", times = 13), 
           rep("hearts", times = 13)), 
  value = rep(c(13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1), times = 4)
)

deck

shuffle <- function(cards) { 
  random <- sample(1:52, size = 52)
  cards[random, ]
}

shuffle(deck)
