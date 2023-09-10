library(tidyverse)
library(caret)#classification and regression by Mx Kuhn
#Simple ML pipeline 
#Split->train->score aka predict->evaluation

View(mtcars)

#subset only data we want
full_df<- mtcars%>%select(mpg,hp,wt,am)

#check NA
full_df%>%complete.cases()%>%mean()#not 1 we find missing value in data frame

#drop NA use drop_na() or replace_na
clean_df<-full_df%>%drop_na()

#1. Split data
set.seed(42)
n<-nrow(clean_df)
train_id<-sample(1:n,size=0.8*n)#add % train if data has bigger size
train_df<-clean_df[train_id,]
test_df<-clean_df[-train_id,]
##data freshness->fast changing data set/behavior















