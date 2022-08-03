# IST687 - Midterm exam

## Student name: Yicun Deng

## Attribution statement: By submitting this work on Blackboard, you

# attest that you completed this exam without assistance from any living

# person except the instructor.

## Type in your SUID in place of the zeros below.
suid <- 584579909#store my suid into suid

# Then select all of the code in the following block  and run it.

# Do not modify any of the code between the ======== separators

#========================================================

if (suid == 0) {cat("Please update your SUID (above) before running this code.")} else {cat(paste("Lyft/Uber Fare Comparison Study Number:",suid,"\n")); set.seed(suid); grp1id <- paste("Lyft",substr(as.hexmode(suid),1,2),sep="_"); grp2id <- paste("Uber",substr(as.hexmode(suid),1,2),sep="_"); ssize <- floor(runif(n=1,min=100,max=140)); driver <- 1:ssize; base <-round(rnorm(n=ssize,mean=25,sd=5), digits=2);lyft <- round(rowMeans(cbind(base, runif(ssize,min=15,max=35))),digits=2);if ((suid %% 2)==1) {uber <- round(rowMeans(cbind(base, runif(ssize,min=10,max=40))),digits=2) } else { uber <- round(rowMeans(cbind( base + rexp(n=ssize,rate=0.25), rnorm(n=ssize,mean=25,sd=5))),digits=2)}; testDF <- data.frame(driver,lyft,uber);cat(paste("Sample size for this study:",ssize)); t1 <- testDF[,3] + 0.25*rnorm(n=ssize, (mean(testDF[,3])),sd=5);t <-testDF[,2] + 1.1*rnorm(n=ssize,mean(testDF[,2]),sd=20); t[ t < 0] <- 0;t1[ t1 < 0] <- 0;testDF <- data.frame(driver,lyft,uber, t, t1);if ((suid %% 2)==1) {states <- c("New York", "Texas", "Texas", "Florida")}else {states <- c("California", "California","Texas", "Georgia") }; testDF$tmp1 <- sample(states, nrow(testDF), replace=TRUE); testDF$tmp2 <- testDF$tmp1;rm(states);names(testDF)[2]<-grp1id; names(testDF)[3]<-grp2id;names(testDF)[5]<-paste0(grp2id, "_distance");names(testDF)[4]<-paste0(grp1id, "_distance");names(testDF)[7]<-paste0(grp2id, "_state");names(testDF)[6]<-paste0(grp1id, "_state"); rm(base); rm(lyft); rm(uber); rm(ssize); rm(grp1id); rm(grp2id); rm(driver); rm(t); rm(t1)}

#========================================================


str(testDF) # Your data set is called testDF; it has three variables


# Add your code below here. Make sure to run the code above first.
library(ggplot2)#put ggplot2 into library for usage
install.packages("arules")#install arules package
install.packages("arulesViz")#install aruelsViz package
library(arules)#put arule into library
library(arulesViz)#put aruleViz into library
install.packages("ggplot2")#intall ggplot2
install.packages("maps")#install map 
install.packages("ggmap")#install ggmap
install.packages("mapproj")#install mapproj
install.packages("readr")#install readr

library(ggplot2); library(maps); library(ggmap); library(mapproj)#library ggplot2, maps,ggmaps,mapproj
library(readr)#put readr into library

#1
mean(testDF$Lyft_22)#get the mean fare of lyft#25.25392
mean(testDF$Uber_22)#get the mean fare of Uber#24.68608
uberRate<-mean(testDF$Uber_22)/mean(testDF$Uber_22_distance)#average uber fare per distance, 0.7973
lyftRate<-mean(testDF$Lyft_22)/mean(testDF$Lyft_22_distance)#average lyft fare per distance, 0.45209
#fare per distance, lyft win, average fare, uber win, but I would take fare per distance more valid

#2
mean(testDF$Lyft_22_distance)#getting the average distance of lyft trip(55.85949)
mean(testDF$Uber_22_distance)#getting the average distance of uber trip(30.95948)
#lyft typically have longer trip than uber

#3
hist(testDF$Lyft_22_distance)#generating a histogram to analyze lyft's trip, it is a norm distribution
#that centered at 60
hist(testDF$Uber_22_distance)#generating a histogram to analyze uber's trip, it is a norm distribution
#that centered around 30

#4
(25.25392-24.68608)/24.68608#calculating the percentage difference of the lyft fare and uber fare,2.3%
#if ignoring the distance of travelling, lyft is more expansive, by 2.3%

#5
testDF$faredifference<-testDF$Lyft_22-testDF$Uber_22#generating new variable that represent
#the fare difference of lyft and uber per observation
hist(testDF$faredifference)#it is a normal distribution centered a bit above 0.

#6
uberlyft<-ggplot(testDF,aes(x=driver))+geom_point(aes(y=Uber_22),color="blue")#uber fare for blue
uberlyft<-uberlyft+geom_point(aes(y=Lyft_22),color="red")#add lyft fare for red
uberlyft<-uberlyft+ylab("Uber and Lyft fare")#modify y label
uberlyft<-uberlyft+ggtitle("blue for uber, red for lyft")#add title
uberlyft#display uberlyft

#7
lyftLinear<-lm(formula=Lyft_22~Lyft_22_distance,data=testDF)#generating lyft model
uberlinear<-lm(formula=Uber_22~Uber_22_distance,data=testDF)#generating uber model

#8
plot(testDF$Uber_22,testDF$Uber_22_distance)#PLOT for uber
abline(uberlinear)#draw the line
plot(testDF$Lyft_22,testDF$Lyft_22_distance)#PLOT for lyft
abline(lyftLinear)#draw the line
summary(uberlinear)#sum uber model
summary(lyftLinear)#sum lyft model
#both of them are not working well, if I have to choose one, I would choose the uber one because
#of the high adjusted R squared.

#9

us<-map_data("state")#get state map data into us
testDF$Lyft_22_state<-tolower(testDF$Lyft_22_state)#lowercase lyft
testDF$Uber_22_state<-tolower(testDF$Uber_22_state)#lowercase uber
ubermap<-ggplot(testDF, aes(map_id=Uber_22_state))#starting the plot
ubermap<-ubermap+geom_map(map=us, fill="white",color="black")#creating map
ubermap<-ubermap+geom_map(map=us, aes(fill=Uber_22/Uber_22_distance))#add the uber fare
ubermap<-ubermap+expand_limits(x=us$long,y=us$lat)#establish the x and y of map
ubermap<-ubermap+coord_map()+ggtitle("uber")#rescale and adding title
ubermap#view the map

lyftmap<-ggplot(testDF, aes(map_id=Lyft_22_state))#starting the plot
lyftmap<-lyftmap+geom_map(map=us, fill="white",color="black")#creating map
lyftmap<-lyftmap+geom_map(map=us, aes(fill=Lyft_22/Lyft_22_distance))#add the lyft fare
lyftmap<-lyftmap+expand_limits(x=us$long,y=us$lat)#establish the x and y of map
lyftmap<-lyftmap+coord_map()+ggtitle("lyft")#rescale and adding title
lyftmap#view the map

#I don't had the time to merg state name into testDF and create empty set for draw the state
#that does not have data from. Due to time limits

