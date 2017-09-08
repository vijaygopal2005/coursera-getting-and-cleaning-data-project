# Getting and Cleaning Data - Course Project

This is the course project for the Getting and Cleaning Data Coursera course. The R script, run_analysis.R, does the following:

1.  Download the dataset if it does not already exist in the working directory
2.  Loads the training and test datasets.
3.  Load the activity and feature datsets.
4.  Sets the variable names for the training, test and acitivty datasets.
5.  Merge the training datasets x_train,y_train and subject_train.
6.  Merge the test datasets x_test,y_test and subject_test.
7.  Merges the training and test dataset.
8.  Extracts only the columns which contains mean or standard deviation variables
9.  Merges the above dataset created to include descriptive acitivty names.
10. Creates a tidy dataset that consists of the average (mean) value of each variable for each subject and activity pair.
11. The end result is shown in the file tidy.txt.
