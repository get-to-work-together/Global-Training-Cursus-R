
library(ggplot2)

ggplot(mpg, 
       aes(displ, hwy, colour = class)) + 
  geom_point()

ggplot(data = mtcars, 
       mapping = aes(x = wt, y = mpg, color = as.factor(cyl))) +
  geom_point(size = 5)

ggplot(data = mtcars) + 
  aes(x = wt, y = mpg, color = as.factor(cyl)) +
  geom_point(size = 5)


library(MASS)
df = Cars93

ggplot(data = df) +
  aes(x = Price) +
  geom_histogram(bins = 30, fill = "#969696") +
  labs(title = "Single Variable Plot",
       x = "Price",
       caption = "Mass::Cars93",
       subtitle = "Type: Histogram") +
  theme_gray()

ggplot(data = df) +
  aes(x = Cylinders) +
  geom_bar(fill = "#969696") +
  labs(title = "Single Variable Plot",
       caption = "Mass::Cars93",
       subtitle = "Type: Bar Plot") +
  theme_gray()


ggplot(data = train_transformed) + 
  aes(x = health__pct_physical_inacticity, 
      y = health__pct_adult_obesity) + 
  geom_point(color = "#3f007d") + 
  geom_smooth(span = 0.75) + 
  labs(title = "Relationship Obesity and Physical Inactivity", 
       x = "Inactivity", 
       y = "Obesity") + 
  theme_grey()



# Facets
ggplot(data = mtcars, 
       mapping = aes(
         x = wt, 
         y = mpg)) + 
  geom_point() + 
  stat_smooth(method = 'lm') + 
  facet_wrap(~ cyl)


ggplot(data = mtcars, 
       mapping = aes(
         x = wt, 
         y = mpg)) + 
  geom_point() + 
  stat_smooth(method = 'lm') + 
  facet_wrap(am ~ cyl)

colors()


