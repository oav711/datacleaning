# --- PREPARING ---
library(plyr)
#path to data set
path_project <- ""
if (!file.exists("UCI HAR Dataset")){
    path_project <- "/home/alex/Downloads/Getting and Cleaning Data/CourseProject/datacleaning/"
    if (!file.exists(paste(path_project, "UCI HAR Dataset", sep=""))){
        print("And I didn't find raw data set in in current directory and in your 'path_project' directory!")
        stop("Please, check variable path 'path_project' in this script.")
    }
}
#read the names of features
name_feat <- read.table(paste(path_project, "UCI HAR Dataset/features.txt", sep=""), stringsAsFactors=FALSE)
#column numbers and names of dirty data sets containing mean and standart deviation of measurements
extract_feat <- name_feat[grepl("mean()", name_feat[,2], fixed=TRUE) | grepl("std()", name_feat[,2], fixed=TRUE),]

# --- STEP 1 ---
#read the raw test's data sets
if(!exists("Xtest")) {
    Xtest <- read.table(paste(path_project, "UCI HAR Dataset/test/X_test.txt", sep=""))
}
Ytest <- read.table(paste(path_project, "UCI HAR Dataset/test/y_test.txt", sep=""))
Stest <- read.table(paste(path_project, "UCI HAR Dataset/test/subject_test.txt", sep=""))
#bind the columns of test's datas
TEST <- cbind(Stest, Ytest, Xtest)
#read the raw train's data sets
if(!exists("Xtrain")) {
    Xtrain <- read.table(paste(path_project, "UCI HAR Dataset/train/X_train.txt", sep=""))
}
Ytrain <- read.table(paste(path_project, "UCI HAR Dataset/train/y_train.txt", sep=""))
Strain <- read.table(paste(path_project, "UCI HAR Dataset/train/subject_train.txt", sep=""))
#bind the columns of train's datas
TRAIN <- cbind(Strain, Ytrain, Xtrain)
#bind the rows of TEST and TRAIN data sets
RES <- rbind(TEST, TRAIN)

# --- STEP 2 ---
#extract only columns with mean and std values
RES <- RES[,c(1:2,extract_feat[,1]+2)]

# --- STEP 3 ---
#replace all codes of activities
name_act <- read.table(paste(path_project, "UCI HAR Dataset/activity_labels.txt", sep=""), stringsAsFactors=FALSE)
for (i in 1:6) {RES[,2]<-gsub(i,name_act[i,2],RES[,2])}

# --- STEP 4 ---
#assign names for column
names(RES)[1:2] <- c("Subject", "Activity")
names(RES)[3:ncol(RES)] <- extract_feat[,2]
#transforming column names
names(RES) <- gsub("[()]", "", names(RES))
names(RES) <- gsub("mean", "Mean", names(RES))
names(RES) <- gsub("std", "Std", names(RES))
names(RES) <- gsub("^t", "time", names(RES))
names(RES) <- gsub("^f", "freq", names(RES))

# --- STEP 5 ---
RES_AVG <- ddply(RES, .(Subject, Activity), numcolwise(mean))

# --- FINISH ---
write.table(RES_AVG, paste(path_project, "UCI-HAR-avg.txt", sep=""), row.names=FALSE)

