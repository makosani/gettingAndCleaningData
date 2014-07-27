==================================================================
Human Activity Recognition Using Smartphones Dataset - Version 1
==================================================================

One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data for this project represents data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The raw dataset was obtained from the following site: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The zip file includes a README.txt which explains the experiment and the raw data collected.  Please read this first.

----------------------------------------------------------------------------
Average Mean and Standard Deviation Measurements by activity and subject
----------------------------------------------------------------------------
Using the raw data collected from the experiment, our goal was to create a tidy data set which includes the average of each mean and standard deviation measurement by activity and subject.

--------------------------------------------------------------------------
Files included in this data set 
--------------------------------------------------------------------------

* README.md
* CodeBook.md - described the dimensions and measures in the new tidy dataset and details the transformation between the raw and tidy dataset
* run_analysis.R - Function that takes the raw dataset and creates the tidy dataset as described in the previous section
* humanActivityRecognition.txt - tidy dataset as described in CodeBook.md

--------------------------------------------------------------------------
Instructions to generate the final tidy dataset called humanActivityRecognition.txt
--------------------------------------------------------------------------

1. Download the raw data set from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
2. After extracting the zip file, you will have a folder called "UCI HAR Dataset". Store run_analysis.R in this folder.
3. Set your working directory to "UCI HAR Dataset"
4. Make sure the plyr and stringr libraries are installed and available
5. Run the function run_analysis()
6. After the function completes, you will see the humanActivityRecognition.txt file stored in the "UCI HAR Dataset"

