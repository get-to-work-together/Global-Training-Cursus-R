# data frame 1
df1 = data.frame(CustomerId = c(1:6), Product = c("Oven","Television","Mobile","WashingMachine","Lightings","Ipad"))
df1 

# data frame 2
df2 = data.frame(CustomerId = c(2, 4, 6, 7, 8), State = c("California","Newyork","Santiago","Texas","Indiana")) 
df2 

#### Inner Join using merge function
df = merge(x=df1, y=df2, by="CustomerId")
df

###### Left join in R using merge() function 
df = merge(x=df1, y=df2, by="CustomerId", all.x=TRUE)
df

###### Left join in R using merge() function 
df = merge(x=df1, y=df2, by="CustomerId", all=TRUE)
df
