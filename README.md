README.md
##run_analysis.R 

run_analysis.R takes wearable motion detection data from UCI, joins their test
and training datasets, applies descriptive labels to neatly and informatively format the data,
selects out variables of interest (see codebook.md) and creates a new data frame with the 
mean of each of the selected variables for each subject and activity. 

The whole analysis is performed in this one script. The only user-defined piece is setting your working directory and making sure the UCI data are in that working directory. 

###Steps:
1. Download data here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip (and unzip)
2. Set working directory to location of these files.
3. Set output file name in script to your preference.
4. Make sure dplyr package is installed.
3. Run entirety of run_analysis.R
4. View tidy data for summary info. 
