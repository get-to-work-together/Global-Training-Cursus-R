library(tidyverse)
library(lubridate)

# Set working directory
setwd("~/Global Training/Trainingen/Cursus R")

# Define the column names
names <- "STN,YYYYMMDD,DDVEC,FHVEC,   FG,  FHX, FHXH,  FHN, FHNH,  FXX, FXXH,   TG,   TN,  TNH,   TX,  TXH, T10N,T10NH,   SQ,   SP,    Q,   DR,   RH,  RHX, RHXH,   PG,   PX,  PXH,   PN,  PNH,  VVN, VVNH,  VVX, VVXH,   NG,   UG,   UX,  UXH,   UN,  UNH, EV24"
col_names <- trimws(unlist(strsplit(names, ",")))

n_rows_to_skip = 48

# Read the data into tibbles
df_260_all <- read_csv("Datasets/etmgeg_260.txt", 
                       skip = n_rows_to_skip,
                       col_names = col_names, show_col_types = FALSE)

df_279_all <- read_csv("Datasets/etmgeg_279.txt", 
                       skip = n_rows_to_skip,
                       col_names = col_names, show_col_types = FALSE)

# Convert YYYYMMDD to dates
df_260_all$dd <- as.Date(as.character(df_260_all$YYYYMMDD), format="%Y%m%d")
df_279_all$dd <- as.Date(as.character(df_279_all$YYYYMMDD), format="%Y%m%d")

# Only select rows and columns of interest
columns.of.interest <- c("dd", "STN", "TG")

df_260 <- df_260_all %>% select(columns.of.interest) %>% filter(year(dd) == 2020)
df_279 <- df_279_all %>% select(columns.of.interest) %>% filter(year(dd) == 2020)

# remove raw data from environment
remove(df_260_all)
remove(df_279_all)

# Convert temperature
df_260$TG <- df_260$TG / 10
df_279$TG <- df_279$TG / 10

# plot
plot(df_260$dd, df_260$TG, type = 'l', col="red")
lines(df_279$dd, df_279$TG, col="blue")
legend("topleft", c("STN 260","STN 279"), fill=c("red","blue"))

# scatter plot
plot(df_260$TG, df_279$TG, type = 'p')
lines(c(0, 30), c(0, 30), col="red")

# create difference
df <- merge(df_260[c("dd", "TG")], 
            df_279[c("dd", "TG")], 
            by = 'dd',
            suffixes = c("_260", "_279"))
df$diff <- df$TG_279 - df$TG_260

# descriptive statistics
summary(df$diff)

# boxplot
boxplot(df$diff, 
        main = "Temperature difference",
        horizontal=TRUE,
        col = "lightblue")
mtext(paste("median = ", round(median(df$diff), 3)), side = 3)

# histogram of temperature differences
hist(df$diff,
     main = "Temperature difference",
     breaks = 40,
     col = "lightblue")
mtext(paste("Mean = ", round(mean(df$diff), 2)), side = 3)

# student-t test - one-sided
t.test(df$diff, alternative = "less", mu = 0)




