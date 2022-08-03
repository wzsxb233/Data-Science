#IST687 Homework 4 ¨C Copyright 2020 Jeff Saltz and Jeff Stanton 
# Intro to data science, Standard Homework Heading
#
# Student name:Yicun Deng
# Homework number: 4
# Date due: 9/20/20 
#
# Attribution statement: (choose only one)
# 1. I did this homework by myself, with help from the book and the professor

#PartA:
#1.
vectorStats <- function(x){ #creating function called vectorStats
  result <- c(mean(x),median(x))#get the mean and median of input vector
  return(result)#return the result
}

#2
vectorStats(1:10)#test the function by input 1:10

#3
vectorStats <- function(x){#recreating the function vectorStats
  result <- c(mean(x),median(x),max(x),min(x),sd(x))#get the mean median max min sd by order
  return(result)#return the result
}
vectorStats(1:100)#testing the function

#4
vectorStats(1:10)#testing the function


#Part B
#5
myAQdata <- airquality#input airquality as dataframe myAQdata
View(myAQdata)#view the dataframe
?(airquality)#airquality is a dataset describing NewYork's air quality, Ozone is the number of Ozone
#in NewYork, Solar R is the statistic of solar volumn,wind is the volume of wind, temp is the volume
#of temperature, month is the month and day is the day of the month

#6
mySample <- sample(myAQdata$Wind, 5, replace=TRUE)#getting 5 samples out of myAQdata$Wind
#, replacement is TRUE

#7
vectorStats(mySample)#get the stats of this sample vector

#8
replicate(10,vectorStats(sample(myAQdata$Wind, 5, replace=TRUE)))#redo this process of 10 times

#9
#sample function picks random observation from the dataset, and because of I use replace= TRUE, no 
#matter how many times I run it, it would give me different result instead of running out

#10

replicateResult<-replicate(1000,vectorStats(sample(myAQdata$Wind, 5, replace=TRUE)))#repeat the process
#1000 times and saved it into replicateResult

#11
hist(replicateResult[1,])#generate a histogram of the replicateResult's means
#i don't know how make replicateResult into a data.frame with 1000obs and 5 variable..

#12
replicateResult<-replicate(1000,vectorStats(sample(myAQdata$Wind, 50, replace=TRUE)))#repeat the process
#by with 50 samples each time
hist(replicateResult[1,])#generate histogram of the new means vector
#it is getting my hist to a normal distribution that is centered closer
#to the actual mean of the Wind vector9.957516
mean(myAQdata$Wind)#get the actual mean of the whole dataset for comparison
