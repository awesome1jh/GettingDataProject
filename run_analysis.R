# Project for getting and cleaning data
# J. Hartsfield 10/23/2015

library(dplyr)
# read in the data
# create data directory if it does not exist
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile="./data/temp.zip") # download file
unzip("./data/temp.zip", exdir = "./data") # unzip file
# read tables into R
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
X_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
Y_test <- read.table("./data/UCI HAR Dataset/test/Y_test.txt")
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
X_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
Y_train <- read.table("./data/UCI HAR Dataset/train/Y_train.txt")
features <- read.table("./data/UCI HAR Dataset/features.txt")
activities <- read.table("./data/UCI HAR Dataset/activity_labels.txt")

# combine into one large table
Col1 <- rbind(subject_test,subject_train)
Col2 <- rbind(Y_test,Y_train)
dm <- cbind(Col1, Col2)
Col3 <- rbind(X_test, X_train)
dm <- cbind(dm, Col3)

# make a vector out of feature names and set as column names
M <- as.matrix(features)
M2 <- M[,2]
CN <- c("Subject","ActivityLabel",M2)
colnames(dm) <- CN

# keep only columns for subject number, activity label, and those for mean and std.
keepind <- grepl("mean()", CN)
keepind <- keepind & ! grepl("meanFreq()",CN) # exclude meanFreq
keepind2 <- grepl("std()", CN)
keepind <- keepind | keepind2
keepind[1:2] <- TRUE # keep columns for subject and activity label
dm <- dm[,keepind]
# order the data by Subject and ActivityLabel
# dmord <- arrange(dm,Subject,ActivityLabel)

# replace ActivityLabel numbers with corresponding activity
for(i in 1:length(activities$V1)){
      dm$ActivityLabel <- gsub(activities$V1[i],activities$V2[i],dm$ActivityLabel)
}

# create an array with the average of each activity for each subject

df <- as.data.frame(dm)
df <- df %>% group_by(Subject,ActivityLabel) %>% summarise_each(funs(mean))
dm2 <- as.matrix(df)
write.table(dm2, file="run_analysis_output.txt", row.names = FALSE)

