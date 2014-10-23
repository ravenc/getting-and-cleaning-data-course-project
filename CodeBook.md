# Coursera Getting and Cleaning Data class

## Course Project Codebook


The original study data was downloaded from the link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. (A full description of the study is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones .)
It was unpacked to the working R directory.

The R script `run_analysis.R` does the following:

## STEP 1. "Merges the training and the test sets to create one data set."

First, the corresponding data files are read into R using `read.table()` function and asigned to `train` and `test` objects, accordingly.
Second, the two objects/dataframes are merged into one, named `united`, using `rbind()` function.


Read in the data from files: `X_train`, `X_test`, `Y_train`, `Y_test`, `features.txt`, `activities.txt`, 

* The first variable "subject" is the number of the subject who performed the activity. There are 30 subjects, numbered from "1" to "30".

* The second variable "activity" is the activity performed by the subject. There are six types of activity:  
	* Walking
	* Walking Upstairs
	* Walking Downstairs
	* Sitting
	* Standing
	* Laying

* The remaining 66 variables are the extracted measurements on the mean and standard deviation for each measurment (named as in the original study `features_info.txt` file): 
	* tBodyAcc-XYZ
	* tGravityAcc-XYZ
	* tBodyAccJerk-XYZ
	* tBodyGyro-XYZ
	* tBodyGyroJerk-XYZ
	* tBodyAccMag
	* tGravityAccMag
	* tBodyAccJerkMag
	* tBodyGyroMag
	* tBodyGyroJerkMag
	* fBodyAcc-XYZ
	* fBodyAccJerk-XYZ
	* fBodyGyro-XYZ
	* fBodyAccMag
	* fBodyAccJerkMag
	* fBodyGyroMag
	* fBodyGyroJerkMag

where '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.



## STEP 2. "Extracts only the measurements on the mean and standard deviation for each measurement."

Mean and standard deviation measurments there extracted using `subset()` and `grepl()` functions.

1. `meanFreq` measurements, such as `fBodyAcc-meanFreq()-X` and `fBodyGyro-meanFreq()-Y`, defined in the original study `features_info.txt` file as "weighted average of the frequency components to obtain a mean frequency" were not extracted because, in my understanding, these are different from mean variables.
1. `angle` measurements, such as `angle(tBodyAccMean,gravity)` and `angle(X,gravityMean)`,  defined in the original study `features_info.txt` file as "angle between to vectors" were not extracted because, in my understanding, these are different from mean variables.

66 features were extracted, out of a total of 561.


## STEP 3. "Uses descriptive activity names to name the activities in the data set" 
Activity names from `activity_labels.txt` file were assigned using gsub() function.


## STEP 4. "Appropriately labels the data set with descriptive variable names" 

* The following naming convention was followed:
1. The variable names are descriptive, full words, not abbreviations (as per week 4 lecture, also CTAs' reccommendations in the class discussion forum: https://class.coursera.org/getdata-008/forum/thread?thread_id=131);
1. CamelCase (my prefered way for easier readability);
1. `BodyBody` was changed to `Body`;
1. No white spaces, underscores, parenthesis or hyphens.

`gsub()` function (with regular expression pattern replacement) was used to make the needed variable names' transformations.

* Examples:
	* `tBodyAcc-mean()-X` was transformed to `timeBodyAccelerationMeanX`
	* `fBodyBodyGyroJerkMag-std()` was transformed to `frequencyBodyGyroscopeJerkMagnitudeStandardDeviation`


After the above mentioned tranformations the data set has 10299 rows (observations) and 68 columns (variables).

## STEP 5. "From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject."

First, `dplyr()` package was used: function `group_by()` to group the data by both subject and activity; and then function `summarise_each()` to calculate the average of each variable for each activity and each subject.
The resulting set has 180 rows (30 subjects * 6 activities) and 68 columns (subject, activity and 66 extracted features/variables).

Second, the result of the first part was saved to a new file `course-project.txt` in the working direcory using `write.table()` function.

===

The new tidy set file `course-project.txt` can be read into R using `read.table("course-project.txt")`.
The R script can be downloaded to your computer's R working directory and then can run it by the following command: `source('./run_analysis.R')`.
