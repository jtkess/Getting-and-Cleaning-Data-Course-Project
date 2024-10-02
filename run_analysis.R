#Getting & Cleaning Data Course Project
#
#Justin Kessler
#
#Load packages
#
library(data.table)
library(dplyr)
#
#Load and Unzip Data
#
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#
file <- file.path(getwd(), "getdata_projectfiles_UCI HAR Dataset.zip")
#
download.file(fileurl, file, method = "curl")
#
unzip(zipfile = file,exdir = "./unzipped")
#
#Read Data
#
activities <-read.table("unzipped/UCI HAR Dataset/activity_labels.txt")
#
features <- read.table("unzipped/UCI HAR Dataset/features.txt")
#
subjecttest <- read.table("unzipped/UCI HAR Dataset/test/subject_test.txt")
#
xtest <- read.table("unzipped/UCI HAR Dataset/test/x_test.txt")
#
ytest <- read.table("unzipped/UCI HAR Dataset/test/y_test.txt")
#
subjecttrain <- read.table("unzipped/UCI HAR Dataset/train/subject_train.txt")
#
xtrain <- read.table("unzipped/UCI HAR Dataset/train/x_train.txt")
#
ytrain <- read.table("unzipped/UCI HAR Dataset/train/y_train.txt")
#
#Combine Test and Train Data
#
allsubject <- rbind(subjecttest, subjecttrain)
#
allmeasurement <- rbind(xtest,xtrain)
#
allactivity <- rbind(ytest,ytrain)
#
#Name Activity-Related Columns
#
colnames(allsubject)[1] <- "Subject"
#
colnames(allactivity)[1] <- "Activity"
#
colnames(activities)[1] <- "Code"
#
colnames(activities)[2] <- "Name"
#
#Replace numeric activity values with activity names
#
allactivity$Activity <- activities[allactivity$Activity,2]
#
#Apply feature names to measurement columns
#
colnames(allmeasurement) <- t(features[2])
#
#Select desired (i.e. mean and standard deviation) measurement columns
#
desiredmeasurement <- allmeasurement %>% select(contains("mean"), contains("std"))
#
#Combine subject, activity and measurement data into a single & tidy data set
#
combineddata <- cbind(allsubject, allactivity, desiredmeasurement)
#
#Create a second, independent tidy data set with the average of each variable for each activity and each subject.
#
averageddata <- aggregate(combineddata[,3:81], by = list(Subject = combineddata$Subject, Activity = combineddata$Activity),FUN = mean)
