#IST687 HW10 ¨C Copyright 2020 Jeff Saltz and Jeff Stanton 
# Intro to data science, Standard Homework Heading
#
# Student name:Yicun Deng
# Homework number: 10
# Date due: 11/1/20 
#
# Attribution statement: (choose only one)
# 1. I did this homework by myself, with help from the book and the professor
install.packages("caret")#install caret package
install.packages("ggplot2")#install ggplot2 package
install.packages("kernlab")#install kernlab package
install.packages("e1071")#install e1071 package
library(caret)#put caret into library
library(kernlab)#put kernlab into library
library(e1071)#put e1071 into library
library(ggplot2)#put ggplot2 into library

#A
data("diamonds")#gain the data from diamonds
force(diamonds)#forcing getting the diamonds data


#B
diaData<-diamonds[(diamonds$cut=="Premium"|diamonds$cut=="Ideal"),]#extracing ideal or premium cut data

#C
diaData$cut<-as.character(diaData$cut)#put the cut variable into char
diaData$cut<-as.factor(diaData$cut)#put the cut variable of diaData into factor
str(diaData)#check the struture of diaData

#D
diaData$clarity<-as.numeric(diaData$clarity)#change the clarity into number
diaData$color<-as.numeric(diaData$color)#change the color into number

#E
str(diaData)#see the diaData's structure
#carat is the weight of the diamonds, cut is whether the cut of diamond is good or very good,
#color is the color of diamonds, clarity is the clarity level of the diamonds, depth and table
#is something that I am not sure but definitely related to diamonds, price is the price and 
#x,y,z is the relative descriptive of the diamonds

#F
trainList<-createDataPartition(y=diaData$cut,p=.60,list=FALSE)#create a trainList consisting of 0.6 
#portion of the data's index
trainSet<-diaData[trainList,]#creating trainSet
testSet<-diaData[-trainList,]#creating testSet

#G
dim(trainSet)#see the dimension of trainSet
dim(testSet)#see the dimension of testSet
#all good

#H
svmDiamond<- ksvm(cut~.,data=trainSet,kernel="rbfdot",kpar="automatic",C=5, cross=3,prob.model=TRUE)#train a svm
#using variables predicting class of cost=5, cross=3

#I
#c is the cost of the model, cross is the cross-validation of the model, the greater the c, the 
#more closer cut from the model, the more cross the more valid the model is.

#J
svmDiamond#run the model and see the contribute, the cross-validation error is reported in the 
#neighbourhood of 0.08

#K
svmPred<-predict(svmDiamond,testSet,type="response")#use the model to predict testSet

#L
str(svmPred)#see the structure of svmPred, it is good
head(svmPred)#see the head elements of svmPred, it is what I want

#M
compTable<-data.frame(testSet[,2],svmPred)#create compTable for testSet
table(compTable)#see the confusionMatrix of pred data

#N
(493+547)/(8127+4869)#calculate the error rate, amazing

#O
confusionMatrix(table(compTable))#using confusionMatrix to calculate the accuracy rate, 0.9194

#P
#base of our trust of the validation of the whole dataset, a separate usage of trainSet and testSet would
#give us best reveal of the model's validation

#Expert Mode
lmDiamonds<-lm(formula=cut~.,data=diaData)#creating linear model using all other variable predicting cut
lmPred<-predict(lmDiamonds,testSet,type="response")#using lm to predict
table(lmPred)
#I am sorry but I really don't know how to use lm()for factor, it is returning warning message to me
