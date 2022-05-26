# create a vector

c(1,6,3,8,3,4,2)

1:10

seq(1, 10, 0.5)

vector(mode = "integer", length = 10)

as.vector(1:10, mode = "character")

numbers <- 1:10

# inspection
length(numbers)
class(numbers)
mode(numbers)
typeof(numbers)
is.vector(numbers)

# operations
numbers + 100
numbers * 10
numbers - 1
numbers / 10

numbers %% 3
numbers %/% 3

numbers ^ 2

# vectorized operations
numbers * numbers

# attributes
die <- 1:6
names(die) <- c("one", "two", "three", "four", "five", "six")
die
attributes(die)
names(d)
