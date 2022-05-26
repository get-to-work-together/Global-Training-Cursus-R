# install.packages('carData')

library(carData)

data("Prestige")

View(Prestige)

print(Prestige$income)

Prestige$income_category <- cut(
  Prestige$income, 
  breaks = c(0,10000,20000,30000), 
  labels = c('laag','midden','hoog')
)

# or

attach(Prestige)
income_category <- cut(
  income, 
  breaks = c(0,10000,20000,30000), 
  labels = c('laag','midden','hoog')
)
detach()

# or

with(Prestige,
     income_category <- cut(
       income, 
       breaks = c(0,10000,20000,30000), 
       labels = c('laag','midden','hoog')
     ))

# Prestige$income_category <- cut(
#   Prestige$income, 
#   breaks = c(0, 10000, 20000, 10000000),
#   labels = c('laag','midden','hoog'),


Prestige[, c(3,1,2)]


Prestige[1:10, c('education','income')]


Prestige[Prestige$income > 10000, c('education','income')]


max(Prestige$income)


subset(Prestige, education > 9, select=c("income", "prestige"))

df <- Prestige[which(Prestige$income_category == 'B'),]

write.csv(df, 'output.csv')
