#IST687 Homework 8 ¨C Copyright 2020 Jeff Saltz and Jeff Stanton 
# Intro to data science, Standard Homework Heading
#
# Student name:Yicun Deng
# Homework number: 8
# Date due: 10/18/20 
#
# Attribution statement: (choose only one)
# 1. I did this homework by myself, with help from the book and the professor

install.packages("psych")#install psych
library(psych)#put the psych in the library
library(ggplot2); library(maps); library(ggmap); library(mapproj)#library ggplot2, maps,ggmaps,mapproj
library(readr)#put readr into library

#A.
examData<-sat.act#store the sat.act into examData
summary(examData)#summary examData which contain gender, education, age, act, sat Verbal, sat Quant

#B.
ggplot(data=examData) + aes(x=age, y=ACT) + geom_point() #creating scatter plot of age-x, ACT-y
ggplot(data=examData) + aes(x=education, y=ACT) + geom_point() #creating scatter plot of education-x, ACT-y
ggplot(data=examData) + aes(x=gender, y=ACT) + geom_point() #creating scatter plot of gender-x, ACT-y


#C.
lmACT<-lm(formula=ACT~gender+education+age,data=examData)#create a linear model of gender, education, age 
#predicating ACT
summary(lmACT)#summary lmACT

#D.
#the adjusted-R for lmACT is 0.02301, this is not great, education has the most coefficient-0.47890, 
#and education is the only statistically significante predicator for lmACT.

#E.
#the lmACT model is statiscally not working due to its poor adjusted R-squared value, education is the only
#statistically significant predicator with 0.47890 coefficient, age is not affect the process of predicating
#while gender is actually a minusing factor of the model. In my opinion, a model of only age and education
#works better

lmACTplus<-lm(formula=ACT~education+age,data=examData)#create a linear model of education, age
summary(lmACTplus)#summary the lmACTplus
#akwardly, it didn't

#F.
predDF <- data.frame(gender=2, education=2, age=20)#create a datapoint for using lmACT to predict the act 
predict(lmACT, predDF, type="response")#predict the correlated act using our model,27.72728

#G.
lmSATQ<-lm(formula=SATQ~gender+education+age,data=examData)#create a linear model of gender, education, age 
#predicating SATQ
summary(lmSATQ)#summary lmSATQ, works better than ACT
lmSATV<-lm(formula=SATV~gender+education+age,data=examData)#create a linear model of gender, education, age 
#predicating SATV
summary(lmSATV)#summary lmSATV, works worse than ACT

#H.
#I had learnt from these three models that education,age, gender might have a more clear relationship
#against quantitive test like SATQ, since the quantitive level of the test is SATQ>ACT>SATV and the
#adjusted R-squared goes the same direction.