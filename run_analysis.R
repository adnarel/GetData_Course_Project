## Getting and Cleaning Data
## getdata-006
## Course Project


## Preparation steps before running R script:
##
## 1. Unzip the UCI HAR Dataset
## 2. Change working directory to unzipped folder "UCI HAR Dataset"
##


## 3 Files for analysis in the "train" folder
##
## "X_train.txt": 7352 rows, each row is a 561 element vector.
##               These 561 elements are described in "features.txt"
##
## "y_train.txt": 7352 rows, each row is the activity label 
##             ("activity_labels.txt") for the corresponding row 
##              in "X_train.txt"
##
## "subject_train.txt": 7352 rows, each row is the subject number (1-30) 
##                    for the corresponding row in "X_train.txt"
##

## read in training dataset files

train_features <- read.table("train/X_train.txt")
train_activity <- read.table("train/y_train.txt")
train_subject  <- read.table("train/subject_train.txt")


## 3 Files for analysis in the "test" folder
##
## "X_test.txt": 2947 rows, each row is a 561 element vector
##               these 561 elements are described in "features.txt"
##
## "y_test.txt": 2947 rows, each row is the activity label 
##             ("activity_labels.txt") for the corresponding row in 
##              "X_test.txt"
##
## "subject_test.txt": 2947 rows, each row is the subject number (1-30) 
##                    for the corresponding row in "X_test.txt"
##

## read in test dataset files

test_features <- read.table("test/X_test.txt")
test_activity <- read.table("test/y_test.txt")
test_subject  <- read.table("test/subject_test.txt")


## read in activity labels and features into datasets

activity_labels <- read.table("activity_labels.txt")
       features <- read.table("features.txt")


## assign labels to data frames

names(features) <- c("number", "feature name")

names(activity_labels) <- c("activity code", "activity name")


## Part 1
##
## Merge the training and the test sets
## for features, activities, and subjects

merged_features <- rbind(train_features,test_features)

merged_activity <- rbind(train_activity,test_activity)

merged_subject <- rbind(train_subject,test_subject)


## assign labels to three merged data sets

names(merged_features) <- features[,2]

names(merged_activity) <- "activity code"

names(merged_subject) <- "subject"


## Merge the three merged datasets together into one dataset

merged_all <- cbind(merged_subject, merged_activity, merged_features)


## Part 2
##
## Extract the mean and standard deviation for each measurement


## Extract the columns in the merged dataset that have "mean()"
## or "std()" in their column name

subset_columns <- grep("mean()|std()",names(merged_all))

merged_subset <- merged_all[,c(1,2,subset_columns)]


## Part 3
## Assign descriptive activity names to the activity codes in the
## merged dataset

merged_subset$activity_name <- sapply(merged_subset[,2],function(x) 
               activity_labels[,2][activity_labels[,1] %in% x])



## Part 4
##
## Create a second, independent "tidy" data set 
## with the average of each variable 
## for each activity and each subject.


merged_subset_averages <- 
aggregate(merged_subset[,-c(1,2,82)],
          by=list(merged_subset$activity_name,
          merged_subset$subject),
          FUN=mean)
          
names(merged_subset_averages)[1:2] <- c("activity", "subject")


## Export final "tidy" averaged dataset to file

write.csv(merged_subset_averages, 
          "merged_subset_averages.csv",
          row.names=FALSE)

