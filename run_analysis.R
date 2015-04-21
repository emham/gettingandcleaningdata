setwd("/Users/Emily/Documents/Coursera/Getting and Cleaning Data/")

widths <- rep(c(-1, 15), times=561)
    #reads test dataset into a dataframe:
test <- read.fwf("./UCI HAR Dataset/test/X_test.txt", widths)
    #reads train dataset into a dataframe:
train <- read.fwf("./UCI HAR Dataset/train/X_train.txt", widths)
    #merges datasets:
merged <- rbind(test, train)

#extract only mean and stddeviation columns:
library(dplyr)
features_to_select <- read.table("./UCI HAR Dataset//features_to_select.txt", header=F)
cols_to_select <- features_to_select[,1]
merged_filtered <- select(merged, cols_to_select)

#gets 71 variable names and removes leading digits:
col_headers <- gsub("^[0-9]*\\s{1}", "", features_to_select[,2])

#names columns of merged_filtered with variable names:
names(merged_filtered) <- col_headers

#joins test and train subject column
test_subject <- read.table("./UCI HAR Dataset//test//subject_test.txt", header=F)
train_subject <- read.table("./UCI HAR Dataset//train//subject_train.txt", 
                            header=F)
merged_subject <- rbind(test_subject, train_subject)

#joins test and train activity key column
test_activity <- read.table("./UCI HAR Dataset//test//y_test.txt", header=F)
train_activity <- read.table("./UCI HAR Dataset//train//y_train.txt", header=F)
merged_activity <- rbind(test_activity, train_activity)

#makes vector of equivalent activity names
activity_names <- NULL
for(x in merged_activity[,1]){
    if(x==1){
        activity_names <- c(activity_names, "WALKING")
    } else if(x==2){
        activity_names <-c(activity_names, "WALKING_UPSTAIRS")
    } else if(x==3){
        activity_names <-c(activity_names, "WALKING_DOWNSTAIRS")
    } else if(x==4){
        activity_names <-c(activity_names, "SITTING")
    } else if(x==5){
        activity_names <-c(activity_names, "STANDING")
    } else if(x==6){
        activity_names <-c(activity_names, "LAYING")
    }
    activity_names <- as.vector(activity_names)
}
#binds subject, activity, merged_filtered
merged_filtered <- cbind(merged_subject[,1], activity_names, merged_filtered)
names(merged_filtered)[1:2] <- c("Subject", "Activity")

#gets mean of each variable for each subject and activity
tidy <- merged_filtered %>%
    group_by(Subject, Activity) %>%
    summarise_each(funs(mean))

#writes tidy to a txt file
write.table(tidy, "HamiltonE_CourseProject_TidyData.txt", row.names=FALSE, sep="\t")