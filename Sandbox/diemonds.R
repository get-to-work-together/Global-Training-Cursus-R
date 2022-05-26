
library(tidyverse)

diamonds

diamonds %>% select(cut) %>% group_by(cut) %>% summarise(aantal = n())

ggplot(data = diamonds, 
       mapping = aes(x = cut)) + 
  stat_count() + 
  coord_flip()

ggplot(data = diamonds,
       mapping = aes(y = price)) +
  geom_boxplot(color = "red",
               fill = "orange")

ggplot(data = diamonds,
       mapping = aes(x = carat, y = price)) +
  geom_violin(color = "red",
               fill = "orange")


ggplot(data = diamonds,
         mapping = aes(x = price)) +
  geom_histogram(fill = "orange", bins = 30)


diamonds %>% mutate(log_price = log(price)) %>%
  ggplot(data = .,
         mapping = aes(x = log_price)) +
    geom_histogram(fill = "gold") +
    theme_dark()




ggplot(data = diamonds,
       mapping = aes(x = price)) +
  geom_histogram(bins = 10, 
                 color = "gold", 
                 fill = "lightblue") +
  labs(x = "Price", y = "Count", title = "Diamonds")


ggplot(data = diamonds,
       mapping = aes(x = price)) +
  geom_histogram(bins = 10, fill = "gold")  +
  labs(x = "Price", y = "Count", title = "Diamonds") +
  facet_grid(color ~ clarity) +
  theme_dark()

ggplot(data = diamonds,
       mapping = aes(x = carat, 
                     y = price,
                     shape = cut,
                     color = color)) +
  geom_point(alpha = 0.5)

ggplot(data = diamonds,
       mapping = aes(x = carat)) +
  geom_histogram(bins = 100)

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, fill = color),
           position = "dodge")
