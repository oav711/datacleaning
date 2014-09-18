[Human Activity Recognition Using Smartphones](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
============


# About dataset
===============

Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING UPSTAIRS, WALKING DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.


Script run_analysis.R processed this [dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and produced dataset contained tidy data set with the average of each variable for each activity and each subject.

For each record it is provided:
- A 66-feature vector with time and frequency domain variables;
- Its activity label;
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
- 'README.md': This file;
- 'CodeBook.md': Shows information about variables;
- 'UCI-HAR-avg.txt': Tidy data set;
- 'run_analysis.R': Script produced tidy data set from raw dataset.


# How it runs
=============

You have to put the script "run_analysis.R" in folder with dataset (folder "UCI HAR Dataset").
Probably you have to set the working directory with function setwd().


# How script works
===================

Script run_analysis.R does following:
1. Merges the training and the test raw datasets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set from file 'activity_labels.txt' raw dataset.
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates tidy data set with the average of each variable for each activity and each subject and saved in file 'UCI-HAR-avg.txt'.

