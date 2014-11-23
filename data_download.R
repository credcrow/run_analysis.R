##############################################################################################
#  Coursera:  Getting and Cleaning Data
#  Date:  20141113
#  Name:  data_download.R
#  
#  Purpose:  Programming Project 1, script 1
#            Download and save download date and data files from a given url.
#            The files represents data collected from the accelerometers from
#            a Samsung Galaxy smartphone.  
#
#  url: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
#
#########################################

rm(list=ls())

setwd("~/Coursera/Cleaning Data/")

library(data.table)

URL <-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

temp <- tempfile()
download.file(URL, temp, method = "curl")


dateDownloaded <- date()

print("Down Load Successful")
print(dateDownloaded)

#  End
