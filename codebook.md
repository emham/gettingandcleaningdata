Hamilton,E.

#run_analysis.R

##Overview

run_analysis.R was written to perform some basic processing of wearable motion sensor data [from UCI](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). The script reads in the training and test datasets from fwf files and merges them, adds columns for the subject number and activity, extracts only mean and standard deviation variables (complete list below), and returns a new, tidy dataset consisting of only the mean of each variable for each subject and activity combination. 

##The Data
Data was obtained from UCI at this [link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).
The key parts of the provided data are the test and training data sets, which are segretated into separate folders within the HAR Dataset folder. Each of the test and train folders contains: 

*the 'X' file (X_test.txt or X_train.txt): These files contain all the measured data, without subject or activity information. Files are fixed-width, with 561 columns. 

*the 'Y' file (Y_test.txt or Y_train.txt): These files contain a single column with the Activity annotation, using a key 1-6 to represent the six activities (walking, walking upstairs, walking downstairs, standing, sitting or laying.) One row for each observation (same as respective X files.)

*the subject file (subject_test.txt or subject_train.txt): These files contain a single column with the subject number annotation. One row for each observation (same as respective X files).

The major tranformation performed in this script is to merged the test and train sets, annotate each observation with Subject and Activity information, extract relevant columns, and provide an output tidy data table of the mean of each columns for each subject and activity pair. 


##Variables (Data)
###This section refers to “variables” in the sense of observed measurements, or columns in the data frame.

Only mean and standard deviation variables were extracted. meanFreq variables were not
included in the final analysis. In total, 71 variables were extracted from the original 
dataset and two columns were added: one for 'Subject' and one for 'Activity'.

The complete list of variables (73) is:
"Subject"                              
"Activity"                            
"tBodyAcc-mean()-X"                    
"tBodyAcc-mean()-Y"                   
"tBodyAcc-mean()-Z"                    
"tBodyAcc-std()-X"                    
"tBodyAcc-std()-Y"                     
"tBodyAcc-std()-Z"                    
"tGravityAcc-mean()-X"                 
"tGravityAcc-mean()-Y"                
"tGravityAcc-mean()-Z"                 
"tGravityAcc-std()-X"                 
"tGravityAcc-std()-Y"                  
"tGravityAcc-std()-Z"                 
"tBodyAccJerk-mean()-X"                
"tBodyAccJerk-mean()-Y"               
"tBodyAccJerk-mean()-Z"                
"tBodyAccJerk-std()-X"                
"tBodyAccJerk-std()-Y"                 
"tBodyAccJerk-std()-Z"                
"tBodyGyro-mean()-X"                   
"tBodyGyro-mean()-Y"                  
"tBodyGyro-mean()-Z"                   
"tBodyGyro-std()-X"                   
"tBodyGyro-std()-Y"                    
"tBodyGyro-std()-Z"                   
"tBodyGyroJerk-mean()-X"               
"tBodyGyroJerk-mean()-Y"              
"tBodyGyroJerk-mean()-Z"               
"tBodyGyroJerk-std()-X"               
"tBodyGyroJerk-std()-Y"                
"tBodyGyroJerk-std()-Z"               
"tBodyAccMag-mean()"                   
"tGravityAccMag-mean()"               
"tGravityAccMag-std()"                 
"tBodyAccJerkMag-mean()"              
"tBodyAccJerkMag-std()"                
"tBodyGyroMag-mean()"                 
"tBodyGyroMag-std()"                   	
"tBodyGyroJerkMag-mean()"             
"tBodyGyroJerkMag-std()"               
"fBodyAcc-mean()-X"                   
"fBodyAcc-mean()-Y"                    
"fBodyAcc-mean()-Z"                   
"fBodyAcc-std()-X"                     
"fBodyAcc-std()-Y"                    
"fBodyAcc-std()-Z"                     
"fBodyAccJerk-mean()-X"               
"fBodyAccJerk-mean()-Y"               
"fBodyAccJerk-mean()-Z"               
"fBodyAccJerk-std()-X"                 
"fBodyAccJerk-std()-Y"                
"fBodyAccJerk-std()-Z"                 
"fBodyGyro-mean()-X"                  
"fBodyGyro-mean()-Y"                   
"fBodyGyro-mean()-Z"                  
"fBodyGyro-std()-X"                    
"fBodyGyro-std()-Y"                   
"fBodyGyro-std()-Z"                    
"fBodyAccMag-mean()"                  
"fBodyAccMag-std()"                   
"fBodyBodyAccJerkMag-mean()"          
"fBodyBodyAccJerkMag-std()"            
"fBodyBodyGyroMag-mean()"             
"fBodyBodyGyroMag-std()"
"fBodyBodyGyroJerkMag-mean()"         
"fBodyBodyGyroJerkMag-std()"           
"angle(tBodyAccJerkMean),gravityMean)"
"angle(tBodyGyroMean,gravityMean)"     
"angle(tBodyGyroJerkMean,gravityMean)"
"angle(X,gravityMean)"                 
"angle(Y,gravityMean)"                
"angle(Z,gravityMean)"


##Variables (Code)
###This section refers to "variables" in the sense of R objects used in the script.

In order of appearance:

`widths` : Vector of the fwf widths specifying the format of the test and train data files. each column is 15 characters wide with one character separating them. There are 561 columns.

`test` : The variable the X_test.txt file is read into. Data frame of 2947 observations of 561 variables. 

`train`: The variable the X_train.txt file is read into. Data frame of 7352 observations of 561 variables. 

`merged`: Data frame of the merged test and train data frames. 10299 rows and 561 columns.

`features_to_select` : Two-column data frame of names and numbers of variables to select, read in from features_to_select.txt

`cols_to_select` : Vector of column numbers to extract from `merged`.

`merged_filtered` : Resulting data frame after selecting `cols_to_select` from `merged`

`col_headers` : Column names to be applied to `merged_filtered`. Leading numeric characters removed. Applied via names(merged_filtered) to column headers. 

`test_subject` : Data frame of subject numbers from test set. 

`train_subject`: Data frame of subject numbers from train set.

`merged_subject`: Resulting data frame from joining `test_subject` and `train_subject`. cbind() used to add this column as the first column of `merged_filtered`

`test_activity` : Data frame of activity key numbers from test set.

`train_activity` : Data frame of activity key numbers from train set.

`merged_activity` : Resulting data frame from joining `test_activity` and `train_activity`.

`activity_names` : Vector equivalent to `merged_activity` but with activity keys (1-6) replaced with activity names as characters. cbind() used to attach this column as second column of merged_filtered. 

`tidy` : final tidy dataset resulting from grouping `merged_filtered` by Subject, then by Activity, and taking the mean of each column. Data frame with 180 rows and 73 columns.  

