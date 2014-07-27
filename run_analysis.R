run_analysis <- function() {
  
  ## Load special libraries
  library(plyr)
  library(stringr)

  ## Create the Activity Label and feature label Lookup tables
  activityLabels <- read.table("activity_labels.txt",header=FALSE)
  featureLabels <- read.table("features.txt",header=FALSE)
  
  #####################################################################
  ######## Start putting together and cleaning the Test data ##########
  #####################################################################
  
  ## Get all the elements needed for the test data set
  measures <- read.table("test/X_test.txt",header=FALSE)
  colnames(measures) <- featureLabels[,2]  ## Set the column names
  
  ## Pull the subject and activity data
  subjects <- read.table("test/subject_test.txt",header=FALSE)
  testActivityLabels <- read.table("test/y_test.txt",header=FALSE)
  
  ## Join the activity labels with the activities themselves
  testActivityLabels <- join(testActivityLabels,activityLabels, by="V1")
  
  ## Merge the test data set elements into a single data set
  testData <- cbind(testActivityLabels, subjects ,measures)
  
  ## Only pull the mean and Standard Deviation measures
  meanCols <- grep("mean()",colnames(testData),fixed=TRUE)
  stdCols <- grep("std()", colnames(testData),fixed=TRUE)
  testData <- testData[,c(2,3,meanCols,stdCols)]
  
  #####################################################################
  ######## Start putting together and cleaning the Training data ######
  #####################################################################
  
  ## Get all the elements needed for the train data set
  measures <- read.table("train/X_train.txt",header=FALSE)
  colnames(measures) <- featureLabels[,2]  ## Set the column names
  
  ## Pull the subject and activity data
  subjects <- read.table("train/subject_train.txt",header=FALSE)
  trainActivityLabels <- read.table("train/y_train.txt",header=FALSE)
  
  ## Join the activity labels with the activities themselves
  trainActivityLabels <- join(trainActivityLabels,activityLabels, by="V1")
  
  ## Merge the test data set elements into a single data set
  trainData <- cbind(trainActivityLabels,subjects,measures)
  
  ## Only pull the mean and Standard Deviation measures
  meanCols <- grep("mean()",colnames(trainData),fixed=TRUE)
  stdCols <- grep("std()", colnames(trainData),fixed=TRUE)
  trainData <- trainData[,c(2,3,meanCols,stdCols)]
  
  #################################################################################
  ######## Merge the test and the training data into a single data frame ##########
  #################################################################################  
  fullData <- rbind(testData,trainData)
  
  names(fullData)[2] <- "SubjectID"
  names(fullData)[1] <- "Activity"
  
  ## Get the mean of all variables by Activity and Subject ##
  tidyData <- aggregate(fullData[,3:68],list(activity=fullData$Activity, subject=fullData$SubjectID), mean)

  ## Clean the variable names in the final tidy dataset
  ## Loop through each variable and build out a new name
  for (i in 3:68) {
    col_name <- names(tidyData)[i]
    
    if (is.na(str_locate(col_name,"t")[1]))
      f_or_t <- "Frequency"
    else if (str_locate(col_name,"t")[1] == 1)
      f_or_t <- "Time"
    else
      f_or_t <- "Frequency"
    
    if (length(grep("Acc",col_name)) == 1 )
      fun <- "Accelerometer"
    else if (length(grep("Gyro", col_name)) == 1)
      fun <- "Gyroscope"
    else
      fun <- ""
    
    if (length(grep("mean", col_name)) == 1)
      meas <- "AverageMean"
    else if (length(grep("std",col_name)) == 1)
      meas <- "AverageStandardDeviation"
    else 
      meas <- ""
    
    if (length(grep("BodyBody", col_name)) == 1)
      base <- "BodyBody"
    else if (length(grep("Body", col_name)) == 1)
      base <- "Body"
    else if (length(grep("Gravity", col_name)) == 1)
      base <- "Gravity"
    else
      base <= ""
    
    if (length(grep("Jerk", col_name)) == 1)
      base2 <- "Jerk"
    else
      base2 <- ""
    
    if (length(grep("Mag", col_name)) == 1)
      mag <- "Magnitude"
    else 
      mag <- ""
    
    if (length(grep("X", col_name)) == 1)
      axis <- "XAxis" 
    else if (length(grep("Y", col_name)) == 1)
      axis <- "YAxis"
    else if (length(grep("Z", col_name)) == 1)
      axis <- "ZAxis"
    else
      axis <- ""
    
    ## put together the new name
    names(tidyData)[i] <- str_c(base,fun,base2,mag,meas,f_or_t,axis,sep="")
    
  } 
  
  ## Write out the final tiday dataset to a text file
  write.table(tidyData,"humanActivityRecognition.txt", sep=",", row.names=F)

}