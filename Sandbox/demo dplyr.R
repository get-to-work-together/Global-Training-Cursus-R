library(dplyr)

data(mtcars)

#---------------------------------------------------------------
# select columns

mtcars %>% select(mpg)

mtcars %>% select(mpg, cyl, hp)

variables = c("mpg", "cyl", "hp")
mtcars %>% select(any_of(variables))

# just like base R
mtcars[, variables]

#---------------------------------------------------------------
# pull one column

mtcars %>% pull(mpg)

# just like base R
mtcars$mpg
mtcars[['mpg']]

#---------------------------------------------------------------
# filter rows

mtcars %>% filter(cyl == 4)

mtcars %>% select(mpg, cyl, disp) %>% filter(cyl == 4)

mtcars %>% select(mpg, cyl, disp) %>% filter(cyl == 4, mpg > 25)

mtcars %>% select(mpg, cyl, disp) %>% filter(cyl %in% c(4, 6))

#---------------------------------------------------------------
# sort by a column

mtcars %>% arrange(mpg)

mtcars %>% arrange(mpg, cyl)

mtcars %>% arrange(desc(mpg), cyl)

mtcars %>% 
  select(mpg, cyl, disp) %>% 
  filter(cyl %in% c(4, 6)) %>%
  arrange(disp)

#---------------------------------------------------------------
# count unique values

mtcars %>% count(cyl)

#---------------------------------------------------------------
# group by and summerize

mtcars %>% group_by(cyl) %>% summarize(avg_hp = mean(hp))

mtcars %>% 
  group_by(cyl) %>% 
  summarize(avg_hp = mean(hp), 
            n = n(), 
            total = sum(hp),
            avg = total / n)

mtcars %>%
  group_by(cyl) %>%
  summarize(
    mean = mean(disp),
    median = median(disp),
    sd = sd(disp),
    iqr = IQR(disp),
    mad = mad(disp),
    min = min(disp),
    max = max(disp),
    quantile(disp),
    first = first(disp),
    last = last(disp),
    nth = nth(disp, 4),
    n = n(),
    n_dist = n_distinct(disp),
    any = any(disp),
    all = all(disp),
  )
