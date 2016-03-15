# This code tidies up the UCI Human Activity Recognition Using Smartphones Data Set 
# following the instructions for the Coursera 'Getting and Cleaning Data' Course Project.
# Author: J. M. Wallace 
# Date: March 2016
# OS: Windows 10
# SOFTWARE: R V3.2.3 (R Studio Version 0.99.491)

# STEP ONE - Check if we have the data set available in the wd and download if not.
# Following Coursara Course Project Instructions run_analysis.R can be run as long as 
# the Samsung data is in your working directory
if (!file.exists("UCI HAR Dataset")) {
  fileURL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileURL,"Dataset.zip")
  unzip("Dataset.zip")
}

# STEP TWO - 'PRE_PROCESSING' STEPS
# Read in our train and test data.  Thankfully it is in a .txt file and is readable as a table.
X_train<- read.table("./UCI HAR Dataset/train/X_train.txt")
X_test<- read.table("./UCI HAR Dataset/test/X_test.txt")
# From dim(X_test) and  dim(X_train) we have 561 columns of data, corresponding to the number
# of features

# Let's get our subject data.
subject_train<- read.table("./UCI HAR Dataset/train/subject_train.txt")
subject_test<- read.table("./UCI HAR Dataset/test/subject_test.txt")
# From dim(subject_train) we find 7352 rows of training labels, corresponding to the number of rows in our X_train.  
# From dim(subject_test) we find 2947 rows of test labels, corresponding to the number of rows in our X_test. 
# Let's add our subject ID numbers as a new column to the data sets.
X_train<-cbind(subject_train,X_train)
X_test<-cbind(subject_test,X_test)

# Now let's get our activity codes.
y_train<- read.table("./UCI HAR Dataset/train/y_train.txt")
y_test<- read.table("./UCI HAR Dataset/test/y_test.txt")
# Again, we can see using calls to 'dim' that this data nicely matches the number of observations in our data sets.
# Let's add our activity codes as a new column to the data sets.
X_train<-cbind(y_train,X_train)
X_test<-cbind(y_test,X_test)

# STEP THREE - CLEANING THE DATA AND CREATING THE TIDY DATA FILE (5 ADDITIONAL STEPS)
#1. Merge the training and the test sets to create one data set.
dataset <- rbind(X_train,X_test)

#2. Extract only the measurements on the mean and standard deviation for each measurement.
# I elected to extract only the data that is identified by the '-mean' and '-std' suffixes.
# These are described in 'features_info.txt' as the mean value and standard deviation of the measurements.
# I exclude the 'meanFreq' variable, which is not the mean value but a weighted average of the frequency components.
# I excluded the 'additional variables' identified with upper case 'Mean', that were obtained by averaging of signals.
features<-read.table("./UCI HAR Dataset/features.txt")

# Use grep to extract indices for only the 'mean' and 'std' variables.
myindices<-grep("-mean()[^Freq]|-std()[^Freq]",features[,2])
# we also want the first two columns (activity and subject) of our data set so we add two to our indices
dataset<-dataset[,c(1,2,myindices+2)]

#3. Use descriptive activity names to name the activities in the data set
# Let's substitute the number codes for the labels
activity_labels<- read.table("./UCI HAR Dataset/activity_labels.txt")
for (i in 1:length(activity_labels[,1])) {
  dataset[,1]<-gsub(activity_labels[i,1],as.character(activity_labels[i,2]),dataset[,1])
}

#4. Appropriately labels the data set with descriptive variable names.
# Let's add column names corresponding to the 561 features.
# Following the rules of tidy data, these names are human readable.
# I created a 'tidyfeatures' list with names expanded from the original 'features.txt'
# file using the descriptions in 'features_info.txt'.

tidyfeatures<-c("Activity",
"Subject",
"MeanBodyLinearAccelerationTimeDomainX",
"MeanBodyLinearAccelerationTimeDomainY",
"MeanBodyLinearAccelerationTimeDomainZ",
"StandardDeviationBodyLinearAccelerationTimeDomainX",
"StandardDeviationBodyLinearAccelerationTimeDomainY",
"StandardDeviationBodyLinearAccelerationTimeDomainZ",
"MeanGravityAccelerationTimeDomainX",
"MeanGravityAccelerationTimeDomainY",
"MeanGravityAccelerationTimeDomainZ",
"StandardDeviationGravityAccelerationTimeDomainX",
"StandardDeviationGravityAccelerationTimeDomainY",
"StandardDeviationGravityAccelerationTimeDomainZ",
"MeanBodyLinearAccelerationJerkSignalTimeDomainX",
"MeanBodyLinearAccelerationJerkSignalTimeDomainY",
"MeanBodyLinearAccelerationJerkSignalTimeDomainZ",
"StandardDeviationBodyLinearAccelerationJerkSignalTimeDomainX",
"StandardDeviationBodyLinearAccelerationJerkSignalTimeDomainY",
"StandardDeviationBodyLinearAccelerationJerkSignalTimeDomainZ",
"MeanBodyAngularVelocityTimeDomainX",
"MeanBodyAngularVelocityTimeDomainY",
"MeanBodyAngularVelocityTimeDomainZ",
"StandardDeviationBodyAngularVelocityTimeDomainX",
"StandardDeviationBodyAngularVelocityTimeDomainY",
"StandardDeviationBodyAngularVelocityTimeDomainZ",
"MeanBodyAngularVelocityJerkSignalTimeDomainX",
"MeanBodyAngularVelocityJerkSignalTimeDomainY",
"MeanBodyAngularVelocityJerkSignalTimeDomainZ",
"StandardDeviationBodyAngularVelocityJerkSignalTimeDomainX",
"StandardDeviationBodyAngularVelocityJerkSignalTimeDomainY",
"StandardDeviationBodyAngularVelocityJerkSignalTimeDomainZ",
"MeanMagnitudeBodyLinearAccelerationTimeDomain",
"StandardDeviationMagnitudeBodyLinearAccelerationTimeDomain",
"MeanMagnitudeGravityAccelerationTimeDomain",
"StandardDeviationMagnitudeGravityAccelerationTimeDomain",
"MeanMagnitudeBodyLinearAccelerationJerkSignalTimeDomain",
"StandardDeviationMagnitudeBodyLinearAccelerationJerkSignalTimeDomain",
"MeanMagnitudeBodyAngularVelocityTimeDomain",
"StandardDeviationMagnitudeBodyAngularVelocityTimeDomain",
"MeanMagnitudeBodyAngularVelocityJerkSignalTimeDomain",
"StandardDeviationMagnitudeBodyAngularVelocityJerkSignalTimeDomain",
"MeanBodyLinearAccelerationFrequencyDomainX",
"MeanBodyLinearAccelerationFrequencyDomainY",
"MeanBodyLinearAccelerationFrequencyDomainZ",
"StandardDeviationBodyLinearAccelerationFrequencyDomainX",
"StandardDeviationBodyLinearAccelerationFrequencyDomainY",
"StandardDeviationBodyLinearAccelerationFrequencyDomainZ",
"MeanBodyLinearAccelerationJerkSignalFrequencyDomainX",
"MeanBodyLinearAccelerationJerkSignalFrequencyDomainY",
"MeanBodyLinearAccelerationJerkSignalFrequencyDomainZ",
"StandardDeviationBodyLinearAccelerationJerkSignalFrequencyDomainX",
"StandardDeviationBodyLinearAccelerationJerkSignalFrequencyDomainY",
"StandardDeviationBodyLinearAccelerationJerkSignalFrequencyDomainZ",
"MeanBodyAngularVelocityFrequencyDomainX",
"MeanBodyAngularVelocityFrequencyDomainY",
"MeanBodyAngularVelocityFrequencyDomainZ",
"StandardDeviationBodyAngularVelocityFrequencyDomainX",
"StandardDeviationBodyAngularVelocityFrequencyDomainY",
"StandardDeviationBodyAngularVelocityFrequencyDomainZ",
"MeanMagnitudeBodyLinearAccelerationFrequencyDomain",
"StandardDeviationMagnitudeBodyLinearAccelerationFrequencyDomain",
"MeanMagnitudeBodyLinearAccelerationJerkSignalFrequencyDomain",
"StandardDeviationMagnitudeBodyLinearAccelerationJerkSignalFrequencyDomain",
"MeanMagnitudeBodyAngularVelocityFrequencyDomain",
"StandardDeviationMagnitudeBodyAngularVelocityFrequencyDomain",
"MeanMagnitudeBodyAngularVelocityJerkSignalFrequencyDomain",
"StandardDeviationMagnitudeBodyAngularVelocityJerkSignalFrequencyDomain")

names(dataset)<- tidyfeatures

#5. From the data set in step 4, creates a second, independent tidy data set with the average of each 
# variable for each activity and each subject.

# To do this we need to convert our WIDE data (one column per variable) to LONG format data
# First we need to set the ID variables to factors
dataset$Subject<-as.factor(dataset$Subject)
dataset$Activity<-as.factor(dataset$Activity)
library(reshape2)
# Now we 'melt' our data into the LONG format:
dataset.melt<-melt(dataset,id=c("Activity","Subject"),measure.vars=colnames(dataset[3:68]))
# Finally we cast the data into our desired shape, averaging each variable for each activity and subject
tidydata<-dcast(dataset.melt,Activity + Subject ~ variable,fun.aggregate=mean)
# The data is tidy -
# - each variable measured is in one column; 
# - each different observation (activity per subject) is in a different row); 
# - it includes the variable names at the top of each column; 
# - the variable names are human readable; 
# - and being only one table it is saved as one file.  

# Finally let's write the tidy data we created to a file that can be used by others (statisticians).
write.table(tidydata, "tidydata.txt",row.name=FALSE) 