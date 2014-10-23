a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md.


A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 


The data was downloaded from the link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.
It was unpacked to the working R directory.

The R script "run_analysis.R" does the following:

STEP 1. "Merges the training and the test sets to create one data set."
First, the corresponding data files are read into R using read.table() function and asigned to "train" and "test" objects, accordingly.
Second, the two objects/dataframes are merged into one, named "united", using rbind() function.

STEP 2. "Extracts only the measurements on the mean and standard deviation for each measurement. "

STEP 3. "Uses descriptive activity names to name the activities in the data set" 

STEP 4. "Appropriately labels the data set with descriptive variable names" was implemented following the week 4 lecture "Editing Text Variables" guidelines and the advice of TA's in the following forum thread: https://class.coursera.org/getdata-008/forum/thread?thread_id=131:
	1. The variable names are descriptive, full words, not abbreviations
	2. Lowercase
	3. No white spaces, underscores
	4. I also eliminated parenthesis and hyphens for keeping consistency with the lecture guidlines and tidiness (as I understand it).

gsub() function (with regular expression pattern replacement) was used to make the needed transformations.

STEP 5. "From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject."
