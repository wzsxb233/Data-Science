#IST687 Homework 5 ¨C Copyright 2020 Jeff Saltz and Jeff Stanton 
# Intro to data science, Standard Homework Heading
#
# Student name:Yicun Deng
# Homework number: 5
# Date due: 9/27/20 
#
# Attribution statement: (choose only one)
# 1. I did this homework by myself, with help from the book and the professor

#Part1
library(RCurl)#put the RCurl in library 
library(jsonlite)#put the jsonlite in library
library(stringr)#put the stringr in library

dataset	<- getURL("http://opendata.maryland.gov/resource/pdvh-tf2u.json")#store the information
#from the given url in a dataset
df	<- jsonlite::fromJSON(dataset)#specify the fromJSON function from jsonlite and use it
df$day_of_week	<- str_trim(df$day_of_week)#remove head and tail white space of day_of_week

#A
str(df)#get the structure information for df
View(df)#View df


#B
#df is a dataset of roads in state, assuming good usage for maps or navigation app
#1000 rows, each row represent an accident
#18 columns, 
#case_number should be the case number for the road, barrack should be the county name
#, acc_date should be the recorded date, acc_time should be the total recording date, like 2:01 
#should be 2year1month?
#acc_time_code should be shortcut for acc_time, day_ofweek should be the day of week of acc_time
#road should be the name of the road, intersect road should be the intersect road, dist_from_intersect
#should be the distance from intersect, dist_direction should be the direction,city_name should be
#the city name,county_code should be the county code, county_name should be the county name,
#vehicle_count, should be the volumn of traffic, prop_dest represent whether the vehicles going
#the correct direction, injury is whether there are people gets hurt, collision_with_1 should be
#what did the vehicle collided to, collision_with_2, is whether there are other damaged obj in the
#incident

#Part2
#C
FriAci<-df[df$day_of_week=="FRIDAY",]#creating a subset of dataset which contains Friday accident only

#D
summary(FriAci[FriAci$injury=="NO",])#summary the noneinjury case in FriAct dataset, 102

#E
summary(FriAci[FriAci$injury=="YES",])#summary the injury case in FriAct dataset, 49

#F
FriInjAci<-FriAci[FriAci$injury=="YES",]

#G
FriInjAci$vehicle_count<-as.numeric(FriInjAci$vehicle_count)#convert the vehicle_count into num
#for FriInjAci
FriInjVehCoun<-FriInjAci$vehicle_count[!is.na(FriInjAci$vehicle_count)]#kick the na value out
mean(FriInjVehCoun)#calculate the mean of involved vehicle, 2.06383

#H
hist(FriInjVehCoun)#it is a almost normal dist like shape with majority of vehicle number in 2
#make sense cause of most accident should be between 2 vehicles