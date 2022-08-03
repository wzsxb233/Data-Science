#IST687 Lab6 ¨C Copyright 2020 Jeff Saltz and Jeff Stanton 
# Intro to data science, Standard Homework Heading
#
# Student name:Yicun Deng
# Homework number: 6
# Date due: 10/1/20 
#
# Attribution statement: (choose only one)
# 1. I did this homework by myself, with help from the book and the professor


istall.packages("ggplot2") #intall ggplot package
library(ggplot2) #put the ggplot into our library in order to use it

#Part1
#1
myPlot <- ggplot(economics, aes(x=date))  #assign the x value of plot date
myPlot <- myPlot + geom_line(aes(y=psavert)) #assign the y value of plot psavert
myPlot #view the plot


#2
help(economics) #psavert is personal saving rate


#3
#I estimate that psavert reach max at 1976 and min at 2006, make sense.

#4
economics[which.max(economics$psavert),]#getting the max date,1975-5-01
economics[which.min(economics$psavert),]#getting the min date, 2005-07-01

#5
myPlot <- ggplot(economics, aes(x=date))  #assign the x value of plot date
myPlot <- myPlot + geom_line(aes(y=psavert), color="green") #assign the y value of plot psavert
#color=green 
myPlot# View myPlot, hurt my eyes haha

#6
myPlot<- myPlot+ggtitle("Personal Savings Rate: 1967-2014") #assign the title
myPlot #view myPlot

#part1
#7
myPlot <-  ggplot(economics, aes(x=date))+geom_line(aes(y=psavert),color="green")+geom_line(aes(y=uempmed),color="red") #add the line of uempmed as red line
myPlot #View myPlot

#8
myPlot <- myPlot+ggtitle("Personal Saving Rate and Unemployeed Time: 1967-2014") #add the title to ggplot
myPlot #view myPlot]

#9
myPlot <- myPlot+ylab("psavert and uempmed") #change the y-axis label
myPlot #View myPlot

#10
myPlot2 <- ggplot(economics)+geom_point(aes(x=unemploy,y=psavert,color=uempmed))#creating a point graph with variables 
#uempmed, psavert and unemploy
myPlot2 #View myPlot2

#11
#The higher the unemploy, the higher the uempmed, the lower the psavert afterall, make sense

#12
#Thank you, I did