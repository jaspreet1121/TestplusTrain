# Codebook
run_analysis.R script

## input Data
The input data containts the following data files:
- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
The following files are available for the train and test data. Their descriptions are equivalent. 
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 


## analysis & transformation
step by step transformation is explained in the run_analysis.R script
- downloading and extracting the zip file
- reading input Data into the R
- merging training and test data sets together for subjects, activities and features independently
- Indices of columns that contain std or mean are extracted and used later 
- renaming activity variables (from activityLabels)
- merging features, activity and subject into tidyData
- data is saved to file (result.txt)

## output
- "result.txt" contains the required dataset

## names of the columns

> names(result)
 [1] "Subject_Number"                  "tBodyAcc-mean()-X"               "tBodyAcc-mean()-Y"              
 [4] "tBodyAcc-mean()-Z"               "tGravityAcc-mean()-X"            "tGravityAcc-mean()-Y"           
 [7] "tGravityAcc-mean()-Z"            "tBodyAccJerk-mean()-X"           "tBodyAccJerk-mean()-Y"          
[10] "tBodyAccJerk-mean()-Z"           "tBodyGyro-mean()-X"              "tBodyGyro-mean()-Y"             
[13] "tBodyGyro-mean()-Z"              "tBodyGyroJerk-mean()-X"          "tBodyGyroJerk-mean()-Y"         
[16] "tBodyGyroJerk-mean()-Z"          "tBodyAccMag-mean()"              "tGravityAccMag-mean()"          
[19] "tBodyAccJerkMag-mean()"          "tBodyGyroMag-mean()"             "tBodyGyroJerkMag-mean()"        
[22] "fBodyAcc-mean()-X"               "fBodyAcc-mean()-Y"               "fBodyAcc-mean()-Z"              
[25] "fBodyAcc-meanFreq()-X"           "fBodyAcc-meanFreq()-Y"           "fBodyAcc-meanFreq()-Z"          
[28] "fBodyAccJerk-mean()-X"           "fBodyAccJerk-mean()-Y"           "fBodyAccJerk-mean()-Z"          
[31] "fBodyAccJerk-meanFreq()-X"       "fBodyAccJerk-meanFreq()-Y"       "fBodyAccJerk-meanFreq()-Z"      
[34] "fBodyGyro-mean()-X"              "fBodyGyro-mean()-Y"              "fBodyGyro-mean()-Z"             
[37] "fBodyGyro-meanFreq()-X"          "fBodyGyro-meanFreq()-Y"          "fBodyGyro-meanFreq()-Z"         
[40] "fBodyAccMag-mean()"              "fBodyAccMag-meanFreq()"          "fBodyBodyAccJerkMag-mean()"     
[43] "fBodyBodyAccJerkMag-meanFreq()"  "fBodyBodyGyroMag-mean()"         "fBodyBodyGyroMag-meanFreq()"    
[46] "fBodyBodyGyroJerkMag-mean()"     "fBodyBodyGyroJerkMag-meanFreq()" "tBodyAcc-std()-X"               
[49] "tBodyAcc-std()-Y"                "tBodyAcc-std()-Z"                "tGravityAcc-std()-X"            
[52] "tGravityAcc-std()-Y"             "tGravityAcc-std()-Z"             "tBodyAccJerk-std()-X"           
[55] "tBodyAccJerk-std()-Y"            "tBodyAccJerk-std()-Z"            "tBodyGyro-std()-X"              
[58] "tBodyGyro-std()-Y"               "tBodyGyro-std()-Z"               "tBodyGyroJerk-std()-X"          
[61] "tBodyGyroJerk-std()-Y"           "tBodyGyroJerk-std()-Z"           "tBodyAccMag-std()"              
[64] "tGravityAccMag-std()"            "tBodyAccJerkMag-std()"           "tBodyGyroMag-std()"             
[67] "tBodyGyroJerkMag-std()"          "fBodyAcc-std()-X"                "fBodyAcc-std()-Y"               
[70] "fBodyAcc-std()-Z"                "fBodyAccJerk-std()-X"            "fBodyAccJerk-std()-Y"           
[73] "fBodyAccJerk-std()-Z"            "fBodyGyro-std()-X"               "fBodyGyro-std()-Y"              
[76] "fBodyGyro-std()-Z"               "fBodyAccMag-std()"               "fBodyBodyAccJerkMag-std()"      
[79] "fBodyBodyGyroMag-std()"          "fBodyBodyGyroJerkMag-std()"      "Activity" 

## "Subject"
There are 30 test subjects 9 in test dataset and 21 in train dataset

## "Activity""

There are six levels of activities:-
 "walking"            
 "walking upstairs"   
 "walking downstairs" 
 "sitting"            
 "standing"           
 "laying"  
