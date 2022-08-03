#IST687 Lab5 ¨C Copyright 2020 Jeff Saltz and Jeff Stanton 
# Intro to data science, Standard Homework Heading
#
# Student name:Yicun Deng
# Homework number: 5
# Date due: 9/24/20 
#
# Attribution statement: (choose only one)
# 1. I did this homework by myself, with help from the book and the professor and classmates

install.packages("RCurl")#install package RCurl
install.packages("RJSONIO")#install package RJSONIO
install.packages("jsonlite")#install package jsonlite
library("RCurl")#Library package RCurl in order to use its function
library("RJSONIO")#Library package RJSONIO in order to use its function
library("jsonlite")#Library package jsonlite in order to use its function


station_link <- 'https://gbfs.citibikenyc.com/gbfs/en/station_status.json'#store the url
apiOutput <- getURL(station_link) #get the information from url 
apiData <- fromJSON(apiOutput) #access to all these apiOutput for the actual dataset
stationStatus <- apiData$data$stations#store the dataset we are actually using in stationstatus
cols <- c('num_bikes_disabled','num_docks_disabled', 'station_id',  #create a list of column names we need
          'num_ebikes_available', 'num_bikes_available', 'num_docks_available')#list of column names
stationStatus = stationStatus[,cols]#take the columns we need into a new dataframe with same name(cleanse)


#1.
#I saw a bunch of raw data that need to be processed into fromJSON() functins.

#2
#I had did so with all of my code, thank you£¡

#3
str(apiOutput)#apiOutput is all in chr
str(apiData)#it has all data bas been structed into dataset

#4
prettify(apiOutput)#improve the summary status of apiOutput and make it more human readable

#5
View(stationStatus)#view stationstatus, its has three obj, bike, dock, ebike and stationid.
#embedding informations of available bikes, docks, and ebike availiblity, with station id.

#6
hist(stationStatus$num_docks_available)#creating hist of available docks

#7
hist(stationStatus$num_bikes_available)#creating hist of available bikes

#8
avaBikeStation <- stationStatus[stationStatus$num_ebikes_available>=1,]#generating station with more 
#or equal to 1 ebike available
length(avaBikeStation$station_id)#totally 305 stations with at least one ebike available

#9
avaBikeStation <- stationStatus[stationStatus$num_ebikes_available>=1,]#generating station with more 
#or equal to 1 ebike available

#10
mean(avaBikeStation$num_docks_available)#getting the mean of the new dataframe's free dock, 15.2623

#11
mean(stationStatus$num_docks_available)#getting the mean of the total station's free dock,16.38784
#This means that, with at least 1 ebike available, approximate 1 docks would be disabled for the station
#make sense because available ebike takes free dock to store

#12
stationStatus$stationSize <- stationStatus$num_bikes_disabled+stationStatus$num_docks_disabled+stationStatus$num_bikes_available+stationStatus$num_docks_available+stationStatus$num_ebikes_available
#adding up all available and disabled bikes, docks and ebikes together for the total slots

#13
plot(stationStatus$num_docks_available,stationStatus$num_bikes_available)#generate a plot graph of
#x-axis with available docks and y-axis with available bikes