#IST687 Lab9 ¨C Copyright 2020 Jeff Saltz and Jeff Stanton 
# Intro to data science, Standard Homework Heading
#
# Student name:Yicun Deng
# Homework number: 9
# Date due: 10/15/20 
#
# Attribution statement: (choose only one)
# 1. I did this homework by myself, with help from the book and the professor

install.packages("arules")#install arules package
install.packages("arulesViz")#install aruelsViz package
library(arules)#put arule into library
library(arulesViz)#put aruleViz into library

#1
data (Groceries) # Load data into memory
myGroc <- Groceries # Make a copy for safety
summary(myGroc) # What is the structure? the structure is a matrix of layers of information, 
#rows are each transcation, columns are items that is available for purchage
#elements are the transactions of each numbers of items bought 
#each levels represent the subcategory of items.

#2
myGrocIF<-itemFrequency(myGroc)#creating the item frequency called myGrocIF

View(myGrocIF)#view myGrocIF
str(myGrocIF)#see structure of myGrocIF
myGrocIF<-sort(myGrocIF)#sort the myGrocIF based on frequency
head(myGrocIF,10)#see the 10 least frequent item
tail(myGrocIF,10)#see the 10 most frequent item

#3
itemFrequencyPlot(myGroc, topN=20)#create a plot showing the most frequently purchased item
#x-axis is standing for each most frequented item and y-axis is for the frequency of each items showing
#in each transcation, so wholemilk 0.25 is like every 4 purchase, one of them is likely bought wholemilk

#4
ct <- crossTable(myGroc, sort=TRUE)#create crossTable of myGroc
View(ct)#view ct
ct[1:3,1:4]#ct is a crosstable that counts when each of the two items got bought together

#5
rules1 <- apriori(myGroc, #creating a rule set for myGroc, with support value at 0.0008, conf0.55
                  parameter=list(supp=0.0008, conf=0.55), #with lhs predicting bottled beer
                  control=list(verbose=F),#verbose is off
                  appearance=list(default="lhs",rhs=("bottled beer")))
summary(rules1)#summary the rule set

#6.
inspect(rules1)#examining our ruleset, there are 4 rules with, liquor, red is predicating the best

#7
rules2 <- apriori(myGroc, #creating a rule set for myGroc, with support value at 0.0006, conf0.55
                  parameter=list(supp=0.0006, conf=0.55), #with lhs predicting bottled beer
                  control=list(verbose=F),#verbose is off
                  appearance=list(default="lhs",rhs=("bottled beer")))
inspect(rules2)#inspect ruleset 2
#it has showed more rules that is intotal of 6, but the 4 rules we got from last question still looks
#promising among the new rule sets, and to be honest, liquor, wine and beer got bought together makes
#most sense because of the nature that people buying various alcohol for partying.




#8
mtattr<-mtcars[,c(2,8:11)]#getting needed informatin from mtcars into mtattr
mtattr<-data.frame(lapply(mtattr,as.factor))#use lapply and make all data in mtattr as.factor
str(mtattr)#view the mtattr structure
mtattr$mpg<-"Bad"#set default mpg for attr as Bad
View(mtattr)#View mtattr
mtattr$mpg[mtcars$mpg>25]<-"Good"#set car with mpg>25 as good mpg
mtattr$mpg<-as.factor(mtattr$mpg)#make mpg into as.factor
mtmatr<-as(mtattr,"transactions")#changed the dataset to transaction form
str(mtmatr)#view the mtmatr

