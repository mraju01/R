# Class:      ALY 6000 - 70435 
# Report:     Module 1 Project
# Professor:  Dr. Dee Chiluiza
# Student:    Maheswar Raju Narasaiah
# Date:       Sep 28, 2022

#Library used

library(tidyverse) 
library(gridExtra)   
library(grid)        
library(DT) 
library(knitr) 
library(modeest)

# Task 1: Create a vector named car_speed.
Speed1 = c(32.48, 33.59, 57.00, 58.45, 58.83, 59.31, 60.28, 62.40, 62.71, 63.39, 64.26, 66.87, 70.26, 70.64, 73.43, 74.91, 76.69, 76.85, 77.07, 77.33) 

# Task 2: Obtain and present the average speed

meanSpeed1 = mean(Speed1)
print(paste("The mean of speed1 is", round(meanSpeed1, 2), "miles per hour"))

# Task 3: Obtain and present the median speed

medianSpeed1 = median(Speed1)
print(paste("The median of speed1 is", round(medianSpeed1, 2), "miles per hour"))

# Task 4: Obtain and present the standard deviation

sdSpeed1 = sd(Speed1)
print(paste("The standard deviation of speed1 is", round(sdSpeed1, 2)))

# Task 5: Obtain and present quantiles

quantile0=quantile(Speed1, probs = c (0))
quantile1=quantile(Speed1, probs = c (0.25))
quantile2=quantile(Speed1, probs = c (0.5))
quantile3=quantile(Speed1, probs = c (0.75))
quantile4=quantile(Speed1, probs = c (1))

print(paste("The 0th quantile, also called the minimum value is ", quantile0))
print(paste("The 25th quantile is",quantile1))
print(paste("The 50th quantile is",quantile2))
print(paste("The 75th quantile is",quantile3))
print(paste("The 100th quantile, also called the maximum value is",quantile4))

# Task 6: Delete values. 

Speed2 = Speed1[! Speed1 %in% c(32.48)]
meanSpeed2 = mean(Speed2)
medianSpeed2 = median(Speed2)
sdSpeed2 = sd(Speed2)

# Task 7: Add values.

Speed3 = c(Speed2,98.21 )
meanSpeed3 = mean(Speed3)
medianSpeed3 = median(Speed3)
sdSpeed3 = sd(Speed3)

# Task 8. Use vectors to store and organize objects

vectorSpeed1 = c(meanSpeed1, medianSpeed1, sdSpeed1)
vectorSpeed2 = c(meanSpeed2, medianSpeed2, sdSpeed2)
vectorSpeed3 = c(meanSpeed3, medianSpeed3, sdSpeed3)

Speed_Table = matrix(c(vectorSpeed1, vectorSpeed2, vectorSpeed3), nrow = 3, byrow = TRUE)

Speed_Table_Rounded = round(Speed_Table, 2)

colnames (Speed_Table_Rounded) = c("Mean", "Median", "StDev")
rownames (Speed_Table_Rounded) = c("Speed1", "Speed2", "Speed3")

# Task 9. Present the values using a table 

# Note: Use R markdown to view the below results
knitr:::kable(Speed_Table,
              align = "c", 
              digits = 2,
              format = "html",
              table.attr = "style='width:40%;'")

# Task 10: Using Speed 3, present all values above 70

Speed3_gt70 = subset(Speed3, Speed3>70)

# Task 11: Sum values that are higher than 70.

SumOfSpeed_gt70 = sum(Speed3_gt70)

# Task 12: Sum values that are lower 70

Speed3_lt70 = subset(Speed3, Speed3<70)
SumOfSpeed_lt70 = sum(Speed3_lt70)

# Task 13. Duplicate the following table using R codes

Jan = c(25000, 15872, 22084)
Feb = c(27432, 19734, 18340)
Mar = c(32684, 23871, 21439)

Revenue_Table = matrix(c(Jan, Feb, Mar), nrow = 3, byrow = TRUE)

colnames (Revenue_Table) = c("Bogota", "Caracas", "Buenos Aires")
rownames (Revenue_Table) = c("January", "February", "March")

# Task 14. Write a summary of your project 1

# After working on this project, Below are skills that I have learned and improved upon
# 1. Problem Solving Capability: I have learned to tackle the problem more logically
# 2. Attention to Detail: Paying attention to details is necessary, because one mistake in syntax or logic,  could hamper your results
# 3. Patience: We need a lot a patience, because when I was coding, I have written some code. I was extremely confident in it. I double and triple checked it, and it wasn’t working properly. Then, I have to go back again and view the code from start.
# 4. Debugging Skills: I have improved my debugging skills by trying to find root cause, whenever code was getting struck and wasn't giving expected results.
