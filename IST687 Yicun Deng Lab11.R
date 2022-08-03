#IST687 Lab11 ¨C Copyright 2020 Jeff Saltz and Jeff Stanton 
# Intro to data science, Standard Homework Heading
#
# Student name:Yicun Deng
# Homework number: 11
# Date due: 11/6/20 
#
# Attribution statement: (choose only one)
# 1. I did this homework by myself, with help from the book and the professor


install.packages("tm")#intall the tm package
install.packages("wordcloud")#install the wordcloud package
install.packages("quanteda")#install the quanteda package
library(tm)#put tm into library
library(wordcloud)#put wordcloud into library
library(quanteda)#put quanteda into library
library(ggplot2)#put ggplot2 into library
library(readr)#put readr into library



#1
tweetDF<-read_csv("ClimatePosts.csv")#read ClimatePosts into tweetDF
str(tweetDF)#see the structure of tweetDF, I have ID's posting the tweets and tweet that each id are posting
#I don't quite get the meaning of Skeptic meaning though

#2
tweetCorpus <- corpus(tweetDF$Tweet, docnames=tweetDF$ID)#turn tweetDF into corpus for further analyze

#3
tweetDFM <- dfm(tweetCorpus, remove_punct=TRUE, 
                remove=stopwords("english"), )#turn the corpus into document-feature matrix

#4
tweetDFM#view tweetDFM:18 documents,223 features, 93.2% sparse

#5
textplot_wordcloud(tweetDFM, min_count = 1)#wordcloud is visualization of the frequency of related word
#which gives hints of the topic of the DFM, for example, climate is the key word in this DFM with
#the highest frequency

#6
m <- as.matrix(tweetDFM)#put DFM into matrix for further processing
postCounts <- rowSums(m)#counts sum the post number of each user
tweetDF$postCounts <- postCounts#put the data back into tweetDF
boxplot(postCounts ~ Skeptic, data=tweetDF)#generate a boxplot of postCounts versus skeptic

#7
posWords <- scan("positive-words.txt", character(0), sep = "\n")#readin the postivie list
negWords <- scan("negative-words.txt", character(0), sep = "\n")#readin the negative list
posWords <- posWords[-1:-34]#remove the first 34 lines of posWords
negWords <- negWords[-1:-34]#remove the first 34 lines of negWords

#8
wordCounts <- colSums(m)#count the frequency of each total unique words that is in the matrix
wordCounts <- sort(wordCounts, decreasing=TRUE)#sort the words by its frequency

#9
str(wordCounts)#see the structure of wordCounts
head(wordCounts)#see the head of wordCounts

#10
matchedP <- match(names(wordCounts), posWords, nomatch = 0)#match the words that match with posWords


#11
str(matchedP)#see the structure of matchedP
head(matchedP)#see the structure of matchedP
pCounts<-wordCounts[which(matchedP!=0)]#extract the matched words
length(pCounts)#see total number of matched postive words, 12

#12
matchedN <- match(names(wordCounts), negWords, nomatch = 0)#match the words that match with negWords
str(matchedN)#see the structure of matchedP
head(matchedN)#see the structure of matchedP
nCounts<-wordCounts[which(matchedN!=0)]#extract the matched words
length(nCounts)#see total number of matched negative words, 17


