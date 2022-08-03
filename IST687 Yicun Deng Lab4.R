#IST687 Lab4 ¨C Copyright 2020 Jeff Saltz and Jeff Stanton 
# Intro to data science, Standard Homework Heading
#
# Student name:Yicun Deng
# Homework number: 3
# Date due: 9/17/20 
#
# Attribution statement: (choose only one)
# 1. I did this homework by myself, with help from the book and the professor and classmates
#1,

set.seed(2)#giving random sequence of number starting with 2
sampleSize <- 30#setting the sample size
studentPop <- rnorm(20000,mean=20,sd=3)#creating a vector with rnorm distribution
undergrads <- sample(studentPop,size=sampleSize,replace=TRUE)#get the studentPop sample
grads <- rnorm(sampleSize,mean=25,sd=3)#create a different vector with only 30 samples
if (runif(1)>0.5) { testSample <- grads } else { testSample <- undergrads }#use runif(1) to get a number between 
#1 and 0 and if it is bigger than 0.5, use grads for test sample, otherwise use undergrads
mean(testSample)#mean of test sample

#2.
underSample <- sample(undergrads,size=10,replace=FALSE)

#3.
mean(sample(undergrads,size=10,replace=FALSE))

#4.
replicate(3,mean(sample(undergrads,size=10,replace=FALSE)))
hist(replicate(10000,mean(sample(undergrads,size=10,replace=FALSE))))

#5.
meanset <- replicate(10000,mean(sample(undergrads,size=10,replace=FALSE)))

#6
quantSet <- quantile(meanset, probs=c(0.05,0.95))
View(quantSet)
View(mean(testSample))

#7
if((mean(testSample)< quantSet[1])||(mean(testSample) > quantSet[2])){
  print("mean was exteme")
}else{
  print("mean was not extreme")
}

#8
# it shouldn't be undergrad sample, because the mean is extreme

#9
meanset2 <- replicate(10000,mean(sample(grads,size=10,replace=FALSE)))
quantSet2 <- quantile(meanset2, probs=c(0.05,0.95))
if((mean(testSample)< quantSet2[1])||(mean(testSample)> quantSet2[2])){
  print("mean was exteme")
}else{
  print("mean was not extreme")
}
#testsample should be from grad students set