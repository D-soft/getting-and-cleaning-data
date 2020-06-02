# Purpose
1. Make the data set clean and tidy
2. Calculate the average of each variable for each activity and each subject.

# Data Source
Collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

# Data Used in This Project
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# Data Transformation
1.1 get train data and test data separately
1.2 merge all train data into trainData, merge all test data into testData, then merge trainData and testData into fullData
2 extracts only the measurements on the mean and standard deviation for each measurement and assign names to data table
3 uses descriptive activity names to name the activities in the data set
4 make the variable names readable
5 calculate average of each variable and order the data by subject and by act.sivity

# Variables
train.x: train data set that read from the original data set.
train.y: train data set that read from the original data set.
train.subject: train subject data set who performed the activity, read from original data set.
test.x: test data set that read from the original data set.
test.y: test data set that read from the original data set.
test.subject: test subject data set who performed the activity, read from original data set.
trainData: merged data of train.x, train.y and train.subject.
testData: merged data of test.x, test.y and test.subject.
fullData: merged data of trainData and testData.
featureName: feature data set that read from the original data set.
featureIndex: the index of featureName that contain mean or std
finalData: data set that contain only subject, activity and the features
activityName: label set that read from the original data set.



