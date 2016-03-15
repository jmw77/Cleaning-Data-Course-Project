Code Book for "run_analysis.R" - a script to tidy the data from the UCR HAR Dataset.
Author: Julian M. Wallace

STUDY DESIGN
The experiments were carried out by Anguita and colleagues (Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013).  The subjects were a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (walking, walking upstairs, walking downstairs, sitting, standing, laying) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial (X, Y and Z dimensions) linear acceleration and 3-axial (X, Y and Z dimensions) angular velocity were captured at a constant rate of 50Hz. The experiments were video-recorded to label the data manually. The original dataset was randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body linear acceleration and gravity acceleration. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. Subsequently, the body linear acceleration and angular velocity were derived in time to obtain 'jerk' signals. Also the magnitude of these three-dimensional signals were calculated. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing frequency domain signals. The original data set included, for each measurement, a 561-feature vector with time and frequency domain variables. This tidy data set reports average values only for measurements for which the mean value and standard deviation of measurements were available. 

SUMMARY CHOICES
The activity codes and subject ID numbers were appended as columns (using 'cbind') to the original train and test data, which were then merged (using 'rbind') to create one large data set. Only the measurements on the mean and standard deviation for each measurement were extracted, the data from the original set that was identified by the '-mean' and '-std' suffixes.  These data are the mean value and standard deviation of the measurements. The 'meanFreq' variable, a weighted average of the frequency components, was excluded. The additional variables of the orignal set identified with upper case 'Mean', obtained by averaging of signals, were also excluded. The activities in the data set were named using the descriptive activity names provided in the UCI HAR Dataset.  The data set was appropriately labeled with human readable descriptive variable names corresponding to the extracted data.  Finally a second independent tidy data set with the average of each variable for each activity and each subject was generated (using the 'melt' function from the 'reshape2' library).

CODE BOOK 
The data frame created with 'run_analysis.R' is outputted to a text file 'tidydata.txt'.  The tidy data frame has 180 rows and 68 columns.  It includes a header with human readable descriptive variable names.   

It includes two factors: 

  - 'Activity' with 6 levels (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
  - 'Subject' with 30 levels (1:30)
  
Thus there are 180 (6*30) measurements for each of 66 variables.  Each measurement is an average of the sampled data for that variable.  The data is tidy - each variable measured is in one column; each different observation (activity per subject) is in a different row; it includes the variable names at the top of each column; and the variable names are human readable.  

Each of the 66 labeled variables is one of three types:
  - body (linear) acceleration in units of 'g'(where 1g = 9.8 meters per second squared).
  - gravity acceleration in units of 'g'(where 1g = 9.8 meters per second squared).
  - angular velocity in units of radians per second. 
  
In summary the tidy data set includes average values for the following variables are:  
  - mean and standard deviation of body linear acceleration in 3-axes (XYZ) in 2 (time and frequency) domains (N = 12)
  - mean and standard deviation of gravity acceleration in 3-axes (XYZ) in 1 (time) domains (N = 6) 
  - mean and standard deviation of body linear acceleration jerk signal in 3-axes (XYZ) in 2 (time and frequency) domains (N = 12) 
  - mean and standard deviation of angular velocity in 3-axes (XYZ) in 2 (time and frequency) domains (N = 12) 
  - mean and standard deviation of angular velocity jerk signal in 3-axes (XYZ) in 1 (time) domains (N = 6) 
  - mean and standard deviation of magnitude for all time domain signals (N = 10)
  - mean and standard deviation of magnitude for all time domain signals (N = 8)
  
List of all variables and units:
1. "Activity" - Description of the activity the subject performed (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING). <br />
2. "Subject" - The subject identification number (from 1 to 30).<br />
3. "MeanBodyLinearAccelerationTimeDomainX" - The mean body linear acceleration in time on the X-axis, average in units of 'g'.<br />
4. "MeanBodyLinearAccelerationTimeDomainY" - The mean body linear acceleration in time on the Y-axis, average in units of 'g'.<br />
5. "MeanBodyLinearAccelerationTimeDomainZ" - The mean body linear acceleration in time on the Z-axis, average in units of 'g'.<br />
6. "StandardDeviationBodyLinearAccelerationTimeDomainX" - The standard deviation of body linear acceleration in time on the X-axis, average in units of 'g'.<br />
7. "StandardDeviationBodyLinearAccelerationTimeDomainY" - The standard deviation of body linear acceleration in time on the Y-axis, average in units of 'g'.<br />
8. "StandardDeviationBodyLinearAccelerationTimeDomainZ" - The standard deviation of body linear acceleration in time on the Z-axis, average in units of 'g'.<br />
9. "MeanGravityAccelerationTimeDomainX" - The mean gravity acceleration in time on the X-axis, average in units of 'g'.<br />
10. "MeanGravityAccelerationTimeDomainY" - The mean gravity acceleration in time on the Y-axis, average in units of 'g'.<br />
11. "MeanGravityAccelerationTimeDomainZ" - The mean gravity acceleration in time on the Z-axis, average in units of 'g'.<br />
12. "StandardDeviationGravityAccelerationTimeDomainX" - The standard deviation of gravity acceleration in time on the X-axis, average in units of 'g'.<br />
13. "StandardDeviationGravityAccelerationTimeDomainY" - The standard deviation of gravity acceleration in time on the Y-axis, average in units of 'g'.<br />
14. "StandardDeviationGravityAccelerationTimeDomainZ" - The standard deviation of gravity acceleration in time on the Z-axis, average in units of 'g'.<br />
15. "MeanBodyLinearAccelerationJerkSignalTimeDomainX" - The mean body linear acceleration jerk signal in time on the X-axis, average in units of 'g'.<br />
16. "MeanBodyLinearAccelerationJerkSignalTimeDomainY" - The mean body linear acceleration jerk signal in time on the Y-axis, average in units of 'g'.<br />
17. "MeanBodyLinearAccelerationJerkSignalTimeDomainZ" - The mean body linear acceleration jerk signal in time on the Z-axis, average in units of 'g'.<br />
18. "StandardDeviationBodyLinearAccelerationJerkSignalTimeDomainX" - The standard deviation of body linear acceleration jerk signal in time on the X-axis, average in units of 'g'.<br />
19."StandardDeviationBodyLinearAccelerationJerkSignalTimeDomainY" - The standard deviation of body linear acceleration jerk signal in time on the Y-axis, average in units of 'g'.<br />
20. "StandardDeviationBodyLinearAccelerationJerkSignalTimeDomainZ" - The standard deviation of body linear acceleration jerk signal in time on the Z-axis, average in units of 'g'.<br />
21. "MeanBodyAngularVelocityTimeDomainX" - The mean body angular velocity in time on the X-axis, average in units of radians per second.<br />
22. "MeanBodyAngularVelocityTimeDomainY" - The mean body angular velocity in time on the Y-axis, average in units of radians per second.<br />
23. "MeanBodyAngularVelocityTimeDomainZ" - The mean body angular velocity in time on the Z-axis, average in units of radians per second.<br />
24. "StandardDeviationBodyAngularVelocityTimeDomainX" - The standard deviation of body angular velocity in time on the X-axis, average in units of radians per second.<br />
25. "StandardDeviationBodyAngularVelocityTimeDomainY" - The standard deviation of body angular velocity in time on the Y-axis, average in units of radians per second.<br />
26. "StandardDeviationBodyAngularVelocityTimeDomainZ" - The standard deviation of body angular velocity in time on the Z-axis, average in units of radians per second.<br />
27. "MeanBodyAngularVelocityJerkSignalTimeDomainX" - The mean body angular velocity jerk signal in time on the X-axis, average in units of radians per second.<br />
28. "MeanBodyAngularVelocityJerkSignalTimeDomainY" - The mean body angular velocity jerk signal in time on the Y-axis, average in units of radians per second.<br />
29. "MeanBodyAngularVelocityJerkSignalTimeDomainZ" - The mean body angular velocity jerk signal in time on the Z-axis, average in units of radians per second.<br />
30. "StandardDeviationBodyAngularVelocityJerkSignalTimeDomainX" - The standard deviation of body angular velocity jerk signal in time on the X-axis, average in units of radians per second.<br />
31. "StandardDeviationBodyAngularVelocityJerkSignalTimeDomainY" - The standard deviation of body angular velocity jerk signal in time on the Y-axis, average in units of radians per second.<br />
32. "StandardDeviationBodyAngularVelocityJerkSignalTimeDomainZ" - The standard deviation of body angular velocity jerk signal in time on the Z-axis, average in units of radians per second.<br />
33. "MeanMagnitudeBodyLinearAccelerationTimeDomain" - The mean magnitude of body linear acceleration in time, average in units of 'g'.<br />
34. "StandardDeviationMagnitudeBodyLinearAccelerationTimeDomain" - The standard deviation of magnitude of body linear acceleration in time, average in units of 'g'.<br />
35. "MeanMagnitudeGravityAccelerationTimeDomain" - The mean magnitude of gravity acceleration in time, average in units of 'g'.<br />
36. "StandardDeviationMagnitudeGravityAccelerationTimeDomain" - The standard deviation of magnitude of gravity acceleration in time, average in units of 'g'.<br />
37. "MeanMagnitudeBodyLinearAccelerationJerkSignalTimeDomain" - The mean magnitude of body linear acceleration jerk signal in time, average in units of 'g'.<br />
38. "StandardDeviationMagnitudeBodyLinearAccelerationJerkSignalTimeDomain" - The standard deviation of magnitude of body linear acceleration jerk signal in time, average in units of 'g'.<br />
39. "MeanMagnitudeBodyAngularVelocityTimeDomain" - The mean magnitude of body angular velocity in time, average in units of radians per second.<br />
40. "StandardDeviationMagnitudeBodyAngularVelocityTimeDomain" - The standard deviation of magnitude of body angular velocity in time, average in units of radians per second.<br />
41. "MeanMagnitudeBodyAngularVelocityJerkSignalTimeDomain" - The mean magnitude of body angular velocity jerk signal in time, average in units of radians per second.<br />
42. "StandardDeviationMagnitudeBodyAngularVelocityJerkSignalTimeDomain" - The standard deviation of magnitude of body angular velocity jerk signal in time, average in units of radians per second.<br />
43. "MeanBodyLinearAccelerationFrequencyDomainX" - The mean body linear acceleration in frequency on the X-axis, average in units of 'g'.<br />
44. "MeanBodyLinearAccelerationFrequencyDomainY" - The mean body linear acceleration in frequency on the Y-axis, average in units of 'g'.<br />
45. "MeanBodyLinearAccelerationFrequencyDomainZ" - The mean body linear acceleration in frequency on the Z-axis, average in units of 'g'.<br />
46. "StandardDeviationBodyLinearAccelerationFrequencyDomainX" - The standard deviation of body linear acceleration in frequency on the X-axis, average in units of 'g'.<br />
47. "StandardDeviationBodyLinearAccelerationFrequencyDomainY" - The standard deviation of body linear acceleration in frequency on the Y-axis, average in units of 'g'.<br />
48. "StandardDeviationBodyLinearAccelerationFrequencyDomainZ" - The standard deviation of body linear acceleration in frequency on the Z-axis, average in units of 'g'.<br />
49. "MeanBodyLinearAccelerationJerkSignalFrequencyDomainX" - The mean of body linear acceleration jerk signal in frequency on the X-axis, average in units of 'g'.<br />
50. "MeanBodyLinearAccelerationJerkSignalFrequencyDomainY" - The mean of body linear acceleration jerk signal in frequency on the Y-axis, average in units of 'g'.<br />
51. "MeanBodyLinearAccelerationJerkSignalFrequencyDomainZ" - The mean of body linear acceleration jerk signal in frequency on the Z-axis, average in units of 'g'.<br />
52. "StandardDeviationBodyLinearAccelerationJerkSignalFrequencyDomainX" - The standard deviation of body linear acceleration jerk signal in frequency on the X-axis, average in units of 'g'.<br />
53. "StandardDeviationBodyLinearAccelerationJerkSignalFrequencyDomainY" - The standard deviation of body linear acceleration jerk signal in frequency on the Y-axis, average in units of 'g'.<br />
54. "StandardDeviationBodyLinearAccelerationJerkSignalFrequencyDomainZ" - The standard deviation of body linear acceleration jerk signal in frequency on the Z-axis, average in units of 'g'.<br />
55. "MeanBodyAngularVelocityFrequencyDomainX" - The mean body angular velocity in frequency on the X-axis, average in units of radians per second.<br />
56. "MeanBodyAngularVelocityFrequencyDomainY" - The mean body angular velocity in frequency on the Y-axis, average in units of radians per second.<br />
57. "MeanBodyAngularVelocityFrequencyDomainZ" - The mean body angular velocity in frequency on the Z-axis, average in units of radians per second.<br />
58. "StandardDeviationBodyAngularVelocityFrequencyDomainX" - The standard deviation of body angular velocity in frequency on the X-axis, average in units of radians per second.
59. "StandardDeviationBodyAngularVelocityFrequencyDomainY" - The standard deviation of body angular velocity in frequency on the Y-axis, average in units of radians per second.<br />
60. "StandardDeviationBodyAngularVelocityFrequencyDomainZ" - The standard deviation of body angular velocity in frequency on the Z-axis, average in units of radians per second.<br />
61. "MeanMagnitudeBodyLinearAccelerationFrequencyDomain" - The mean magnitidue of body linear acceleration in frequency, average in units of 'g'.<br />
62. "StandardDeviationMagnitudeBodyLinearAccelerationFrequencyDomain" - The standard deviation of magnitidue of body linear acceleration in frequency, average in units of 'g'.<br />
63. "MeanMagnitudeBodyLinearAccelerationJerkSignalFrequencyDomain" - The mean magnitidue of body linear acceleration jerk signal in frequency, average in units of 'g'.<br />
64. "StandardDeviationMagnitudeBodyLinearAccelerationJerkSignalFrequencyDomain" - The standard deviation of magnitidue of body linear acceleration jerk signal in frequency, average in units of 'g'.<br />
65. "MeanMagnitudeBodyAngularVelocityFrequencyDomain" - The mean magnitidue of body angular velocity in frequency, average in units of radians per second.<br />
66. "StandardDeviationMagnitudeBodyAngularVelocityFrequencyDomain" - The standard deviation of magnitidue of body angular velocity in frequency, average in units of radians per second.<br />
67. "MeanMagnitudeBodyAngularVelocityJerkSignalFrequencyDomain" - The mean magnitude of body angular velocity jerk signal in frequency, average in units of radian per second.<br />
68. "StandardDeviationMagnitudeBodyAngularVelocityJerkSignalFrequencyDomain") - The standard deviation of magnitude of body angular velocity jerk signal in frequency, average in units of radians per second.<br />