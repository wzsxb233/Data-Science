#IST687 Homework 8 ¨C Copyright 2020 Jeff Saltz and Jeff Stanton 
# Intro to data science, Standard Homework Heading
#
# Student name:Yicun Deng
# Homework number: 9
# Date due: 10/25/20 
#
# Attribution statement: (choose only one)
# 1. I did this homework by myself, with help from the book and the professor

load("titanic.raw.Rdata")#load titanic.raw into R, tricky part is, you need to have.Rdata hahaha
badboat<-titanic.raw#copy the titanic.raw into badboat
#A
View(titanic.raw)#View the titanic.raw
str(badboat)#view badboat's structure, it is not a sparse matrix

#B
suvivingRate<-table(badboat$Survived)#711 peple survived, 1490 people died

#C
prop.table(suvivingRate)#68% died, 32% survived, badboat

#D
prop.table(table(badboat$Class))#percentage for class, 1st 0.15, 2nd 0.13, 3rd 0.32, crew 0.4
prop.table(table(badboat$Sex))#percentage for sex,Female 0.21, Male 0.79
prop.table(table(badboat$Age))#percentage for age, Adult 0.95, child 0.05

#E.
prop.table(table(badboat$Sex,badboat$Age))#created contingency table for sex and age, adult male is the
#majority among people in titanic

#F
install.packages("arules")#install arules package
install.packages("arulesViz")#install aruelsViz package
library(arules)#put arule into library
library(arulesViz)#put aruleViz into library

#G
badboatX<-as(badboat,"transactions")#change the dataframe to transaction matrix

#H
inspect(badboatX)#inspect badboatX
itemFrequency(badboatX)#see the frequency/percentage of each categories
itemFrequencyPlot(badboatX)#create a plot of the frequency, male the most frquent

#I
#badBoat views each datapoint as an object with different perspect, badboatX views each datapoint as 
#transaction and view all persepct as tag

#J
surviveRule<-apriori(badboatX,#generating rules
        parameter=list(supp=0.005,conf=0.5),#supp=0.005, conf=0.5
        control=list(verbose=F),#verbose set to off
        appearance=list(default="lhs",rhs=("Survived=Yes")))#predicting survive=Yes, 14 rules generated

#K
inspect(surviveRule)#inspect surviveRule, child, female and people in first class can predict survive

#L
#I would like to be a first class female if I got to choose, because of the first class female has
#the greatest confidence value among 14 rules, and adults female has the greatest support rate too.
#So being a female is the key to survive in Titanic, if you look at the percentage of gender
#you would find that, in the last moment, people in titanic is letting females and children survive
#first, this is very admirable and they have my greatest respect