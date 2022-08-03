#Week 1 ¨C First Breakout		

#Yicun Deng
#IST687
#Lab1

#Instructions: In your group, introduce yourselves to each other again and then solve each of the problems below. All students in the group should be prepared to report the whole class at the conclusion of the breakout group. All students should run the necessary code on their own instances of R-Studio. 

#Each student should run R-Studio on their computer (or via https://rstudio.cloud/). Take turns screen-sharing your R-Studio window such that each student has the opportunity to share their window with the other members of the group. If there is a member of the group who has not yet installed R and R-Studio, take the time to assist that student with downloading and installing these applications. Remember that R should always be installed before R-Studio (if you are not using rstudio.cloud).

#1.Use the command line in R-Studio to add together all of the numbers between 1 and 10 (inclusive). Take note of the result. Remember, every student should type and run the code on their own copy of R-studio.
 myNumbers <- c(1,2,3,4,5,6,7,8,9,10)
 sum(myNumbers)
 
 1+2+3+4+5+6+7+8+9+10
	

#2.	Now create a vector of data that contains the numbers between 1 and 10 (inclusive). Here is a line of code to do that:
  myNumbers <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
  myNumbers

#3.	Now add together all of the numbers that are in the vector myNumbers. There is a built-in function within R that can do this for you in one step: Take a guess as to the name of that function and run it on myNumbers. Check your result against the results of question 1.
#sum
  sum(myNumbers)

#4.	R can do a powerful operation called ¡°vector math¡± in which a calculation runs on every element of a vector. Try vector math on myNumbers by adding 10 to each element of myNumbers, and storing the result in myNewNumbers.  Print out myNewNumbers.
#5.	
    myNewNumbers=myNumbers+10
    myNewNumbers
    

#6.	Efficiently calculate a sum of the numbers between 11 and 20 (inclusive), using techniques from the problems above. Hint: use c(11:20)
 sNewNumbers <- sum(myNewNumbers)
 sNewNumbers
#7.	Calculate a sum of all of the numbers between 1 and 100 (inclusive), using techniques from the problems above.
Num1to100 <- c(1:100)
Num1to100
sum(Num1to100)
#End of breakout 1

#8.	Make sure you have a variable myNumbers, that is a vector of 10 numbers (1,2,3,4,5,6,7,8,9,10)

#9.	Add the following commands to the end of your code file and run each one:
  mean(myNumbers)
#give the mean of myNumbers
median(myNumbers)
#give the median of myNumbers
max(myNumbers)
#give the biggest element of myNumbers
min(myNumbers)
#give the smallest element of myNumbers
length(myNumbers)
#give the numbers of elements of myNumbers


#10.	Add a comment to each of the lines of code in your file explaining what it does. The comment character is ¡°#¡±. 


#11.	Explain the output of the following command:
  myNumbers > 5
#Give true or false on whether the elements in myNumbers bigger than 5 by order.

#12.	Explain what¡¯s in bigNum after executing the following command:
  bigNum <- myNumbers[myNumbers > 5]
#bigNum contains all the elements from myNumbers that is greater than 5


#13.	Whenever you need R to explain what a command does and how it works, use the ? command or the help() command. Add and run these commands:
  ?mean
help("mean")


#14.	The homework asks you to create a conditional statement with if and else. A conditional statement is part of a larger group of specialized commands that control the ¡°flow¡± of a program ¨C what command gets run and when. You can get help on if, else, and other control words. Add and run these commands:
  help("if")
help("Control") 

#Now add and run your first conditional statement:
  if (sum(myNumbers) > 40) print("The sum is greater than 40.")
#give the true or false value of whether myNumbers sum up bigger than 40
