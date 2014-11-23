##############################################################################################
#  Coursera:  Getting and Cleaning Data
#  Date:  20141120
#  Name:  data_1stWash.R
#  
#  Purpose:  Programming Project 1, script 2
#            Convert important data sets from the UCI HAR Dataset into R-objects.
#            The test data and training data sets are composed of 3 elements:
#            1.  The activity the subject is performing.
#            2.  The subject id.
#            3.  A vector of 561 measurements.
#            
#            The three data elements are stored as separate files in the UCI HAR
#            Dataset for both the test and training data sets.  Once imported,
#            These elements will be combined into their respective test and training 
#            data frame.  Once munged, the "test" and "training" sets will be exported
#            as ".csv" files. This step will hopefully reduce later computational overhead
#            as the data sets are further cleaned, merged, and summarized.
#
#            Note:  Though this script will create a complete "test" set and "training"
#            set, these data sets will not have headers nor will will the subject's
#            activities be labeled with English readable terms. 
#
##############################################################################################

rm(list=ls())

setwd("~/Coursera/Cleaning Data/UCI HAR Dataset/")

library(data.table)

##  Part 1 : The "test" data set.

activity.test <- fread("./test/y_test.txt")
subject.test <- fread("./test/subject_test.txt")
vector.test <- read.table("./test/X_test.txt")

test.data <- cbind(activity.test, subject.test, vector.test)

##  End of Part 1

##  Part 2 : The "training" data set.

activity.train <- fread("./train/y_train.txt")
subject.train <- fread("./train/subject_train.txt")
vector.train <- read.table("./train/X_train.txt")

train.data <- cbind(activity.train, subject.train, vector.train) # "activity" is a KEY

##  End of Part 2

## Part 3:  Export test.data and train.data as .csv files

write.csv(test.data, file = "/Users/cyrilredcrow/Coursera/Cleaning Data/test.csv")
write.csv(train.data, file = "/Users/cyrilredcrow/Coursera/Cleaning Data/train.csv")

## End of Part 3
