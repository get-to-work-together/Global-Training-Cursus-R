library(tidyverse)

filename <- "datasets/ca-500.csv"

df <- read.csv(filename)    # data.frame
dt <- read_csv(filename)    # tibble

print(df)
print(dt)

class(df)
class(dt)

head(df, n = 2)
head(dt)

df %>% head(n = 2)
dt %>% head()
df %>% head(., n = 2)

n = 4
n %>% head(df, .)

# dplyr

dt %>% 
  select(first_name, last_name, city, email) %>%
  filter(startsWith(city, "M")) %>%
  group_by(city) %>%
  summarise(aantal = n()) %>%
  arrange(desc(aantal)) %>%
  top_n(4) %>%
  select(aantal) %>%
  summarise(totaal = sum(aantal))

# dpylr versus R base






dt2 <- dt %>% 
  select(first_name, last_name, city, email) %>%
  filter(startsWith(city, "M"))

filter(select(dt, first_name, last_name, city, email), startsWith(city, "M"))


df[startsWith(df$city, "M"),
   c("first_name", "last_name", "city", "email")]  




dt <- dt %>% 
  mutate(name = paste(first_name, last_name))
  
dt %>% select(-c(web,email))

dt2 %>% write_csv("datasets/data_out.csv")



dt %>% glimpse()

dt %>% head()

View(dt)
