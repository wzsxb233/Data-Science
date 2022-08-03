#IST687 HW11 ¨C Copyright 2020 Jeff Saltz and Jeff Stanton 
# Intro to data science, Standard Homework Heading
#
# Student name:Yicun Deng
# Homework number: 11
# Date due: 11/8/20 
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



#A
setwd("/Users/gg/Desktop/SU FALL2020/IST687")#se the working direction
charVector <- scan("TheRoadNotTaken.txt", character(0), sep = "\n")#readin the hw material

#B
charCorpus <- corpus(charVector)#put charVector into Corpus
charDFM<-dfm(charCorpus,remove_punct=TRUE,remove=stopwords("english"))#turn the charCorpus into DFM
#removing punctuation and stopwords

#C
textplot_wordcloud(charDFM, min_count=1)#generate a wordcloud of the given DFM

#D
m <- as.matrix(charDFM)#put DFM into matrix for further processing
wordCounts <- colSums(m)#count the frequency of each total unique words that is in the matrix
wordCounts <- sort(wordCounts, decreasing=TRUE)#sort the words by its frequency

#E
str(wordCounts)#see the structure of wordCounts, 58 unique words
head(wordCounts)#see the head of wordCounts, the most frequent word is one which have frequency of 
#3

#F
posWords <- scan("positive-words.txt", character(0), sep = "\n")#readin the postivie list
negWords <- scan("negative-words.txt", character(0), sep = "\n")#readin the negative list
posWords <- posWords[-1:-34]#remove the first 34 lines of posWords
negWords <- negWords[-1:-34]#remove the first 34 lines of negWords

#G
matchedP <- match(names(wordCounts), posWords, nomatch = 0)#match the words that match with posWords
matchedN <- match(names(wordCounts), negWords, nomatch = 0)#match the words that match with negWords

#H
str(matchedP)#see the structure of matchedP
head(matchedP)#see the structure of matchedP
#0 stand for not matched in given list, number such as 200 stand for index in the give list

#I
pWords <- posWords[matchedP]#get the postive words
pWords#view the pWords

#J
pCounts<-wordCounts[which(matchedP!=0)]#extract the matched words
length(pCounts)#see total number of matched postive words, 3

#K
str(matchedN)#see the structure of matchedN
head(matchedN)#see the structure of matchedN
nWords<-negWords[matchedN]#get the words matched
nWords#view the nWords
nCounts<-wordCounts[which(matchedN!=0)]#extract the matched words
length(nCounts)#see total number of matched negative words, 3

#L
#matched postive words are 3, "fair, better and leads"
#matched negative words are 3, "sorry, bent and worn"
#from a numeric perspective, pos rate and neg rate are the same for the given DFM, but
#one thing that I am concerning about is that, the neg list is relatively longer
#so the actual pos rate might be higher in this sense
