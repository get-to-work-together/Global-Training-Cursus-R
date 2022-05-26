

filename <- 'Datasets/Lemonade.csv'

df <- read.csv(filename)

df$Date <- as.Date(df$Date, format='%d/%m/%Y')
df$Day <- as.factor(df$Day)

df

write.csv(df, 'Data/clean_lemonade.csv')

