#IST687 Lab8 ¨C Copyright 2020 Jeff Saltz and Jeff Stanton 
# Intro to data science, Standard Homework Heading
#
# Student name:Yicun Deng
# Homework number: 8
# Date due: 10/15/20 
#
# Attribution statement: (choose only one)
# 1. I did this homework by myself, with help from the book and the professor

library(ggplot2); library(maps); library(ggmap); library(mapproj)#library ggplot2, maps,ggmaps,mapproj
library(readr)#put readr into library


library("MASS")#put the MASS package into library

ggplot(data=Boston) + aes(x=rm, y=medv) + geom_point() + #creating grapho of Boston, x=rm, y=medv
  geom_smooth(method="lm", se=FALSE)#drawing the linear modle of Boston

#1.
ggplot(data=Boston) + aes(x=crim, y=medv) + geom_point() + #creating graph of Boston, x=crim, y=medv
  geom_smooth(method="lm", se=FALSE)#drawing the linear model of Boston

#2.
lm(medv-rm,data=Boston)#create linear model for medv-rm
pairs(Boston[,1:5])#see which one of the 5 variable has most straight relationship to the medv
summary(Boston)#summary Boston

ggplot(data=Boston, aes(crim))+geom_histogram(binwidth=3, color="white")#create a histogram of crim

#3.
lmOut  <- lm(formula = medv ~ crim, data=Boston)#create linear model for crim-medv
summary(lmOut)#summary the lm model

#4.
lmPlus <- lm(formula = medv ~ crim+rm+dis, data=Boston)#create lm with medv~crim+rm+dis
summary(lmPlus)#summary lmPlus for analystic

#5. 
#the adjusted R_squared is 0.5399, it is not great but it can have some effect of predicting
#the coefficients are: -29.45838 , the significant predicator is crim and rm since it
#has the smallest p value thus most significant on related to medv

#6.
predDF <- data.frame(crim =0.26, dis=3.2, rm=6.2)#create predDF for predict using lmPlus
predDF# view the predDF

#7.
predict(lmPlus, predDF, type="response")#predict the correlated medv from our madeup predict dataframe
#using our lmPlus model, the predicted medv is 22.60355
