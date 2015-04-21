README.md
##run_analysis.R 

run_analysis.R takes wearable motion detection data from UCI, joins their test
and training datasets, applies descriptive labels to neatly and informatively format the data,
selects out variables of interest (see codebook.md) and creates a new data frame with the 
mean of each of the selected variables for each subject and activity. 

The whole analysis is performed in this one script. The only user-defined piece is setting your working directory and making sure the UCI data are in that working directory. 
