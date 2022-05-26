# EDA - exploratory data analysis

ls("package:datasets")   # contains mtcars

mtcars

View(mtcars)	    # will display the mtcars data 
class(mtcars) 	  # display class of object 
str(mtcars) 		  # display the objects structure 
length(mtcars) 	  # length of object 
names(mtcars) 	  # object names of mtcars 
colnames(mtcars) 	# column names of mtcars 
rownames(mtcars) 	# row names of mtcars 
head(mtcars) 	    # displays the first 5 rows of data 
tail(mtcars) 	    # displays the last 5 rows of data 
nrows(mtcars)     # number of observations

# Graphs

require(graphics)
pairs(mtcars, main = "mtcars data", gap = 1/4)
coplot(mpg ~ disp | as.factor(cyl), 
       data = mtcars,
       panel = panel.smooth, rows = 1)

# Convert columns

mtcars2 <- within(mtcars, {
  vs <- factor(vs, labels = c("V", "S"))
  am <- factor(am, labels = c("automatic", "manual"))
  cyl  <- ordered(cyl)
  gear <- ordered(gear)
  carb <- ordered(carb)
})

str(mtcars2)

# ggplot

ggplot(data = mtcars,
       mapping = aes(x = wt, 
                     y = mpg, 
                     color = as.factor(cyl))) + 
  geom_point(size = 3)
