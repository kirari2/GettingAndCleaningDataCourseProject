# Getting and Cleaning Data Course Project: run_analysis.R

# 1. Download, unzip, and prepare the data set
getwd()
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, destfile = "./data.zip", method = "curl")
unzip("./data.zip")
list.files()

activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
colnames(activity_labels) <- c("activity_id", "activity")

features <- read.table("./UCI HAR Dataset/features.txt")

subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
colnames(subject_train) <- "subject_id"
colnames(x_train) <- features[, 2]
colnames(y_train) <- "activity_id"

subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
colnames(subject_test) <- "subject_id"
colnames(x_test) <- features[, 2]
colnames(y_test) <- "activity_id"

# 2. Merges the training and the test sets to create one data set
train <- cbind(subject_train, x_train, y_train)
test <- cbind(subject_test, x_test, y_test)
data <- rbind(train, test)

# 3. Uses descriptive activity names to name the activities in the data set
data <- merge(data, activity_labels, by.x = "activity_id", by.y = "activity_id")

# 4. Extracts only the measurements on the mean and standard deviation for each measurement
c_names <- colnames(data)
select = (grepl("activity_id", c_names) | 
          grepl("subject_id", c_names) |
          grepl("mean", c_names) |
          grepl("std", c_names))
data <- data[, select == TRUE]

# 5. Appropriately labels the data set with descriptive variable names
colnames(data) <- gsub("^t", "Time", colnames(data))
colnames(data) <- gsub("^f", "Frequency", colnames(data))
colnames(data) <- gsub("BodyBody", "Body", colnames(data))

# 6. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
library(dplyr)
tidy_data <- data %>% 
    group_by(subject_id, activity_id) %>% 
    summarize(across(everything(), mean, na.rm=TRUE))

# Write the tidy data
write.table(tidy_data, file = "tidy_data.txt", row.name = FALSE)
