**Getting and Cleaning Data Course Project Submission**

This is the final project submission for Johns Hopkins University's Getting and Cleaning Data course.

**Project Parameters**

The purpose of this project is to demonstrate the ability to gather, manipulate and clean data by developing an R script that meets the following requirements:

1. Training and the test data sets are merged to create a single data set.

2. The data set extracts only the mean and standard deviation measurements from a larger measurement data set. 

3. The data set uses descriptive activity names in lieu of the numeric values that are included in the original data set.

4. The data set is labeled with descriptive variable names. 

5. A second, independent tidy data set is created that summarizes the average of each measurement by subject and activity.

**DATA SOURCE**

The source of the data used in this project is the following website:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphone

The source data for this project is located at:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

**Code Description**

The run_analysis.R file submitted for this project accomplishes the following tasks:

1. Loads the packages required to run the script(data.table and dplyr)
2. Loads and unzips the source data
3. Reads each source data file into a separate data frame
4. Combines test and train data frames for subject, activity and feature measurements
5. Names all activity-related data columns
6. Replaces numeric activity values with descriptive activity names
7. Applies feature names to measurement data columns
8. Select desired (i.e. mean and standard deviation) measurement columns
9. Combines subject, activity and measurement data into a single & tidy data set
10. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
