#IST687 Homework 7 ¨C Copyright 2020 Jeff Saltz and Jeff Stanton 
# Intro to data science, Standard Homework Heading
#
# Student name:Yicun Deng
# Homework number: 7
# Date due: 10/11/20 
#
# Attribution statement: (choose only one)
# 1. I did this homework by myself, with help from the book and the professor


install.packages("ggplot2")#intall ggplot2
install.packages("maps")#install map 
install.packages("ggmap")#install ggmap
install.packages("mapproj")#install mapproj
install.packages("readr")#install readr


library(ggplot2); library(maps); library(ggmap); library(mapproj)#library ggplot2, maps,ggmaps,mapproj
library(readr)#put readr into library

#Step1.
#A.
mydata<-read_csv("MedianZIP.csv")#read MedianZIP.csv into mydata

#B.
mydata$Mean[is.na(mydata$Mean)]<-mydata$Median[is.na(mydata$Mean)]#substitute the missing mean of mydata
#from median, it is reasonable to do this substitute because of the mean and median is structurely close
#for this dataset hence they can be somewhat switchable 

#C.
View(mydata)#mydata consist of zip representing the location number, median representing the meidan income
#mean representing mean income and pop representing population, the first 2391 looks weird because of
#the slightly smaller scale of data and it is reasonable because of the nature of first 2391 zip code
#must be smaller since they got establised early.

#Step2
#D.
zipcodes<-read_csv("us_zip_code_latitude_and_longitude.csv")#read us_zip_code_latitude_and_longitude.csv into
#zipcodes

#E.
dfNew <- merge(mydata,zipcodes,
               all.x=TRUE,by.x="zip")#merge mydata and zipcodes by zip

#F.
View(dfNew)#dfNew is a dataset that consist of zipcode, median income, mean income, population
#city name, latitude, longitive, time zone, state that zipcode is in, daylight saving time for solar
#energy maybe, and geo location informatino

#Step3
#G.
statezip<-read_csv("stateNames.csv")#read stateName.csv into statezip
dfNew <- merge(dfNew,statezip,
               all.x=TRUE,by.x="state")#merge dfNew and statezip by state
View(dfNew)#view dfNew

#Step4
#H.
us<-map_data("state")#get state map data into us
dfNew$state_name<-tolower(dfNew$name)#create a variable state_name from lower case name of dfNew
mapzip<-ggplot(dfNew, aes(map_id=state_name))#starting the map by ggplot dfNew
mapzip<-mapzip+geom_map(map=us, fill="white", color="black")#fill the map with black and white
mapzip<-mapzip+expand_limits(x=us$long,y=us$lat)#establish the x and y of map
mapzip<-mapzip+geom_point(data=dfNew,aes(x=Longitude,y=Latitude,color=Mean))#plot the point of dfNew
#color by mean of income
mapzip<-mapzip+coord_map()+ggtitle("Mean income Zipcode")#rescaling the map and adding title
mapzip#view the mapzip
#I.
#import point based on
#dfNew's zipcode's long and lati and color based on zipcode's mean, because of that the dfNew contains
#data from Alaska and Puerto Rico

#Step5
#J.
dfNew$Total <- dfNew$Mean*dfNew$Pop#assign a zipcode's total income by multiplying mean and pop and 
#assign it to Total
dfSimple = aggregate(dfNew[c("Pop", "Total")],#sum up dfNew's pop and total and put it into a new dataframe
                     #called dfsimple
                     by = list(dfNew$name),
                     FUN = sum)
dfSimple$name <- dfSimple$Group.1#assign a name value to dfsimple by group of name
dfSimple$Group.1 <- NULL#remove the Group.1 variable since no need of it anymore

#K.
dfSimple$income<-dfSimple$Total/dfSimple$Pop#assign income variable by dividing Total by Pop

#Step6
#L.
dfSimple$state_name<-tolower(dfSimple$name)#create a variable state_name from lower case name of dfSimple
mapzippro<-ggplot(dfSimple, aes(map_id=state_name))#starting the map by ggplot dfSimple
mapzippro<-mapzippro+geom_map(map=us, aes(fill=income))#fill the map with respect to Mean
mapzippro<-mapzippro+expand_limits(x=us$long,y=us$lat)#establish the x and y of map
mapzippro<-mapzippro+coord_map()+ggtitle("income Zipcode")#rescaling the map and adding title
mapzippro#view the mapzippro