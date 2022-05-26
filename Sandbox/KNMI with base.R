install.packages("httr")

library(httr)

# url <- "https://www.daggegevens.knmi.nl/klimatologie/daggegevens"
# body <- "vars=TEMP&stns=260:279&start=20210101&end=20211231"
# 
# response = POST(url, body = body, encoding = "raw")
# print(response$status_code)
# 
# if (response$status_code == 200) {
#   data <- content(response)
#   print(data)
# } else {
#   print("Post request unsuccesfull")
# }

# Read the data
setwd("~/Global Training/Trainingen/Cursus R")

names <- "STN,YYYYMMDD,DDVEC,FHVEC,   FG,  FHX, FHXH,  FHN, FHNH,  FXX, FXXH,   TG,   TN,  TNH,   TX,  TXH, T10N,T10NH,   SQ,   SP,    Q,   DR,   RH,  RHX, RHXH,   PG,   PX,  PXH,   PN,  PNH,  VVN, VVNH,  VVX, VVXH,   NG,   UG,   UX,  UXH,   UN,  UNH, EV24"
col.names <- unlist(strsplit(names, ","))

n_rows_to_skip = 47

df.260.all <- read.csv("Datasets/etmgeg_260.txt", 
                   skip = n_rows_to_skip, row.names = NULL,
                   col.names = col.names, check.names = FALSE)

df.279.all <- read.csv("Datasets/etmgeg_279.txt", 
                   skip = n_rows_to_skip, row.names = NULL,
                   col.names = col.names, check.names = FALSE)

# Convert YYYYMMDD to dates
df.260.all$dd <- as.Date(as.character(df.260.all$YYYYMMDD), format="%Y%m%d")
df.279.all$dd <- as.Date(as.character(df.279.all$YYYYMMDD), format="%Y%m%d")

# Only select rows and columns of interest
columns.of.interest <- c("dd", "STN", "TG")

df.260 <- df.260.all[df.260.all$dd >= "2020-01-01" & df.260.all$dd <= "2020-12-31", columns.of.interest]
df.260 <- df.260.all[startsWith(as.character(df.260.all$YYYYMMDD), "2020"), columns.of.interest]
df.260 <- df.260.all[df.260.all$dd >= 20200101 & df.260.all$dd <= 20201231, columns.of.interest]
df.260 <- df.260.all[, columns.of.interest]

