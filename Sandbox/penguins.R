install.packages("palmerpenguins")

library(tidyverse)

library(palmerpenguins)

# Get the data
data("penguins") 

# Exploratory Data Analysis
head(penguins)
str(penguins)
nrow(penguins)
colnames(penguins)
summary(penguins)

# Remove missing rows
penguins <- na.omit(penguins)

# Univariate Analysis


# Scatter plots
plot(x = penguins$bill_length_mm, 
     y = penguins$bill_depth_mm,
     col = penguins$species,
     xlab = "bill_length_mm",
     ylab = "bill_depth_mm",
     main = "Penguins")

ggplot(penguins,
       aes(bill_length_mm, bill_depth_mm, colour = species)) + geom_point()

# Paired Scatter Plots
pairs(~ bill_length_mm + bill_depth_mm + flipper_length_mm + body_mass_g,
      data = penguins,
      main = "Scatterplot Matrix")

# Color selection
colors <- c("#e60049", "#0bb4ff", "#50e991")

pairs(~ bill_length_mm + bill_depth_mm + flipper_length_mm + body_mass_g,
      data = penguins,
      col = colors[penguins$species],
      main = "Scatterplot Matrix")

# Correlation
numeric_columns <- c('bill_length_mm','bill_depth_mm','flipper_length_mm','body_mass_g')
cor(penguins[numeric_columns], penguins[numeric_columns])

# dplyr
penguins %>% glimpse()

penguins %>% select(bill_length_mm, bill_depth_mm, flipper_length_mm, body_mass_g)

penguins %>% filter(island == 'Torgersen')

penguins %>% group_by(species) %>% summarize(Mean = mean(body_mass_g, na.rm=TRUE))

penguins %>% 
  mutate(calculated = bill_length_mm / bill_depth_mm, .keep = "used")

