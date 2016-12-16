# load libraries
# ***********************************
library(data.table)
library(dplyr)

# setting path & url of the dataset 
# ***********************************
path <- getwd()
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
f <- "Dataset"

# download the file if it is not already in the folder
# ***********************************
if (!file.exists(paste0(f,".zip"))) {
    # download file
    print("downloading dataset zip file from the source url")
    download.file(url, file.path(path, paste0(f,".zip")))
} else {
    print("zip file is already in folder")
}

# unziping the file
# ***********************************
if (file.exists(f)){
    print("files already unzipped")
} else {
    print("unzipping the file")
    unzip(paste0(f,".zip"),exdir=f) 
}

# getting the name of the zipped directory
# ***********************************
filsInDataFolder <- list.files (f)

# read Supporting Metadata
# ***********************************
print("setting Meta data")
featureNames <- read.table(paste0(f, "/", filsInDataFolder[1],"/features.txt"))
activityLabels <- read.table(paste0(f, "/",filsInDataFolder[1],"/activity_labels.txt"), header = FALSE)

# edit activity labels -- to lower case and without "_"
print("editting Activity Labels")
setnames(activityLabels, names(activityLabels), c("activityNum", "activityName"))
activityLabels <- mutate_each(activityLabels, funs(tolower))
activityLabels$activityName <- sub("_", " ", activityLabels$activityName)

# read train data
# ***********************************
print("setting Train set")
subjectTrain <- read.table(paste0(f, "/", filsInDataFolder[1],"/train/subject_train.txt"), header = FALSE)
activityTrain <- read.table(paste0(f, "/", filsInDataFolder[1],"/train/y_train.txt"), header = FALSE)
featuresTrain <- read.table(paste0(f, "/", filsInDataFolder[1],"/train/x_train.txt"), header = FALSE)

# read test data
# ***********************************
print("setting Test set")
subjectTest <- read.table(paste0(f, "/", filsInDataFolder[1],"/test/subject_test.txt"), header = FALSE)
activityTest <- read.table(paste0(f, "/", filsInDataFolder[1],"/test/y_test.txt"), header = FALSE)
featuresTest <- read.table(paste0(f, "/", filsInDataFolder[1],"/test/x_test.txt"), header = FALSE)


# merge the training and the test sets
# ***********************************
print("merging test and training sets")
subject <- rbind(subjectTrain, subjectTest)
activity <- rbind(activityTrain, activityTest)
features <- rbind(featuresTrain, featuresTest)

# name the column names from the features file in variable featureNames
# ***********************************
colnames(features) <- t(featureNames[2])

# select mean and std columns
# ***********************************
print("selecting columns in Features with MEAN and STD")
columnsWithMeanSTD <- grep(".*Mean.*|.*Std.*", names(features), ignore.case=TRUE)
requiredColumnsFeature <- c(columnsWithMeanSTD)
extractedDataFeature <- features[,requiredColumnsFeature]

# add activity and subject as a column to features
# ***********************************
print("merging activity, subject & features")
colnames(activity) <- "Activity"
colnames(subject) <- "Subject"
tidyData <- cbind(subject,activity, extractedDataFeature)

# change activity in tidyData to names
# ***********************************
print("renaming variables and names")
tidyData$Activity <- factor(tidyData$Activity, levels=activityLabels$activityNum, labels=activityLabels$activityName)
names(tidyData)<-gsub("^t", "Time ", names(tidyData))
names(tidyData)<-gsub("^f", "Frequency ", names(tidyData))
names(tidyData)<-gsub("\\(\\)", "", names(tidyData))
names(tidyData)<-gsub("tBody", "TimeBody ", names(tidyData))
names(tidyData)<-gsub("angle", "Angle ", names(tidyData))
names(tidyData)<-gsub("-mean", "Mean", names(tidyData), ignore.case = TRUE)
names(tidyData)<-gsub("-std", "STD", names(tidyData), ignore.case = TRUE)
names(tidyData)<-gsub("-freq", "Frequency", names(tidyData), ignore.case = TRUE)
names(tidyData)<-gsub("MeanFreq", "Mean Frequency", names(tidyData), ignore.case = TRUE)
names(tidyData)<-gsub("Acc", "Accelerometer ", names(tidyData))
names(tidyData)<-gsub("Gyro", "Gyroscope ", names(tidyData))
names(tidyData)<-gsub("Body", "Body ", names(tidyData))
names(tidyData)<-gsub("Body Body", "Body ", names(tidyData))
names(tidyData)<-gsub("gravity", "Gravity ", names(tidyData), ignore.case = TRUE)
names(tidyData)<-gsub("Mag", "Magnitude ", names(tidyData))
names(tidyData)<-gsub("Jerk", "Jerk ", names(tidyData))


# saving to file
# ***********************************
print("saving Tidy Data Set to file")
f <- file.path(path, "HumanActivityDataSet.txt")
write.table(tidyData, f, quote = FALSE, sep = "\t", row.names = FALSE)


# create average of each variable for each activity and each subject
# ***********************************
tidyData$Subject <- as.factor(tidyData$Subject)
tidyData <- data.table(tidyData)

print("creating separate data set for activity and subject")
tidyDataSmall <- aggregate(. ~Subject + Activity, tidyData, mean)

# ordering
tidyDataSmall <- tidyDataSmall[order(tidyDataSmall$Subject,tidyDataSmall$Activity),]

# saving to file
# ***********************************
print("saving Smaller Data Set to file")
write.table(tidyDataSmall, file = "HumanActivityDataSet-small.txt", row.names = FALSE)
