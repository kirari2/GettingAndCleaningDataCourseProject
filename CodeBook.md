# Code book
This document describes the variables, the data, and any transformations or work performed to clean up the data for the Week 4 project of the Coursera open online 
course: Getting and Cleaning Data.

## Data
The data used in the project comes from the Human Activity Recognition Using Smartphones Data Set, which was built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors. Each subject performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING). Using the smartphone's embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz were  captured. 

A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The dataset can be downloaded from the following link:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

For each record in the dataset it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope.
- A 561-feature vector with time and frequency domain variables.
- Its activity label.
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:

- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

## Variables

- `url` contains the download link of the dataset
- `activity_labels` contains the specific activities, e.g. WALKING
- `features` contains a list of all features
- `train` collects all the training data
- `test` collects all the testing data
- `data` combines the training and testing data, and later being distilled to contain
 only the measurements on the mean and standard deviation
- `tidy_data` contains the final tided dataset as required

## Steps to clean up the data

- Download, unzip, and prepare the data set
- Merge the training and the test data sets to create one data set
- Use descriptive activity names to name the activities in the data set
- Extract only the measurements on the mean and standard deviation for each measurement
- Use descriptive activity names to name the activities in the data set
- Label the data set with descriptive variable names
- Creates a second, independent tidy data set (i.e. `tidy_data`) with the average of each variable for each activity and each subject
