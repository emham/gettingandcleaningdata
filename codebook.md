Hamilton,E.

#run_analysis.R

##Overview

run_analysis.R was written to perform some basic processing of wearable motion sensor data [from UCI](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). The script reads in the training and test datasets from fwf files and merges them, adds columns for the subject number and activity, extracts only mean and standard deviation variables (complete list below), and returns a new, tidy dataset consisting of only the mean of each variable for each subject and activity combination. 

##The Data
Data was obtained from UCI [(download)](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). 
Thirty human volunteers wore Samsung Galaxy smartphone on their waists while performing six physical activities. 
Researchers used the built-in accelerometer and gyroscope to measure 3-axial linear acceleration 
and 3-axial angular velocity at a constant rate of 50Hz. Acceleration was split into body and gravity components.
The key parts of the provided data are the test and training data sets, which are segretated into separate folders 
within the HAR Dataset folder. Each of the test and train folders contains: 

* the 'X' file (X_test.txt or X_train.txt): These files contain all the measured data, without subject or activity information. Files are fixed-width, with 561 columns. 

* the 'Y' file (Y_test.txt or Y_train.txt): These files contain a single column with the Activity annotation, using a key 1-6 to represent the six activities (walking, walking upstairs, walking downstairs, standing, sitting or laying.) One row for each observation (same as respective X files.)

* the subject file (subject_test.txt or subject_train.txt): These files contain a single column with the subject number annotation. One row for each observation (same as respective X files).

The major tranformation performed in this script is to merge the test and train sets, annotate each observation with Subject and Activity information, extract relevant columns, and provide an output tidy data table of the mean of each columns for each subject and activity pair. 


##Variables (Data)
###This section refers to “variables” in the sense of observed measurements, or columns in the data frame.

Only mean and standard deviation variables were extracted. meanFreq variables were not
included in the final analysis. In total, 66 variables were extracted from the original 
dataset and two columns were added: one for 'Subject' and one for 'Activity'.

The complete list of variables (68) is:

"Subject" - Identified by numbers 1-30        
"Activity" - Walking, Walking_Upstairs, Walking_Downstairs, Laying, Sitting, or Standing        
"tBodyAcc-mean()-X" - mean, body acceleration, x-axis         
"tBodyAcc-mean()-Y" - mean, body acceleration, y-axis       
"tBodyAcc-mean()-Z" - mean, body acceleration, z-axis         
"tBodyAcc-std()-X" - standard deviation, body acceleration, x-axis        
"tBodyAcc-std()-Y"  - standard deviation, body acceleration, y-axis         
"tBodyAcc-std()-Z" - standard deviation, body acceleration, z-axis          
"tGravityAcc-mean()-X" - mean, gravity acceleration, x-axis         
"tGravityAcc-mean()-Y"  - mean, gravity acceleration, y-axis        
"tGravityAcc-mean()-Z" - mean, gravity acceleration, z-axis         
"tGravityAcc-std()-X" - standard deviation, gravity acceleration, x-axis          
"tGravityAcc-std()-Y" - standard deviation, gravity acceleration, y-axis          
"tGravityAcc-std()-Z" - standard deviation, gravity acceleration, z-axis          
"tBodyAccJerk-mean()-X" - mean, body acceleration jerk, x-axis          
"tBodyAccJerk-mean()-Y" - mean, body acceleration jerk, y-axis            
"tBodyAccJerk-mean()-Z" - mean, body acceleration jerk, z-axis        
"tBodyAccJerk-std()-X" - standard deviation, body acceleration jerk, x-axis         
"tBodyAccJerk-std()-Y" - standard deviation, body acceleration jerk, y-axis         
"tBodyAccJerk-std()-Z" - standard deviation, body acceleration jerk, z-axis         
"tBodyGyro-mean()-X" - mean, body gyroscope, x-axis         
"tBodyGyro-mean()-Y" - mean, body gyroscope, y-axis         
"tBodyGyro-mean()-Z" - mean, body gyroscope, z-axis         
"tBodyGyro-std()-X" - standard deviation, body gyroscope, x-axis        
"tBodyGyro-std()-Y" - standard deviation, body gyroscope, y-axis        
"tBodyGyro-std()-Z" - standard deviation, body gyroscope, z-axis        
"tBodyGyroJerk-mean()-X" - mean, body gyroscope jerk, x-axis          
"tBodyGyroJerk-mean()-Y" - mean, body gyroscope jerk, y-axis          
"tBodyGyroJerk-mean()-Z" - mean, body gyroscope jerk, z-axis        
"tBodyGyroJerk-std()-X" - standard deviation, body gyroscope jerk, x-axis            
"tBodyGyroJerk-std()-Y" - standard deviation, body gyroscope jerk, y-axis         
"tBodyGyroJerk-std()-Z" - standard deviation, body gyroscope jerk, z-axis           
"tBodyAccMag-mean()" - mean, body acceleration magnitude             
"tBodyAccMag-std()" - standard deviation, body acceleration magnitude         
"tGravityAccMag-mean()" - mean, gravity acceleration magnitude        
"tGravityAccMag-std()"  - standard deviation, gravity acceleration magnitude        
"tBodyAccJerkMag-mean()" - mean, body acceleration jerk magnitude         
"tBodyAccJerkMag-std()" - standard deviation, body acceleration jerk magnitude        
"tBodyGyroMag-mean()" - mean, body gyroscope magnitude        
"tBodyGyroMag-std()" - standard deviation, body gyroscope magnitude         
"tBodyGyroJerkMag-mean()" - mean, body gyroscope jerk magnitude         
"tBodyGyroJerkMag-std()" - standard deviation, body gyroscope jerk magnitude        
"fBodyAcc-mean()-X" - mean, FFT body acceleration, x-axis         
"fBodyAcc-mean()-Y" - mean, FFT body acceleration, y-axis         
"fBodyAcc-mean()-Z" - mean, FFT body acceleration, z-axis         
"fBodyAcc-std()-X" - standard deviation, FFT body acceleration, x-axis        
"fBodyAcc-std()-Y" - standard deviation, FFT body acceleration, y-axis        
"fBodyAcc-std()-Z" - standard deviation, FFT body acceleration, z-axis        
"fBodyAccJerk-mean()-X" - mean, FFT body acceleration jerk, x-axis        
"fBodyAccJerk-mean()-Y" - mean, FFT body acceleration jerk, y-axis        
"fBodyAccJerk-mean()-Z" - mean, FFT body acceleration jerk, z-axis        
"fBodyAccJerk-std()-X" - standard deviation, FFT body acceleration jerk, x-axis         
"fBodyAccJerk-std()-Y" - standard deviation, FFT body acceleration jerk, y-axis       
"fBodyAccJerk-std()-Z" - standard deviation, FFT body acceleration jerk, z-axis       
"fBodyGyro-mean()-X" - mean, FFT body gyroscope, x-axis       
"fBodyGyro-mean()-Y" - mean, FFT body gyroscope, y-axis       
"fBodyGyro-mean()-Z" - mean, FFT body gyroscope, z-axis       
"fBodyGyro-std()-X" - standard deviation, FFT body gyroscope, x-axis      
"fBodyGyro-std()-Y" - standard deviation, FFT body gyroscope, y-axis      
"fBodyGyro-std()-Z" - standard deviation, FFT body gyroscope, z-axis      
"fBodyAccMag-mean()" - mean, FFT body acceleration magnitude      
"fBodyAccMag-std()" - standard deviation, FFT body acceleration magnitude       
"fBodyBodyAccJerkMag-mean()" - mean, FFT body acceleration jerk magnitude       
"fBodyBodyAccJerkMag-std()" - standard deviation, FFT body acceleration jerk magnitude      
"fBodyBodyGyroMag-mean()" - mean, FFT body gyroscope magnitude      
"fBodyBodyGyroMag-std()" - standard deviation, FFT body gyroscope magnitude       
"fBodyBodyGyroJerkMag-mean()" - mean, FFT body gyroscope jerk magnitude       
"fBodyBodyGyroJerkMag-std()" - standard deviation, FFT body gyroscope jerk magnitude        


*FFT variables are fast Fourier transformed

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

`tidy` : final tidy dataset resulting from grouping `merged_filtered` by Subject, then by Activity, and taking the mean of each column. Data frame with 180 rows and 68 columns.  

##Specs
Run on Mac OSX 10.10.2.  R version 3.1.2.  April 2015.      
Packages: dplyr 0.4.1
