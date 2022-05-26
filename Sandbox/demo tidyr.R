library(tidyr)

data <- data.frame(ID1 = LETTERS[1:4],        # Create example data
                   ID2 = rep(letters[1:3], each = 4),
                   x = 1:12,
                   y = 21:32)
data

# Convert Wide to Long
data_long <- pivot_longer(data = data,        # Convert wide to long
                          cols = c("x", "y"))
data_long 

# Convert Long to Wide
data_wide <- pivot_wider(data = data_long)    # Convert long to wide
data_wide
