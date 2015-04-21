README.md
run_analysis.R HamiltonE

run_analysis.R takes wearable motion detection data from UCI ((link)), joins their test
and training datasets, applies descriptive labels to neatly and informatively format the data,
selects out variables of interest (described below) and creates a new data frame with the 
mean of each of the selected variables for each subject and activity. 


Only mean and standard deviation variables were extracted. meanFreq variables were not
included in the final analysis. In total, 71 variables were extracted from the original 
dataset and two columns were added: one for 'Subject' and one for 'Activity'.

The complete list of variables is:
 [1] "Subject"                              
 	"Activity"                            
 [3] "tBodyAcc-mean()-X"                    
 	"tBodyAcc-mean()-Y"                   
 [5] "tBodyAcc-mean()-Z"                    
 	"tBodyAcc-std()-X"                    
 [7] "tBodyAcc-std()-Y"                     
 	"tBodyAcc-std()-Z"                    
 [9] "tGravityAcc-mean()-X"                 
 	"tGravityAcc-mean()-Y"                
[11] "tGravityAcc-mean()-Z"                 
	"tGravityAcc-std()-X"                 
[13] "tGravityAcc-std()-Y"                  
	"tGravityAcc-std()-Z"                 
[15] "tBodyAccJerk-mean()-X"                
	"tBodyAccJerk-mean()-Y"               
[17] "tBodyAccJerk-mean()-Z"                
	"tBodyAccJerk-std()-X"                
[19] "tBodyAccJerk-std()-Y"                 
	"tBodyAccJerk-std()-Z"                
[21] "tBodyGyro-mean()-X"                   
	"tBodyGyro-mean()-Y"                  
[23] "tBodyGyro-mean()-Z"                   
	"tBodyGyro-std()-X"                   
[25] "tBodyGyro-std()-Y"                    
	"tBodyGyro-std()-Z"                   
[27] "tBodyGyroJerk-mean()-X"               
	"tBodyGyroJerk-mean()-Y"              
[29] "tBodyGyroJerk-mean()-Z"               
	"tBodyGyroJerk-std()-X"               
[31] "tBodyGyroJerk-std()-Y"                
	"tBodyGyroJerk-std()-Z"               
[33] "tBodyAccMag-mean()"                   
	"tGravityAccMag-mean()"               
[35] "tGravityAccMag-std()"                 
	"tBodyAccJerkMag-mean()"              
[37] "tBodyAccJerkMag-std()"                
	"tBodyGyroMag-mean()"                 
[39] "tBodyGyroMag-std()"                   	
"tBodyGyroJerkMag-mean()"             
[41] "tBodyGyroJerkMag-std()"               
	"fBodyAcc-mean()-X"                   
[43] "fBodyAcc-mean()-Y"                    
	"fBodyAcc-mean()-Z"                   
[45] "fBodyAcc-std()-X"                     
	"fBodyAcc-std()-Y"                    
[47] "fBodyAcc-std()-Z"                     
	"fBodyAccJerk-mean()-X"               
[49] "fBodyAccJerk-mean()-Y"               
	 "fBodyAccJerk-mean()-Z"               
[51] "fBodyAccJerk-std()-X"                 
	"fBodyAccJerk-std()-Y"                
[53] "fBodyAccJerk-std()-Z"                 
	"fBodyGyro-mean()-X"                  
[55] "fBodyGyro-mean()-Y"                   
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