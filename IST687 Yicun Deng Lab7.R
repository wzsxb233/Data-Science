#IST687 Lab6 ¨C Copyright 2020 Jeff Saltz and Jeff Stanton 
# Intro to data science, Standard Homework Heading
#
# Student name:Yicun Deng
# Homework number: 7
# Date due: 10/7/20 
#
# Attribution statement: (choose only one)
# 1. I did this homework by myself, with help from the book and the professor

install.packages("ggplot2")#intall ggplot2
install.packages("maps")#install map 
install.packages("ggmap")#install ggmap
install.packages("mapproj")#install mapproj
install.packages("readr")#install readr


#1.
library(ggplot2); library(maps); library(ggmap); library(mapproj)#library ggplot2, maps,ggmaps,mapproj
library(readr)#put readr into library


us <- map_data("state")#get the map_data of state into us
us$state_name <- tolower(us$region)#put all states' name into lower case

map <- ggplot(us, aes(map_id= state_name))#create a ggplot of mapping id of state_name
map <- map + aes(x=long, y=lat, group=group) + 
  geom_polygon() #creating a polygon into map
map <- map + expand_limits(x=us$long, y=us$lat)#defines x and y for the map

map <- map + coord_map() + ggtitle("USA Map")#adding title
map#view the map

#2.
map<-map+geom_polygon(fill="white",color="black")#reverse the color of map
map#view map

#3.
ny_counties <- map_data("county","new york")#getting the information of NewYork countys stored in ny_counties
nymap<-ggplot(ny_counties) + aes(long,lat, group=group) + geom_polygon(fill="white",color="black")#reverse the color like 2.

#4.
head(ny_counties)#get an outline of ny_counties' data looking

#5.
ny_counties <- map_data("county","new york")#getting the information of NewYork countys stored in ny_counties
ggplot(ny_counties) + aes(long,lat, group=group) + geom_polygon(fill="white",color="black")+coord_map(projection = "mercator")#reverse the color like 2.
#make sure the map is looking and working good, it lookings different because of the code adjusted the
#size of each components and eventually rearrange the whole graph. Mercator projection is a standard
#way of map projection

#6.
nyData<-read_csv("nyData.csv")#read nyData csv and stored it into nyData

#7.
mergeNY <- merge(ny_counties,nyData,
                 all.x=TRUE,by.x="subregion",by.y="county")#merge ny_counties and nyData

#8.
head(mergeNY)#view mergeNY

#9.
nymap2<-
  ggplot(mergeNY) + aes(long,lat, group=group) + geom_polygon(fill=mergeNY$pop2000)+coord_map(projection = "mercator")
#creating the map with same function like the nymap but with filling of pop2000

#10
#a.