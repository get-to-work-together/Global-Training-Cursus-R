
# ***************************************************************
# Vector

# logical
v <- TRUE 
print(class(v))

# numeric
v <- 23.5 
print(class(v))

# integer
v <- 2L 
print(class(v))

# complex
v <- 2 + 3i 
print(class(v))

# character
v <- "Hello" 
print(class(v))

# raw
v <- charToRaw("Hello") 
print(class(v))

# multiple elements
apple <- c('red','green',"yellow")
print(apple)
print(class(apple))

# ***************************************************************
# List
list1 <- list(c(2,5,3),21.3,sin)

print(list1)


# ***************************************************************
# Matrice
M = matrix( c('a','a','b','c','b','a'), nrow = 2, ncol = 3, byrow = TRUE)

print(M)

# ***************************************************************
# Array
a <- array(c('green','yellow'), dim = c(3,3,2))

print(a)

# ***************************************************************
# Factor
factor_apple <- factor(c('green','green','yellow','red','red','red','green'))

print(factor_apple)
print(nlevels(factor_apple))

# ***************************************************************
# Data Frame
BMI <- data.frame(
  gender = c("Male", "Male", "Female"), 
  height = c(152, 171.5, 165), 
  weight = c(81, 93, 78),
  Age = c(42, 38, 26)
)
print(BMI)



