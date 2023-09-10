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

split_data<-function(df){
  set.seed(42)
  n<-nrow(df)
  train_id<-sample(1:n,size=0.8*n)#add % train if data has bigger size
  train_df<-df[train_id,]
  test_df<-df[-train_id,]
  return(list(train_df,test_df))
}

#2 train model
lm_model<-train(mpg~.,
      data=train_df,
      method="lm")#change model to increase ability of prediction, predict-evaluaton may be reduce

lm_model<-train(mpg~.,
                data=train_df,
                method="ranger")

#3 score
p<-predict(lm_model,newdata = test_df)

#4 evaluation
## mean absolute error
mae<-mean(abs(p-test_df$mpg))
## root mean absolute error
rmae<-sqrt(mean(abs(p-test_df$mpg)**2))

lm_model$finalModel
varImp(lm_model)

# HW create prediction form regression model by dataworld
https://data.world/dataindianset2000/house-price-india











