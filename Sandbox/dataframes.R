# Create the data frame.
emp.data <- data.frame( emp_id = c (1:5), 
                        emp_name = c("Rick","Dan","Michelle","Ryan","Gary"), 
                        salary = c(623.3,515.2,611.0,729.0,843.25), 
                        start_date = as.Date(c("2012-01-01", 
                                               "2013-09-23", 
                                               "2014-11-15", 
                                               "2014-05-11", 
                                               "2015-03-27")), 
                        stringsAsFactors = FALSE ) 

# Print the data frame.
print(emp.data)

# Get the structure of the data frame.
print(str(emp.data))

# Print the summary.
print(summary(emp.data))

# Selecting columns

# Extract Specific columns.
result <- data.frame(emp.data$emp_name,emp.data$salary)
print(result)

# Extract first three columns.
result <- emp.data[1:3]
print(result)

# Filtering rows

# Extract first three rows
result <- emp.data[1:3,]
print(result)

# Extract 3rd and 5th row with 2nd and 4th column.
result <- emp.data[c(3,5),c(2,4)]
print(result)

# Expanding a data frame

# Add the "dept" coulmn.
emp.data$dept <- c("IT","Operations","IT","HR","Finance")
print(emp.data)

#----------------------------------
set.seed(24)
my_df <- data.frame(x = 1:10,
                    y = 11:20,
                    z = 3:12,
                    w = sample(c("Group 1", "Group 2"), 10, replace = TRUE))
head(my_df)

# First column (simplified as vector)
my_df[[1]]
my_df[, 1]   # Equivalent
my_df[["x"]] # Equivalent
my_df[, c(TRUE, FALSE, FALSE, FALSE)] # Equivalent

# First column (with column and row names)
my_df[1]
my_df[, 1, drop = FALSE] # Equivalent
my_df["x"]               # Equivalent
my_df[c(TRUE, FALSE, FALSE, FALSE)] # Equivalent

# Second and third column
my_df[c(2, 3)]
my_df[, c(2, 3)]   # Equivalent
my_df[c("y", "z")] # Equivalent
my_df[c(FALSE, TRUE, TRUE, FALSE)] # Equivalent

