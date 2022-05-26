
filenamelibrary <- 'Data/Lemonade.csv'
df <- read.csv(filename, sep=',', stringsAsFactors=FALSE)

View(df)

# inspection - EDA exploratory data analysis
head(df)
tail(df)
str(df)
nrow(df)
ncol(df)
dim(df)
colnames(df)
summary(df)

# Convert
df$Day <- as.factor(df$Day)
