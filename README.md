# HumanActivityDataSet
Tidy data set collected from the accelerometers from the Samsung Galaxy S smartphone

## Goal
The goal of the project is to create a tidy data set with descriptive names and selected columns (mean, standard deviation) from the given dataset

## Original Dataset
"Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors."
url (proejct description) http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
url (zip file) https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Installed R Libraries
Libraries needed for the analysis: 
- dplyr
- data.table

## Steps to reproduce the analysis
1. set working directory to the folder where analysis will be performed (where the scripts are saved)
2. there is no folder or zip file named "Dataset"
3. call "run_analysis.R" script

## Analysis
- automatically download dataset, if the zip file is not already present in the folder
- automatically extract the dataset.zip file if the "Dataset" directory is not alrady present
- perform the analysis explained in the codebook

