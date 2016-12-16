Coodebook (HumanActivityDataSet)

run_analysis.R script

input Data

The input data containts the following data files:

X_train.txt contains variable features that are intended for training
y_train.txt contains the activities corresponding to X_train.txt
subject_train.txt contains information on the subjects from whom data is collected
X_test.txt contains variable features that are intended for testing
y_test.txt contains the activities corresponding to X_test.txt
subject_test.txt contains information on the subjects from whom data is collected
activity_labels.txt contains metadata on the different types of activities
features.txt contains the name of the features in the data sets
analysis & transformation

step by step transformation is explained in the run_analysis.R script

downloading and extracting the zip file
reading input Data into the R
merging training and test data sets together for subjects, activities and features independently
Indices of columns that contain std or mean are extracted and used later
renaming column names in the features data set (from featureNames)
renaming activity variables (from activityLabels)
merging features, activity and subject into tidyData
renaming acronyms in variable names in columns (like 'Acc', 'Gyro', 'Mag', 't' and 'f' are replaced with descriptive labels such as 'Accelerometer', 'Gyroscpoe', 'Magnitude', 'Time' and 'Frequency')
data is saved to file (HumanActivityDataSet.txt)
averages of each variable for each activity and each subject is extracted to the separate data set
extracted data set is saved as (HumanActivityDataSet-Small.txt)
output

tidyData - full data stack with merged Test and Training datasets
HumanActivityDataSet.txt file - tabular separated data
HumanActivityDataSet-Small.txt - tabular separated data with the averages of each variable for each activity and each subject
names of the columns

names(tidyData) [1] "Subject" "Activity"
[3] "Time Body Accelerometer Mean-X" "Time Body Accelerometer Mean-Y"
[5] "Time Body Accelerometer Mean-Z" "Time Body Accelerometer STD-X"
[7] "Time Body Accelerometer STD-Y" "Time Body Accelerometer STD-Z"
[9] "Time Gravity Accelerometer Mean-X" "Time Gravity Accelerometer Mean-Y"
[11] "Time Gravity Accelerometer Mean-Z" "Time Gravity Accelerometer STD-X"
[13] "Time Gravity Accelerometer STD-Y" "Time Gravity Accelerometer STD-Z"
[15] "Time Body Accelerometer Jerk Mean-X" "Time Body Accelerometer Jerk Mean-Y"
[17] "Time Body Accelerometer Jerk Mean-Z" "Time Body Accelerometer Jerk STD-X"
[19] "Time Body Accelerometer Jerk STD-Y" "Time Body Accelerometer Jerk STD-Z"
[21] "Time Body Gyroscope Mean-X" "Time Body Gyroscope Mean-Y"
[23] "Time Body Gyroscope Mean-Z" "Time Body Gyroscope STD-X"
[25] "Time Body Gyroscope STD-Y" "Time Body Gyroscope STD-Z"
[27] "Time Body Gyroscope Jerk Mean-X" "Time Body Gyroscope Jerk Mean-Y"
[29] "Time Body Gyroscope Jerk Mean-Z" "Time Body Gyroscope Jerk STD-X"
[31] "Time Body Gyroscope Jerk STD-Y" "Time Body Gyroscope Jerk STD-Z"
[33] "Time Body Accelerometer Magnitude Mean" "Time Body Accelerometer Magnitude STD"
[35] "Time Gravity Accelerometer Magnitude Mean" "Time Gravity Accelerometer Magnitude STD"
[37] "Time Body Accelerometer Jerk Magnitude Mean" "Time Body Accelerometer Jerk Magnitude STD"
[39] "Time Body Gyroscope Magnitude Mean" "Time Body Gyroscope Magnitude STD"
[41] "Time Body Gyroscope Jerk Magnitude Mean" "Time Body Gyroscope Jerk Magnitude STD"
[43] "Frequency Body Accelerometer Mean-X" "Frequency Body Accelerometer Mean-Y"
[45] "Frequency Body Accelerometer Mean-Z" "Frequency Body Accelerometer STD-X"
[47] "Frequency Body Accelerometer STD-Y" "Frequency Body Accelerometer STD-Z"
[49] "Frequency Body Accelerometer Mean Frequency-X" "Frequency Body Accelerometer Mean Frequency-Y"
[51] "Frequency Body Accelerometer Mean Frequency-Z" "Frequency Body Accelerometer Jerk Mean-X"
[53] "Frequency Body Accelerometer Jerk Mean-Y" "Frequency Body Accelerometer Jerk Mean-Z"
[55] "Frequency Body Accelerometer Jerk STD-X" "Frequency Body Accelerometer Jerk STD-Y"
[57] "Frequency Body Accelerometer Jerk STD-Z" "Frequency Body Accelerometer Jerk Mean Frequency-X"
[59] "Frequency Body Accelerometer Jerk Mean Frequency-Y" "Frequency Body Accelerometer Jerk Mean Frequency-Z"
[61] "Frequency Body Gyroscope Mean-X" "Frequency Body Gyroscope Mean-Y"
[63] "Frequency Body Gyroscope Mean-Z" "Frequency Body Gyroscope STD-X"
[65] "Frequency Body Gyroscope STD-Y" "Frequency Body Gyroscope STD-Z"
[67] "Frequency Body Gyroscope Mean Frequency-X" "Frequency Body Gyroscope Mean Frequency-Y"
[69] "Frequency Body Gyroscope Mean Frequency-Z" "Frequency Body Accelerometer Magnitude Mean"
[71] "Frequency Body Accelerometer Magnitude STD" "Frequency Body Accelerometer Magnitude Mean Frequency"
[73] "Frequency Body Accelerometer Jerk Magnitude Mean" "Frequency Body Accelerometer Jerk Magnitude STD"
[75] "Frequency Body Accelerometer Jerk Magnitude Mean Frequency" "Frequency Body Gyroscope Magnitude Mean"
[77] "Frequency Body Gyroscope Magnitude STD" "Frequency Body Gyroscope Magnitude Mean Frequency"
[79] "Frequency Body Gyroscope Jerk Magnitude Mean" "Frequency Body Gyroscope Jerk Magnitude STD"
[81] "Frequency Body Gyroscope Jerk Magnitude Mean Frequency" "Angle (TimeBody Accelerometer Mean,Gravity )"
[83] "Angle (TimeBody Accelerometer Jerk Mean),Gravity Mean)" "Angle (TimeBody Gyroscope Mean,Gravity Mean)"
[85] "Angle (TimeBody Gyroscope Jerk Mean,Gravity Mean)" "Angle (X,Gravity Mean)"
[87] "Angle (Y,Gravity Mean)" "Angle (Z,Gravity Mean)" '''
"Subjet"

Tested subjects between 1 and 30

"Activity""

levels(factor(tidyData$Activity))
[1] "walking" "walking upstairs" "walking downstairs" "sitting" "standing" "laying"
