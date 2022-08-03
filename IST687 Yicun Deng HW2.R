################################################
# Intro to data science, Standard Homework Heading
#
# Student name:Yicun Deng
# Homework number: 2
# Date due: 9/6/20 
#
# Attribution statement: (choose only one)
# 1. I did this homework by myself, with help from the book and the professor



#getting the dataset ready
myCars	<- mtcars #	Copy	into	new	data	frame
summary(myCars) #	Summarize	data	to	the	console
View(myCars) #	In	R-Studio,	shows	the	data	in	the	upper	left

#Step	1:	Explore	mpg	(mpg	stands	for	¡°miles	per	gallon¡±)		

#A. What	is	the	mean	mpg?	Use	mean()	or	summary()
mean(myCars$mpg)#mean mpg 20.09062

#B. What	is	the	value	of	the	highest	mpg?	Use	max()	or	summary()
max(myCars$mpg)#max mpg 33.9

#C. What	is	the	value	of	the	lowest	mpg?	Use	min()	or	summary()
min(myCars$mpg)#min mpg 10.4

#D. Create	a	sorted	dataframe based	on	mpg	and	store	it	in	mtCarsSorted;	Use	order(	)
mtCarsSorted<-myCars[order(-myCars$mpg), ]

#Step	2: Which	car	has	the	highest HP (hp	stands	for	¡°horsepower¡±)

#E. Write	a	comment:	Is	higher	or	lower	HP	best?
#Higher horse power better because it gives you more fun while driving(but high hp doesn't equal to fast')

#F. Which	car	has	the	highest	hp?	Use	which.max(	)
myCars[which.max(myCars$hp),]
#Maserati Bora has the highest horse power

#G. Which	car	has	the	lowest hp? Use	which.min(	)
myCars[which.min(myCars$hp),]
#Honda Civic has the lowest horse power

#Step	3:	Calculate	a combination	of	mpg	and	hp

#H. Run	scaledMPG	<- scale(myCars$mpg,	center=0,	scale=T)
scaledMPG	<- scale(myCars$mpg,	center=0,	scale=T)
scaledMPG

#I. Write	a	comment	that	explains	what	that	command	accomplishes.
#it basically srink the gap between values by values'rms

#J. Copy	that	command	and	modify	it	to	create	a	new,	scaled	version	of	myCars$hp.
scaledHP <- scale(myCars$mpg, center=0, scale=T)

#K. Combine	the	two	scaled	measurements	by	adding them.	Explain	in	a	comment	how	
#and	why	this	works.
myCars$scaledSum<- scaledMPG+scaledHP
#it combine the comparision of each objects'hp and mpg variant to rms, basicly express 
#how close they are to the optimal mean object(probably not exist)

#J. Which	car	has the highest combination	of	mpg	and	hp?
myCars[which.max(myCars$scaledSum),]
#Toyota Corolla, there is another more straight forward way but I think this is easier

#K. Create	a	sorted	list	of	cars,	based	on	the	combined	mpg	and	hp
myCarsScaledSorted <- myCars[order(myCars$scaledSum),]
myCarsScaledSorted