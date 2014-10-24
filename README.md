# Coursera Getting and cleaning data Course Project


This repository contains output files for Coursera Getting and Cleaning Data Course Project.

#### Prerequisites:
1. It is assumed that the original study dataset is already downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and unzipped into the working R directory.
1. The script uses a dplyr package. If the package is missing, it has to be downloaded and installed using `install.packages()` function.

The following make up the project output files:
------
### 1. README.md
This file itself.

### 2. Tidy dataset

The tidy dataset `CourseProject.txt` can be read into R using `read.table()` function with parameter "header=T".

### 3. R scipt `run_analysis.R`

The script can be run using `source()` function.

##### The script contains the code needed to perform a 5 step data transformation, as described in the project assignment: 
1. Merges the training and the test sets to create one data set.
1. Extracts only the measurements on the mean and standard deviation for each measurement. 
1. Uses descriptive activity names to name the activities in the data set
1. Appropriately labels the data set with descriptive variable names. 
1. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Note: Explanation of steps 3 and 4 transformations, which required subjective judgment/discretion, is given in the CodeBook.

A detailed step by step description of the code can be found in the script file `run_analysis.R` itself.

### 4. CodeBook

`CodeBook.md` gives a description of the variables, the data and the transformations made to clean up the data.
