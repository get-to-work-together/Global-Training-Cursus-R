library(readr)
library(tibble)

# load in a tibble

dt <- as_tibble(mtcars)

filename <- "datasets/adventureworks.csv"
dt <- read_csv(filename)


