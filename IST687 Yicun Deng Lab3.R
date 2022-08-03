#Week 3 ¨C First Breakout: Sorting Data and Ordering a Data Frame		

#
# Student name:Yicun Deng
# Homework number: Lab3
# Date due:  9/10/20
#
# Attribution statement: (choose only one)
# 3. I did this homework with help from my breakout room 3 partner but did not cut and paste any code
#Instructions: In your group, introduce yourselves to each other again and then solve each of the problems below: I may ask you the names of the people in your group! All students in the group should be prepared to report the whole class at the conclusion of the breakout group. All students should run the necessary code on their own instances of R-Studio.

#Instructions: Be prepared to report the whole class at the conclusion of the breakout group. Run the necessary code on your own instance of R-Studio. Save the code: It will be useful on your homework!
  
  
#1.	Get an explanation of the contents of the state.x77 data set: help("state.x77")
help("state.x77")
#2.	Make a copy of the built-in state.x77 data set, store in a variable names ¡®dfStates77¡¯
dfStates77 <- data.frame(state.x77)
#3.	Summarize the variables in your copy of the data set - using the summary() function
summary(dfStates77)
#4.	Calculate the total population of the U.S. by adding together the populations of each of the individual states in dfStates77.   Store the result in a new variable called totalPop77.  
totalPop77 <- sum(dfStates77$Population)
#5.	Use R code to read a CSV data file directly from the web. Store the dataset into a new dataframe, called dfStates17. The URL is: 
library(readr)
library(curl)
weburl <- "https://raw.githubusercontent.com/CivilServiceUSA/us-states/master/data/states.csv"
dfStates17 <- data.frame(read_csv(url(weburl)))
#Note: Use the function read_csv( ) to read in the data. You will need to install (install.packages(¡°readr¡±)) and  library(readr) before you can run the read_csv( ) function.  You may also need to install and library the ¡°curl¡± package.

#6.	Summarize the variables in your new data set, using the summary command.
summary(dfStates17)
#7.	The data you now have stored in dfStates17 were collected in 2017. Calculate the total 2017 population of the U.S. in dfStates17 by adding together the populations of each of the individual states. Store the result in a new variable called totalPop17.  
totalPop17 <- sum(dfStates17$population)
#8.	Create and interpret a ratio of totalPop77 to totalPop17. Check to ensure that the result makes sense!
ratioPop77to17 <- totalPop77*1000/totalPop17
  
  #End of first breakout


#Create a function that, given population and area, calculates population density by dividing a population value by an area value. Here is the core of the function:
  
  popDensity <- function (pop, area) {
    # Add your code below here:
    popDens <- pop/area
    # Next, divide pop by area and store the result in a
    # variable called popDens
    
    return(popDens) # This provides the function¡¯s output
  }

#9.	After you finish your function, make sure to run all of the lines of code in it so that the function becomes known to R.

#10.	Make a fresh copy of state.x77 like this: dfStates77 <- data.frame(state.x77)
newdfStates77 <- data.frame(state.x77)
#11.	Store the population vector in a variable called tempPop. Adjust the tempPop as needed (based on your analysis at the end of the first breakout)
tempPop <- newdfStates77$Population
#12.	Store the Area vector in a variable, called tempArea (similar code to step #11)
tempArea <- newdfStates77$Area                                                          
                                                          #13.	Now use tempPop and tempArea to call your function:
                                                            popDensity(tempPop, tempArea)
                                                          
                                                          #14.	Store the results from the previous task in a column in the dfStates77 dataframe, name the column popDensity.
                                                          dfStates77$popDensity <-popDensity(tempPop, tempArea)
                                                          #15.	Use which.max( ) and which.min( ) to reveal which state is the most densely populated and which is the least densely populated. Make sure that you understand the number that is revealed as well as the name of the state.
                                                          dfStates77[which.max(dfStates77$popDensity),]#New Jersey, not surprising though
                                                          dfStates77[which.min(dfStates77$popDensity),]#Alaska, not surprising too
                                                          