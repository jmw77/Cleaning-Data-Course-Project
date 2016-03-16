

This is a README.md file for the Coursera 'Getting and Cleaning Data' course project.

The Github repo contains a Code Book (the 'Codebook.md' file) that includes: 

1. Information about the experimental study. 
2. Information about the summary choices made in the data cleaning process. 
3. Information about the Variables (including units). 

There is one R-script file contained in the repo called "run_analysis.R" that is used to perform the data cleaning. This contains all the code required to clean the UCI Human Activity Recognition Using Smartphones Data Set.  To run the script type 'source("run_analysis.R")' at the R prompt.

First, the script will check that the UCI HAR Dataset is available in the current working directory.  If it is not, it will be downloaded from the URL at  [UCI HAR Dataset](https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) and unzipped in the current directory.  

The script first performs some 'pre-processing' by reading in the train and test data ('X_train.txt', 'X_test.txt') as tables, and appending the activity codes ('y_train.txt', 'y_test.txt') and subject ID numbers  ('subject_train.txt', 'subject_test.txt') that resided in separate files as columns to those data (using the 'cbind' function).  The script then cleans the data with the following steps:

1. Merges the training and the test sets to create one data set (using the 'rbind' function).
2. Extracts only the measurements on the mean and standard deviation for each measurement (using the information provided in “features.txt”).
3. Names the activities in the data set by replacing the numeric activity labels with descriptive activity names (provided in “activity_labels.txt”).
4. Appropriately labels the data set with descriptive variable names (refer to 'features_info.txt').
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject (using the 'melt' function from the 'reshape2' package. Each variable measured is in one column; each different observation (activity per subject) is in a different row; it includes the variable names at the top of each column; and the variable names are human readable.  

The script outputs this new data set to the file “tidydata.txt”.  This tidy data file includes a header row with the descriptive names for each column and can be read into R with the command 'read.table("tidydata.txt",header = TRUE)'.




> Written with [StackEdit](https://stackedit.io/).