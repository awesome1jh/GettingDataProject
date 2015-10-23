# CourseraGetDataProject
Getting data from zipped file, combining data sets, keeping subset of data, group by and sum for each group.

## Get the data into R and load needed library dplyr

Go to the website, "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" and 
download the file, then unzip the files. Read the files into R using read.table.

## Combine the text files into one large file.

Using rbind and cbind, make one large array with subject, activity, and measurements of test observations
 followed by training observations.  Set appropriate column names from features vector. 

## Keep subset of columns that measure mean and std.

Keep only columns for subject number, activity label, and those for mean and
 std. Find column headings that have "mean" in them and exclude those with "meanFreq". 
 Keep those columns and those with "std".  Put this subset of the orginal data in an array called dm.  
Replace the activity number with the name of the activity.

## Output an array with the average of each measurement for each activity for each subject

Group by subject and activity label, then summarise each using the mean.  Write out the result using write.table.