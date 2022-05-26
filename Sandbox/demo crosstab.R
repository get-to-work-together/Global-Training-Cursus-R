# from http://analyticswithr.com/contingencytables.html

library(ggplot2)
library(dplyr)
library(tidyr)
library(knitr) #for printing html-friendly tables.

mpg

mpg %>%
  kable

mpg %>%
  group_by(class, cyl) %>%
  summarize(n=n())
  
  
mpg %>%
  group_by(class, cyl) %>%
  summarise(n=n()) %>%
  spread(cyl, n)


# average number of city miles by class & cyl
mpg %>%
  group_by(class, cyl) %>%
  summarise(mean_cty=mean(cty)) %>%
  spread(cyl, mean_cty) %>%
  kable()

# max number of city miles by class & cyl
mpg %>%
  group_by(class, cyl) %>%
  summarise(max_cty=max(cty)) %>%
  spread(cyl, max_cty) %>%
  kable()


# We can find proportions by creating a new, calculated variable dividing row frequency by table frequency.
mpg %>%
  group_by(class) %>%
  summarize(n=n()) %>%
  mutate(prop=n/sum(n)) %>%   # our new proportion variable
  kable()

# contingency table of proportion values
mpg %>%
  group_by(class, cyl) %>%
  summarize(n=n()) %>%
  mutate(prop=n/sum(n)) %>%
  subset(select=c("class","cyl","prop")) %>%   #drop the frequency value
  spread(class, prop) %>%
  kable()
