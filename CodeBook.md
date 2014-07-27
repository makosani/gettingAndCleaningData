==================================================================
Human Activity Recognition Using Smartphones Dataset
Average Mean and Standard Deviation Codebook
==================================================================

--------------------------------------------------------------------------
Raw to Tidy Dataset Transformation
--------------------------------------------------------------------------

We are starting with the raw data found at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The run_analysis.R function will transform the raw dataset into a Tidy Dataset containing the average mean and average standard deviation measurements by activity and subject by following these rules:

1. Ingest the activity lookup and features lookup tables for use with both the test and training datasets  
### Start putting together and cleaning the Test data 
2. Read in the test measures from the test/X_test.txt file
3. Apply the column names from the features lookup table
4. Read the subject data from the test/subject_test.txt file
5. Read the Activity data from the test/y_test.txt file
6. Join the activity descriptions with the activity records
7. Create a test dataset which contains all the measures by the activity and subject dimensions
8. Since we only care about the mean and standard deviation measures, we create a dataset which contains any measures that contains "mean()" or "std()" by the activity and subject dimensions.  
### Start putting together and cleaning the Training data ######
9. Read in the training measures from the train/X_train.txt file
10. Apply the column names from the features lookup table
11. Read the subject data from the train/subject_train.txt file
12. Read the Activity data from the train/y_train.txt file
13. Join the activity descriptions with the activity records
14. Create a training dataset which contains all the measures by the activity and subject dimensions
15. Since we only care about the mean and standard deviation measures, we create a dataset which contains any measures that contains "mean()" or "std()" by the activity and subject dimension  
#### Merge the test and the training data into a single data frame ##########
16. Merge the test and training data into a single dataset
17. Name the Activity and Subject dimensions as "SubjectID" and "Activity" 
18. Create a final dataset that averages the means and standard deviations by activity and subjectID  
#### Clean the variables to be more descriptive  ##########
19. Clean each variable to be more descriptive as follows:  
a. Units
  * a1. if the raw variable starts with "f" then this is a Frequency unit
  * a2. if the raw variable starts with "t" then this is a Time unit  
b. Sensor
  * b1. if the raw variable contains "Acc" then this is an Acceleromoter Sensor
  * b2. if the raw variable contains "Gyro" then this is a Gyroscope Sensor  
c. Measurement
  * c1. if the raw variable contains "mean" then this is the mean of the function
  * c2. if the raw variable contains "std" then this is the standard deviation of the function  
d. Motion Components - Pull the motion component from the raw variable name (ie Body or Gravity)  
e. Jerk Signal - if the raw variable conains "Jerk" then "Jerk"  
f. Magnitude - if the raw variable contains "Mag" then "Magnitude"   
g. Axis - Pull the axis component from the raw variable name (ie XAxis, YAxis or ZAxis)  
20. Create a new variable name - Motion Component + Sensor + Jerk Signal + Magnitude + Measurement + Units + Axis  
#### Write the final dataset out as a text file  ##########
21. Write the final dataset out as a comma delimited text file called "humanActivityRecognition.txt"

--------------------------------------------------------------------------
Tidy DataSet Layout
--------------------------------------------------------------------------

activity - Walking, Walking Upstairs, Walking Downstairs, Sitting, Standing, Laying
subject	- Test subjects 1 - 30

Each column in the dataset follows the following format:
Motion Component (Body or Gravity) + Sensor (Acceleromoter or Gyroscope) + whether a jerk signal was calculated + whether we calculated the Magnitude + Measurement (Average mean or Average Standard Deviation) + Units (Frequency or Time) + Axis (X, Y or Z)

Here are the measures that follow the above formula:
BodyAccelerometerAverageMeanTimeXAxis	
BodyAccelerometerAverageMeanTimeYAxis	
BodyAccelerometerAverageMeanTimeZAxis	
GravityAccelerometerAverageMeanTimeXAxis	
GravityAccelerometerAverageMeanTimeYAxis	
GravityAccelerometerAverageMeanTimeZAxis	
BodyAccelerometerJerkAverageMeanTimeXAxis	
BodyAccelerometerJerkAverageMeanTimeYAxis	
BodyAccelerometerJerkAverageMeanTimeZAxis	
BodyGyroscopeAverageMeanTimeXAxis	
BodyGyroscopeAverageMeanTimeYAxis	
BodyGyroscopeAverageMeanTimeZAxis	
BodyGyroscopeJerkAverageMeanTimeXAxis	
BodyGyroscopeJerkAverageMeanTimeYAxis	
BodyGyroscopeJerkAverageMeanTimeZAxis	
BodyAccelerometerMagnitudeAverageMeanTime	
GravityAccelerometerMagnitudeAverageMeanTime	
BodyAccelerometerJerkMagnitudeAverageMeanTime	
BodyGyroscopeMagnitudeAverageMeanTime	
BodyGyroscopeJerkMagnitudeAverageMeanTime	
BodyAccelerometerAverageMeanFrequencyXAxis	
BodyAccelerometerAverageMeanFrequencyYAxis	
BodyAccelerometerAverageMeanFrequencyZAxis	
BodyAccelerometerJerkAverageMeanFrequencyXAxis	
BodyAccelerometerJerkAverageMeanFrequencyYAxis	
BodyAccelerometerJerkAverageMeanFrequencyZAxis	
BodyGyroscopeAverageMeanFrequencyXAxis	
BodyGyroscopeAverageMeanFrequencyYAxis	
BodyGyroscopeAverageMeanFrequencyZAxis	
BodyAccelerometerMagnitudeAverageMeanFrequency	
BodyBodyAccelerometerJerkMagnitudeAverageMeanFrequency	
BodyBodyGyroscopeMagnitudeAverageMeanFrequency	
BodyBodyGyroscopeJerkMagnitudeAverageMeanFrequency	
BodyAccelerometerAverageStandardDeviationTimeXAxis	
BodyAccelerometerAverageStandardDeviationTimeYAxis	
BodyAccelerometerAverageStandardDeviationTimeZAxis	
GravityAccelerometerAverageStandardDeviationTimeXAxis	
GravityAccelerometerAverageStandardDeviationTimeYAxis	
GravityAccelerometerAverageStandardDeviationTimeZAxis	
BodyAccelerometerJerkAverageStandardDeviationTimeXAxis	
BodyAccelerometerJerkAverageStandardDeviationTimeYAxis	
BodyAccelerometerJerkAverageStandardDeviationTimeZAxis	
BodyGyroscopeAverageStandardDeviationTimeXAxis	
BodyGyroscopeAverageStandardDeviationTimeYAxis	
BodyGyroscopeAverageStandardDeviationTimeZAxis	
BodyGyroscopeJerkAverageStandardDeviationTimeXAxis	
BodyGyroscopeJerkAverageStandardDeviationTimeYAxis	
BodyGyroscopeJerkAverageStandardDeviationTimeZAxis	
BodyAccelerometerMagnitudeAverageStandardDeviationTime	
GravityAccelerometerMagnitudeAverageStandardDeviationTime	 
BodyAccelerometerJerkMagnitudeAverageStandardDeviationTime	 
BodyGyroscopeMagnitudeAverageStandardDeviationTime	 
BodyGyroscopeJerkMagnitudeAverageStandardDeviationTime	 
BodyAccelerometerAverageStandardDeviationFrequencyXAxis	 
BodyAccelerometerAverageStandardDeviationFrequencyYAxis	 
BodyAccelerometerAverageStandardDeviationFrequencyZAxis	 
BodyAccelerometerJerkAverageStandardDeviationFrequencyXAxis	  
BodyAccelerometerJerkAverageStandardDeviationFrequencyYAxis	  
BodyAccelerometerJerkAverageStandardDeviationFrequencyZAxis	  
BodyGyroscopeAverageStandardDeviationFrequencyXAxis	 
BodyGyroscopeAverageStandardDeviationFrequencyYAxis	 
BodyGyroscopeAverageStandardDeviationFrequencyZAxis	 
BodyAccelerometerMagnitudeAverageStandardDeviationFrequency	 
BodyBodyAccelerometerJerkMagnitudeAverageStandardDeviationFrequency	 
BodyBodyGyroscopeMagnitudeAverageStandardDeviationFrequency	 
BodyBodyGyroscopeJerkMagnitudeAverageStandardDeviationFrequency 

The column names are in Camel Case instead of all lower case as is preferable in a tidy dataset.  I chose Camel Case because it is easier to read when the variable names are long.
