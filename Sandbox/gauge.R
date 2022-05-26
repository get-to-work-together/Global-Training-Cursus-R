install.packages("plotly")

library(plotly)

fig <- plot_ly(
  domain = list(x = c(0, 1), y = c(0, 1)),
  value = 123,
  title = list(text = "Waardering"),
  type = "indicator",
  mode = "gauge+number") 

fig <- fig %>%
  layout(margin = list(l=20,r=30))

fig
