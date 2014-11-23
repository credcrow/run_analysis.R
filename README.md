run_analysis.R
==============

Coursera Tidy Data Project

---
title: "README.md"
author: "Cyril C. Redcrow"
date: "November 23, 2014"
output: html_document
---

Coursera:  Getting and Cleaning Data
Project:   Tidy Data Set Preparation
Data Set:  Samsung's Human Activity Recognition Using Smartphones Dataset
Date:      20141114

  
Objectives:  
   1.  Merges the training and the test sets to create one data set.
   2.  Extracts only the measurements on the mean and the standard 
       deviation for each measurement.
   3.  Uses descriptive activity names to name the activities in the data set
   4.  Appropriately labels the data set with descriptive variable names.
   5.  From the data set in step 4, creates a second, independent tidy data set
       with the average of each variable  for each activity and each subject.
       
Tidy Data Scripts:

Three R-scripts were written to meet the Objectives for the creation of a tidy data set from Samsung's Human Activity Recognition Using Smartphones Dataset.

1.  data_downlad.R

    Download and save download date and data files from a given url.
    The files represents data collected from the accelerometers from
    a Samsung Galaxy smartphone.
    https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
    
2.  data_1stWash.R

    Three data elements are stored as separate files in the UCI HAR
    Dataset for both the test and training data sets.  These are the
    "subject_test/train.txt", "y_test/train.txt", and "X_test/train.txt". Once 
    imported, these files will be combined into their respective test and training 
    data table.  These data tables will combine a "subject_ID" and "activity" variable
    with a 561 feature vector.  Once munged, the "test" and "training" sets will
    be exported as ".csv" files. This step will hopefully reduce later computational
    overhead as the data sets are further cleaned, merged, and summarized.

    Note:  Though this script will create a complete "test" set and "training"
    set, these data sets will not have headers nor will will the subject's
    activities be labeled with English readable terms.
    
3.  run_analysis.R

    This script will merge the "test" and "train" data tables.  Then headers for all
    variables will be added to the combined data table.  The observations for the 
    "activity" variable will transformed from a numeric factor to an English readable 
    label.  The combined data set will then be filtered to contain only the "subject_ID",
    "activity", and feature variables of mean or standard deviation measurements (std).
    This reduces the number of feature variables from 561 to 86.  The final step in this 
    script will be to average the feature variables.  The final tidy data set is a wide
    format text file composed of 180 observations of 88 variables.  Each observation/row 
    has a subject performing one of six listed activities (ie "WALKING", "WALKING_UPSTAIRS",
    "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING") followed by feature/measurement
    variables in this data set which can be summarized as the "mean of means"or the "mean
    of the standard deviations" as per the measurement type.


Data Background:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, 'WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.
