# get train data and test data
train.x <- read.table("./train/X_train.txt")
train.y <- read.table("./train/y_train.txt")
train.subject <- read.table("./train/subject_train.txt")
test.x <- read.table("./test/X_test.txt")
test.y <- read.table("./test/y_test.txt")
test.subject <- read.table("./test/subject_test.txt")

# merge data set
trainData <- cbind(train.subject, train.y, train.x)
testData <- cbind(test.subject, test.y, test.x)
fullData <- rbind(trainData, testData)

# extract the mean and standard deviation and assign names to data table
featureName <- read.table("./features.txt", stringsAsFactors = FALSE)[,2]
featureIndex <- grep(("mean\\(\\)|std\\(\\)"), featureName)
finalData <- fullData[, c(1, 2, featureIndex + 2)]
colnames(finalData) <- c("subject", "activity", featureName[featureIndex])

# use the activity names to name the activity in the data set
activityName <- read.table("./activity_labels.txt")
finalData$activity <- factor(finalData$activity, levels = activityName[,1], labels = activityName[,2])

# make the names readable
names(finalData) <- gsub("\\()", "", names(finalData))
names(finalData) <- gsub("^t", "time", names(finalData))
names(finalData) <- gsub("^f", "frequence", names(finalData))
names(finalData) <- gsub("-mean", "Mean", names(finalData))
names(finalData) <- gsub("-std", "Std", names(finalData))

# calculate average of each variable and order the data by subject and by activity
# Finally, produce the tidy data
library(dplyr)
groupData <- finalData %>%
  group_by(subject, activity) %>%
  summarise_each(funs(mean))
write.table(groupData, "./MeanData.txt", row.name
            s = FALSE)
