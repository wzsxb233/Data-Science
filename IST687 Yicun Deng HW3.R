#IST687 Homework 3 ¨C Copyright 2020 Jeff Saltz and Jeff Stanton 
# Intro to data science, Standard Homework Heading
#
# Student name:Yicun Deng
# Homework number: 3
# Date due: 9/13/20 
#
# Attribution statement: (choose only one)
# 1. I did this homework by myself, with help from the book and the professor

#Step 1: Use read_csv( ) to read a CSV file from the web into a data frame:
 # A.	Use R code to read directly from a URL on the web. Store the dataset into a new dataframe, called dfStates. The URL is: 
  #"https://raw.githubusercontent.com/CivilServiceUSA/us-states/master/data/states.csv"
#Hint: use read_csv( ), not read.csv( ). read_csv() is from the readr package, while read,csv() is from the tidyverse package. Check the help to compare them.
library(readr)
library(curl)
dfStates <-data.frame(read_csv(url(  "https://raw.githubusercontent.com/CivilServiceUSA/us-states/master/data/states.csv")))

#Step 2: Create a new data frame that only contains states with Twitter URLs:
#A.	Use View( ), head( ), and tail( ) to examine the dfStates data frame. Add a block comment that briefly describes what you see.
View(dfStates)
head(dfStates)
tail(dfStates)
#dfStates is a dataset of states with state's nickname and population, area, useful url of informations

#B.	Create a variable called noTwitter that has TRUE if a state is missing its Twitter URL:
yesnoTwitter <- function(x){
  result <- c()
  for(val in x$twitter_url){
  if(is.na(val)){
      result <- c(result,TRUE)
    } else{
      result <- c(result,FALSE)
    }
  }
  return(result)
}
dfStates$noTwitter <- yesnoTwitter(dfStates)
View(dfStates)#FALSE for having twitter url, since the variable is noTwitter!

#C.	Use the table( ) command to summarize the contents of noTwitter. Write a comment interpreting what you see.
table(dfStates$noTwitter)#35 states having twitter, make sense.

#D.	Create a new data frame that contains only the states with Twitter URLs (store that dataframe in twitterStates:
twitterStates <- data.frame()
for(x in 1:nrow(dfStates)){
  row <- dfStates[x,]
  if(row$noTwitter==FALSE){
    twitterStates <- rbind(twitterStates, row[,1:19])
  }
}
View(twitterStates)


#E.	Use the dim() command on twitterStates to confirm that the data frame contained 35 observations and 19 columns/variables.
dim(twitterStates)

#Step 3: Calculate the mean for each of the three numeric variables.
#A.	The data frame contains three numeric variables. You can remind yourself of what they are by looking at the output of str(twitterStates). Calculate the mean for each of the numeric variables. 
str(twitterStates)
summary(twitterStates)#mean population is 6532234 mean population rank is 25.57 mean admission_number is 24

#B.	Write a comment, noting the mean population for twitterStates.
# the mean population for twitterStates is 6532234

#C.	Create another data frame containing the 15 states that do not have Twitter URLs. Find out the mean population of those 15 states. Compare that to the answer you recorded for problem H.
notwitterStates <- data.frame()
for(x in 1:nrow(dfStates)){
  row <- dfStates[x,]
  if(row$noTwitter==TRUE){
    notwitterStates <- rbind(notwitterStates, row[,1:19])
  }
}
summary(notwitterStates)#mean population for notwitterStates is 5790280, which is smaller than the mane population of twitterStates

#Step 4:  Extract the Twitter handle from the URL.
#A.	Use the gsub() command to remove the beginning part of the URL from the Twitter URLs. This command should work most of the time:
gsub("https://twitter.com/","", twitterStates$twitter_url)  

#B.	Take a close look at the output from the gsub( ) command in problem J. Explain the cause of the incorrect results in a comment.
#PA put their twitter and facebook address in revert haha, and other mistakes are because mass and georgia missed the 's' in "https", ks use an extra "www."

#C.	Assign the results of the gsub( ) command to a new vector/column in the twitterStates data frame. Note that you do not have to repair the problems that you explained in problem J:
twitterStates$handle <- gsub("https://twitter.com/","", twitterStates$twitter_url)

#Step 5:  Create a function to extract Twitter handles:
  #A.	The following function should work most of the time. Make sure to run this code before trying to test it. That is how you make the new function known to R. Add comments to each line explaining what it does:
getTwitterHandleFromURL <- function(URL) { #creating function
	fixTry1 <- gsub("https://twitter.com/","", URL)#try normal gsub
	fixTry2 <- gsub("http://twitter.com/","", fixTry1)#added dropped 's' gsub
	fixTry3 <- gsub("http://www.twitter.com/","", fixTry2)#added added "www." gsub
	return(fixTry3)#return fixed version
	} #finishing writing function, PA is not fixed though haha

#B.	Run your new function on the Twitter URLs. Make sure to use a comment to explain the cause of any problems that remain unfixed:
  getTwitterHandleFromURL(twitterStates$twitter_url)

#C.	Assign the results of problem B to a vector/column in the twitterStates data frame:
  twitterStates$handle <- getTwitterHandleFromURL(twitterStates$twitter_url)
  
#Expert Mode!!! Write a comment in your code that briefly describes an applied project where you could use the data frames and variables you just created.
  #I can use these variables to follow these states's twitter without hand typing them all, except PA haha.
  

  