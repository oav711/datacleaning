# CodeBook

Dataset: [Human Activity Recognition Using Smartphones](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
-----------


# Raw data
----------

Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

For each record it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
- 'README.txt';
- 'features_info.txt': Shows information about the variables used on the feature vector;
- 'features.txt': List of all features;
- 'activity_labels.txt': Links the class labels with their activity name;
- 'train/X_train.txt': Training set;
- 'train/y_train.txt': Training labels;
- 'test/X_test.txt': Test set;
- 'test/y_test.txt': Test labels.


All data are normalised and the units cancel.


# Processed data
----------------

We added two column to the test set ('test/X_test.txt'): first - 'Subject' - subject label from file 'subject_test.txt' and second - 'Activity' - test activity label from file 'test/y_test.txt', and named this dataset 'TEST'.

We added two column to the train set ('train/X_train.txt'): first - 'Subject' - subject label from file 'subject_train.txt' and second - 'Activity' - train activity label from file 'train/y_train.txt', and named this dataset 'TRAIN'.

Than TRAIN and TEST data sets was merged. Name of merged data set is 'RES'.

We extracted only the measurements on the mean and standard deviation for each measurement (variables such as "fBodyAccMag-mean()" or "fBodyAccJerk-std()-Y" or "tGravityAcc-mean()-Y" and others).
Dimension of RES is 10299 x 68. That is 66 features was selected.

Codes of activity was replased descriptive activity name ftom file 'activity_labels.txt'.
Column names was transformed follows:
- 'mean()' replace 'Mean';
- 'std()' replace 'Std';
- 't' replace 'time';
- 'f' replace 'freq'.

From the RES data set we created a second independent tidy data set named 'RES_AVG' with the average of each variable for each activity and each subject.
Dimension of RES_AVG is 180 x 68. That is 30 subjects, each person performing six activities make 180 rows in data set.
