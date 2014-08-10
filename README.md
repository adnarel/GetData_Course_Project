## Getting and Cleaning Data
### getdata-006
### Course Project
### README file

#### Preparation steps before running R script "run_analysis.R":

##### A. Unzip the UCI HAR Dataset
##### B. Change working directory to unzipped folder "UCI HAR Dataset"


#####The script "run_analysis.R" does the following:

#####1. read in training dataset files

        "X_train.txt"
        "y_train.txt"
      "subject_train.txt"


#####2. read in test dataset files

        "X_test.txt"
        "y_test.txt"
        "subject_test.txt"


#####3. read in activity labels and features into datasets

          "activity_labels.txt"
            "features.txt"


#####4. merge the datasets together into one dataset and assign labels


#####5. Extract the columns that report a mean or a standard deviation for each measurement


#####6. Assign descriptive activity names to the activity codes in the merged dataset


#####7. Find the average of each variable for each activity and each subject, and export the result as a new "tidy" dataset text file named
    "merged_subset_averages.csv"
    

#####8.  "merged_subset_averages.csv" is a comma-delimited text file where each row of data repesents average values of all mean and standard deviation variables for each volunteer subject engaged in a single activity.
    
    The data in this "tidy" dataset is explained in more detail
    in the file "Codebook.md"
