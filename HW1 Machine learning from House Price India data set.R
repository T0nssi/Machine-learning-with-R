library(tidyverse)
library(caret)
library("httr")
library("readxl")

GET("https://query.data.world/s/i5ncrhm7setp457dtx2ixnvsq53vsd?dws=00000", write_disk(tf <- tempfile(fileext = ".xlsx")))
df <- read_excel(tf)

#Review data
View(df)

#plot histogram for Price data
ggplot(df,aes(x=Price))+geom_histogram()

#check Price should be more zero
df%>%select(Price)%>%filter(Price==0)

#plot histogram for Price data after transform to log
log_price<-log(df$Price)
ggplot(data.frame(log_price),aes(log_price))+geom_histogram()

#create new column
df$log_price<-log(df$Price)

#Clean data set
glimpse(df)


