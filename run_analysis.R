####################################################################################
#  Coursera:  Getting and Cleaning Data
#  Date:  20141114
#  Name:  run_analysis.R
#  
#  Purpose:  Programming Project 1, script 3
#   1.  Merges the training and the test sets to create one data set.
#   2.  Extracts only the measurements on the mean and the standard 
#       deviation for each measurement.
#   3.  Uses descriptive activity names to name the activities in the data set
#   4.  Appropirately labels the data set with descriptive variable names.
#   5.  From the data set in step 4, creates a second, independent tidy data set
#       with the average of each variable  for each activity and each subject.
#
####################################################################################

rm(list=ls())
setwd("~/Coursera/Cleaning Data/")

library(data.table)
library(dplyr)

source("data_download.R") # downloading data files from the url

source("data_1stWash.R")  # Combining files to create "test" and "training" data sets

# Load "test" and "train" data sets.

test.data <- fread("test.csv")    # csv file added extra column
test.data[[1]] <- NULL            # removing extra column

train.data <- fread("train.csv")  # csv file added extra column
train.data[[1]] <- NULL           # removing extra column

###  Step 1:  Combining the "test" and "train" data sets

dataAll <- rbind(test.data, train.data)

rm(test.data, train.data) # removing data.tables from global environment

### End Step 1

### Step 4:  Creating Headers for dataAll

features.label <- fread("~/Coursera/Cleaning Data/UCI HAR Dataset/features.txt")
features <- features.label[[2]]
setnames(dataAll, c("activity", "subject_ID", features))

### End Step 4 

### Step 3:  Using Descriptive Names for Activities

activity.labels <- c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING",
                    "STANDING", "LAYING")

dataAll$activity <- factor(dataAll$activity, levels = c(1:6),
                                 labels = activity.labels)

### End Step 3

### Step 2:  Filtering the data set for mean & std measurements only 

filter <- grep("activity|subject_ID|[Mm]ean|[Ss]td", names(dataAll))

data.filter <- dataAll[, filter, with = FALSE]

### End Step 2

### Step 5: Tidy Data and Conclusion using "dplyr"

# Organize/order the data set
data.filter <- data.filter[order(subject_ID, activity)]

# Group the data.table by subject_ID and activity
by_activity <- group_by(data.filter, subject_ID, activity)

# Summarize the data.table
data.tidy <- by_activity %>% summarise_each(funs(mean))

#  Export "data.tidy"
write.table(data.tidy, file = "~/Coursera/Cleaning Data/Tidy_data.txt", row.names=FALSE)

### End Step 5

### Summary Notes
#  The tidy data set exported, "Tidy_data.txt" is a wide format text file 
#  composed of 180 observations of 88 variables.  Each observation/row 
#  has a subject performing one of the listed activities (ie "WALKING", 
#  "WALKING_UPSTAIRS", ...etc).  The remainder of the 86 variables, 
#  excluding subject_ID and activity, are signal measurements from a 
#  Samsung phone.  These variables are a filtered subset of mean and 
#  standard deviation measurements which in turn were averaged.  Thus,
#  the variables in this data set can be considered the "mean of means"
#  or the "mean of standard deviations" as per the measurement type.
############################################################################
