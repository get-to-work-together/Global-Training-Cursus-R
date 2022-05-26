library(data.table)

dt = as.data.table(iris)

# FROM[WHERE, SELECT, GROUP BY]
# DT  [i,     j,      by]

dt[Petal.Width > 1.0, mean(Petal.Length), by = Species]

#      Species       V1
#1: versicolor 4.362791
#2:  virginica 5.552000