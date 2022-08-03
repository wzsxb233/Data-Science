#IST687 Lab10 ¨C Copyright 2020 Jeff Saltz and Jeff Stanton 
# Intro to data science, Standard Homework Heading
#
# Student name:Yicun Deng
# Homework number: 10
# Date due: 10/29/20 
#
# Attribution statement: (choose only one)
# 1. I did this homework by myself, with help from the book and the professor


#1
install.packages("caret")#install caret package
install.packages("kernlab")#install kernlab package
install.packages("e1071")#install e1071 package
library(caret)#put caret into library
library(kernlab)#put kernlab into library
library(e1071)#put e1071 into library
data("GermanCredit")#gain the german credit dataset
subCredit <- GermanCredit[,1:10]#gain a subset of german credit for usage
str(subCredit)#see the str of subCredit, this dataset consist of credit duration, amount, Intallmentrate
#residenceduration, age of the creditor, Number of existing credit account, phone number, whether they are
#foreigh worker, class of credit standard.
help(GermanCredit)#talk a look into GermanCredit, this dataset is from Dr. Hans Hofman which basic have 
#variable and related evaluated credit class for the creditor

#2
trainList<-createDataPartition(y=subCredit$Class,p=.40,list=FALSE) #create a trainlist of portion=0.4

#3
dim(trainList)#see the dimension of trainList and making sure it has 400 cases

#4
str(trainList)#trainList is a list of selected index for training data for subCredit, dimnames attribute
#is balanced in the trainList data

#5
trainSet<-subCredit[trainList,]#creating trainSet using trainList
str(trainSet)#look at trainSet's structure, it is successfully generated

#6
testSet<-subCredit[-trainList,]#using trainList to credit a testSet excluding trainSet's data for
#test
str(testSet)#checking the testSet's structure, it is successfully generated

#7
classPlot<-ggplot(testSet,aes(x=Amount,y=Duration,color=Class))+geom_boxplot()+ggtitle("Amount and Duration for credit")
#creating box plot using ggplot2, using Amount and Duration variable from testSet to see the realtionship
#from them to Class
classPlot#View classPlot

#8
svmCredit<- ksvm(Class~.,data=trainSet,kernel="rbfdot",kpar="automatic",C=5, cross=3,prob.model=TRUE)#train a svm
#using variables predicting class of cost=5, cross=3

#9
#the cross validation error is 0.294973, the model is not perfect, but can be functioning

#10
svmPred<-predict(svmCredit,testSet,type="response")#predict the class of testSet using svmCredit
compTable<-data.frame(testSet[,10],svmPred)#create table for comparision


#11
str(svmPred)#view the structure of svmPred, it is a two dimensional data.frame, consisting of index of 
#data and 0 for Good "class" predicting, 1 for "Bad" class predicting
table(compTable)#view the table 139 wrong for Bad, 39 wrong for Good
(140+39)/(381+40)#error rate 42%

#12
diag(table(compTable))#diagnose the confusion matrix, return the error number
sum(140+39)/sum(381+40)#getting the error rate,42%, overall acurracy=421

#13
confusionMatrix(table(compTable))#check if the calculation is correct, the calculation is not
#this function is saying the acurracy number is 0.7017, way better than the calculation stating