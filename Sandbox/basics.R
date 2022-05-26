
# Strings
myString <- "Hello, World!"
print (myString)

# Conditional statemenent
if (TRUE) {
  "Multi-line comments can be put in 
   single or double quotes"

  print("All is OK")
}


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

# ***************************************************************
# Variable

# Assignment using equal operator.
var.1 = c(0,1,2,3)           

# Assignment using leftward operator.
var.2 <- c("learn","R")   

# Assignment using rightward operator.   
c(TRUE,1) -> var.3           

print(var.1)
cat ("var.1 is ", var.1 ,"\n")
cat ("var.2 is ", var.2 ,"\n")
cat ("var.3 is ", var.3 ,"\n")

# ***************************************************************
# Workspace
print(ls())

print(ls(all.names = TRUE))

print(ls(pattern = "var")) 

rm(var.3)
print(var.3)

rm(list = ls())
print(ls())

# ***************************************************************
# Vectorized Operators

# Arithmetic Operators

v <- c( 2,5.5,6)
t <- c(8, 3, 4)

print(v+t)

print(v-t)

print(v*t)

print(v/t)

print(v%%t)

print(v%/%t)

print(v^t)

# Relational Operators

v <- c(2,5.5,6,9)
t <- c(8,2.5,14,9)

print(v>t)

print(v>=t)

print(v<t)

print(v<=t)

print(v==t)

print(v!=t)

# Logical Operators

v <- c(3,1,TRUE,2+3i)
t <- c(4,1,FALSE,2+3i)

print(v&t)

print(v|t)

print(!v)

# Assignment Operators

v1 <- c(3,1,TRUE,2+3i)
v2 <<- c(3,1,TRUE,2+3i)
v3 = c(3,1,TRUE,2+3i)
print(v1)
print(v2)
print(v3)

c(3,1,TRUE,2+3i) -> v1
c(3,1,TRUE,2+3i) ->> v2 
print(v1)
print(v2)

# Miscellaneous Operators

v <- 2:8
print(v) 

v1 <- 8
v2 <- 12
t <- 1:10
print(v1 %in% t) 
print(v2 %in% t) 

M1 = matrix( c(2,6,5,1,10,4), nrow = 2, ncol = 3, byrow = TRUE)
M2 = matrix( c(2,6,5,1,10,4), nrow = 2, ncol = 3, byrow = TRUE)

t = M1 %*% t(M2)
print(t)
