---
title: "CodeBook"
author: "J. Hartsfield"
date: "October 23, 2015"
output: html_document
---
## Sources

The data used for this analysis represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A description of the project is available at: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
The data was downloaded from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

## Input files

After downloading and unzipping the files, I read in the following text files: 

- activity_labels 
- features 
- subject_test 
- subject_train 
- X_test
- X_train
- Y_test
- Y_train.

"activity_labels.txt" is a table (6 x 2) with the first colunn consisting of activity numbers and the second column consisting of the activity that corresponds with that activity number.  For instance, the first row of activity_labels.txt is [1, "WALKING"] indicating that activity 1 is walking.

"features.txt"" is a table (561 x 2) with the first column consisting of column numbers of the X_test or X_train file and the second column containing the particular item being measured in that column.  For instance, the first row of features.txt is [1, "tBodyAcc-mean()X"] indicating that the first column of X_test and X_train is a measure of the tBodyAcc mean in the X direction.  There are 561 different items that are being measured.  Thus, features.txt contains 561 rows and each of X_test and X_train contain 561 columns. 

"subject_test.txt" (2947 x 1) and "subject_train.txt" (7352 x 1) contain the subject id for each observation (row) in X_test and X_train respectively.

"X_test.txt" (2947 x 561) and "X_train.txt" (7352 x 561) are tables containing the measurements from test and training subjects respectively. There is one column for each item measured item (feature) and 1 row for each observation. 

"Y_test.txt" (2947 x 1) and "Y_train.txt" (7352 x 1) are vectors containing the activity labels for each observation in X_test and X_train respectively.

## Processing
1. Combine into one data matrix.
Combine the text files into one large table with first column containing the subject id, the second column containing the activity and columns 3-563 containing the measurements.  The first 2947 rows will be the test datasets and the following 7352 rows will be the training datasets.  Set appropriate column names from the features.txt file.
2. Keep only columns for subject number, activity label, and those for mean and std measurements.
3. Replace activity numbers with corresponding activity name.
4. Create an array with the average of each measurement (feature) for each activity for each subject.

## Output file

Write out the resulting data into file called "run_analysis_output.txt".  This file will have one row for each subject / activity combination (180 rows).  Each row will have 68 columns.  The first column will contain the subject id.  The 2nd column will have the activity. The other columns will contain the average of all measurements of that feature for that subject and activity.  For example, the first row, third column will have the average of all "tBodyAcc-mean()X" readings for subject 1 while WALKING.
