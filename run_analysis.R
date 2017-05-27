# run_analysis.R
#
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
#
# The purpose of this project is to demonstrate your ability to
# collect, work with, and clean a data set. The goal is to prepare
# tidy data that can be used for later analysis. You will be graded
# by your peers on a series of yes/no questions related to the project.
# You will be required to submit:
#   1) a tidy data set as described below,
#   2) a link to a Github repository with your script for performing the analysis, and
#   3) a code book that describes the variables, the data, and
#       any transformations or work that you performed to clean
#       up the data called CodeBook.md.
# You should also include a README.md in the repo with your scripts.
# This repo explains how all of the scripts work and how they are connected.

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

# find only the columns which have a mean or standard deviation
cols = grep("subject|activity|[Mm]ean|[Ss]td", colnames(dataset))
datasubset <- select(dataset, cols)
rm(cols)

meandataset <- datasubset %>% group_by(subject, activity) %>% summarize_each(funs(mean(., na.rm=TRUE)))

write.table(meandataset, file="mean_dataset.txt", row.name=FALSE)
