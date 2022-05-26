# https://r-spatial.org/r/2020/03/17/wkt.html

install.packages("rgdal", repos = 'https://lib.ugent.be/CRAN/')

library(rgdal)
library(RColorBrewer)

url <- 'https://www.cbs.nl/-/media/cbs/dossiers/nederland-regionaal/wijk-en-buurtstatistieken/wijkbuurtkaart_2021_v1.zip'

destination <- 'wijk-en-buurtkaart-2021.zip'

download.file(url, destination)

unzip(destination)

WijkBuurtkaart = readOGR(dsn = "WijkBuurtkaart_2021_v1", 
                         layer = "gemeente_2021_v1")

# glimpse(WijkBuurtkaart)

# Remove water regions
WijkBuurtkaart <- WijkBuurtkaart[WijkBuurtkaart$H2O=='NEE',]

# Columns of interest
df <- WijkBuurtkaart@data[,c('GM_CODE','GM_NAAM','BEV_DICHTH','AANT_INW','AANT_MAN','AANT_VROUW')]

# Manipulate columns
df$BEV_DICHTH = as.numeric(df$BEV_DICHTH)
df$AANT_INW = as.numeric(df$AANT_INW)
df$AANT_MAN = as.numeric(df$AANT_MAN)
df$AANT_VROUW = as.numeric(df$AANT_VROUW)

# aantal mannen vs aantal vrouwen
df$MAN_VROUW = df$AANT_MAN / df$AANT_VROUW
hist(df$MAN_VROUW, breaks = 30)

# meer manen
head(df[order(df$MAN_VROUW, decreasing = TRUE),], 10)

# meer vrouwen
head(df[order(df$MAN_VROUW, decreasing = FALSE),], 10)

# colors per observation
GetColors <- function (x, n_levels = 9, palette = 'Greens') {
  palette_colors <- brewer.pal(9, palette)
  palette_colors <- colorRampPalette(palette_colors)(n_levels)
  classes <- cut(x, n_levels)
  palette_colors[classes]
}

colors = GetColors(df$BEV_DICHTH, 9, 'Greens')
plot(WijkBuurtkaart, border="gray", lwd=0.5, col=colors)

colors = GetColors(df$MAN_VROUW, 9, 'Greens')
plot(WijkBuurtkaart, border="gray", lwd=0.5, col=colors)

colors = GetColors(1/df$MAN_VROUW, 9, 'Greens')
plot(WijkBuurtkaart, border="gray", lwd=0.5, col=colors)
