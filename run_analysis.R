# run_analysis.R
#
# This R script performs the following transformation on the UCI data:
#
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard
#      deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy
#     data set with the average of each variable for each activity
#     and each subject.
#

# IMPORTANT:  Set the working directory to *your* local copy of the data
setwd("/Users/alan/R/tidy_data_in_R_project")

library(dplyr)

# read in the column names for the data
features <- read.delim("UCI HAR Dataset/features.txt", header = FALSE, sep = "")

# read in the activity labels
activity <- read.delim("UCI HAR Dataset/activity_labels.txt", header = FALSE, sep = "")

# read in all test data
test_x <- read.delim("UCI HAR Dataset/test/X_test.txt", header = FALSE, sep = "", col.names = features$V2)
test_y <- read.delim("UCI HAR Dataset/test/y_test.txt", header = FALSE, sep = "")
test_s <- read.delim("UCI HAR Dataset/test/subject_test.txt", header = FALSE, sep = "")

# read in all training data
train_x <- read.delim("UCI HAR Dataset/train/X_train.txt", header = FALSE, sep = "", col.names = features$V2)
train_y <- read.delim("UCI HAR Dataset/train/y_train.txt", header = FALSE, sep = "")
train_s <- read.delim("UCI HAR Dataset/train/subject_train.txt", header = FALSE, sep = "")

# combine into one set of data
x <- rbind(test_x, train_x)
y <- rbind(test_y, train_y)
s <- rbind(test_s, train_s)
dataset <- cbind(s,y,x)

# assign clear column names
colnames(dataset)[1] <- "subject"
colnames(dataset)[2] <- "activity"

# tidy up the other column names
colnames(dataset) <- gsub("[.]", "", colnames(dataset))
colnames(dataset) <- sub("^t", "Time", colnames(dataset))
colnames(dataset) <- sub("^f", "Frequency", colnames(dataset))
colnames(dataset) <- sub("Acc", "Accelerometer", colnames(dataset))
colnames(dataset) <- sub("Gyro", "Gyroscope", colnames(dataset))
colnames(dataset) <- sub("mean", "Mean", colnames(dataset))
colnames(dataset) <- sub("std", "Stdev", colnames(dataset))

# clean up the workspace (and memory) a bit
rm(test_x, test_y, test_s, train_x, train_y, train_s, features, x,y,s)

# de-code the activity to an explicit string
dataset$activity <- activity$V2[dataset$activity]

# create a subset with only the columns which have a mean or standard deviation
cols = grep("subject|activity|[Mm]ean|[Ss]td", colnames(dataset))
datasubset <- select(dataset, cols)
rm(cols)

# split-apply-combine to find the means by subject and activity
meandataset <- datasubset %>% group_by(subject, activity) %>% summarize_each(funs(mean(., na.rm=TRUE)))

# write out the resulting tidy data set to disk
write.table(meandataset, file="mean_dataset.txt", row.name=FALSE)
