#Week 2 ¨C First Breakout: Sorting Data and Ordering a Data Frame		

#
# Student name:Yicun Deng
# Homework number: Lab2
# Date due:  9/03/20
#
# Attribution statement: (choose only one)
# 3. I did this homework with help from my breakout room 3 partner but did not cut and paste any code
#Instructions: In your group, introduce yourselves to each other again and then solve each of the problems below: I may ask you the names of the people in your group! All students in the group should be prepared to report the whole class at the conclusion of the breakout group. All students should run the necessary code on their own instances of R-Studio. 


#1.	Make a copy of the R built-in iris data set like this: myIris <- iris
myIris <- iris

#2.	Get an explanation of the contents of the data set with the help function: help("iris")
help(iris)

#3.	Summarize the variables in your copy of the data set, like this:summary(myIris)
summary(myIris)

#4.	The summary() command provided the mean of each numeric variable. Choose the variable with the highest mean and list its contents to the console. Any variable can be echoed to the console simply by typing its name. Here¡¯s an example that echoes the variable with the lowest mean to the console: myIris$Petal.Width
meanSL <- mean(myIris$Sepal.Length)
meanSW <- mean(myIris$Sepal.Width)
meanPL <- mean(myIris$Petal.Length)
meanPW <- mean(myIris$Petal.Width)
#SL has the biggest mean

#5.	Now repeat the previous command, but this time sort the variable by calling the sort() function and supplying that variable. Remember to choose the variable with the highest mean. 
sort(myIris$Sepal.Length)

#6.	Now repeat the previous command, but instead of sort(), use order(). Remember to choose the variable with the highest mean.  
order(myIris$Sepal.Length)
order(-myIris$Sepal.Length)

#7.	Write a comment in your R code explaining the difference between sort() and order(). Be prepared to explain this difference to the class.
#sort()return the actual data while order() return the index

#8.	Now use the order command to reorder the whole data frame, store the new dataframe in a variable called ¡®sortedDF¡¯
sortedDF <- myIris[order(-myIris$Sepal.Length),]
sortedDF

#9.	Finally, use View() to examine your reordered data frame and be prepared to report on the first few rows
View(sortedDF)

#End breakout 1

#10.	Get an explanation of the scale() command with the help function:
help("scale")


#11.	Run scale(myIris$Sepal.Length, center=0, scale=T) and explain the result in a comment. Make sure that all of the members of your group understand what the comment is saying. I may call on anybody!
scale(myIris$Sepal.Length, center=0, scale=T)
#scale basicly gave you an inspect of how far away is the data input from the center, and if you put scale as true, it is doing a divide from the data to the center

  
#12.	Add a new variable to the myIris data set that contains a scaled version of Sepal.Length, called scaledSL
myIris$scaledSL <-scale(myIris$Sepal.Length, center=0, scale=T)

#13.	Repeat the previous process to add a scaled version of each of the other three numeric variables to your data set. Check your results by running the View() command on the data set.
myIris$scaledSW <-scale(myIris$Sepal.Width, center=0, scale=T)
myIris$scaledPL <-scale(myIris$Petal.Length, center=0, scale=T)
myIris$scaledPW <-scale(myIris$Petal.Width, center=0, scale=T)

#14.	Add together the four new scaled variables (use + and name each variable individually) and store the result in a new variable called myIris$scaledSum. 
myIris$scaledSum <- myIris$scaledSL+myIris$scaledSW+myIris$scaledPL+myIris$scaledPW

#15.	Reorder the myIris data frame based on the values stored in myIris$scaledSum. Run View() on the result to check your work. 
myIris <-myIris[order(myIris$scaledSum),]
View(myIris)


