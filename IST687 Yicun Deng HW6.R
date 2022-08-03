#IST687 Homework 5 ¨C Copyright 2020 Jeff Saltz and Jeff Stanton 
# Intro to data science, Standard Homework Heading
#
# Student name:Yicun Deng
# Homework number: 5
# Date due: 9/27/20 
#
# Attribution statement: (choose only one)
# 1. I did this homework by myself, with help from the book and the professor

#Step1
#A
air <- airquality#copy the data airquality into air
install.packages("ggplot2")#install ggplot2
library("ggplot2")#library ggplot2 to use it
#B
View(air)#view the data, the data is measured by days of months, in total of 5 months,153 days

#Step2
#C
air$Ozone[is.na(air$Ozone)]#locate all the na data in air$Ozone, if the data is na, return na

#D
air$Solar.R[is.na(air$Solar.R)]#locate all the na data in air$Solar.R
air$Wind[is.na(air$Wind)]#locate all the na data in air$Wind
air$Temp[is.na(air$Temp)]#locate all the na data in air$Temp

#Step3
#E
install.packages("imputeTS")#install imputeTS package
library(imputeTS)#library imputeTS in order to use it
air$Ozone<-na_interpolation(air$Ozone)#see all the data without na in Ozone,save it back
air$Wind<-na_interpolation(air$Wind)#see all the data without na in Wind,save it back
air$Solar.R<-na_interpolation(air$Solar.R)#see all the data without na in Solar.R,save it back
air$Wind<-na_interpolation(air$Temp)#see all the data without na in Temp, save it back

#F
air$Ozone[is.na(air$Ozone)]#locate all the na data in air$Ozone, if the data is na, return na
air$Solar.R[is.na(air$Solar.R)]#locate all the na data in air$Solar.R
air$Wind[is.na(air$Wind)]#locate all the na data in air$Wind
air$Temp[is.na(air$Temp)]#locate all the na data in air$Temp
#it is all fixed

#Step3
#G
g<-ggplot(air, aes(x=Ozone))+geom_histogram(bins=5, binwidth=20)+ggtitle("Ozone of Airquality")#create a histogram of Ozone
g#View the graph

#H
g2<-ggplot(air, aes(x=Solar.R))+geom_histogram(bins=5, binwidth=20)+ggtitle("Solar.R of Airquality")#create a histogram of Solar.R
g2#View the graph
g3<-ggplot(air, aes(x=Wind))+geom_histogram(bins=5, binwidth=20)+ggtitle("Wind of Airquality")#create a histogram of Wind
g3#View the graph
g4<-ggplot(air, aes(x=Temp))+geom_histogram(bins=5, binwidth=20)+ggtitle("Temp of Airquality")#create a histogram of Temp
g4#View the graph
#I need to adjust the bin and binwidth to make the graph looks right, using information of frequency

#Step4
#I
air$Date	<- as.Date(paste("1973",	airquality$Month,	airquality$Day,	sep="-"))#create a new variable
#in air to discribe the exact date of the data colloected

#J
g5<-ggplot(air, aes(x=Date))+geom_line(aes(y=Ozone),color="yellow")+ggtitle("Ozone of Date")#create line graph of Ozone of Date
g5#view graph

#K
g6<- ggplot(air,aes(x=Date))+geom_line(aes(y=Solar.R),color="blue")#create line graph of Solar.R of Date
g6<- g6+geom_line(aes(y=Wind),color="red")#add Wind line into g6
g6<- g6+geom_line(aes(y=Temp),color="green")#add Temp line into g6
g6<- g6+ggtitle("Solar.R, Wind, Temp of Date")
g6#view graph, i don't know why the graph is only showing n-1 lines I created

#L
g7<-ggplot(air)+geom_point(aes(x=Wind,y=Temp,size=Ozone,color=Ozone))+ggtitle("Wind,Temp, Ozone of Air")#scatter graph
#of x=Wind, y=Temp, color and size= Ozone
g7#View graph

#M
#Temp go up when Wind go up, while the Ozone go up, I get the idea of when wind is up, Ozone is bigger
#But the Temp going up is not making sense, but anyways, postive relationship between Wind and Temp, Ozone
