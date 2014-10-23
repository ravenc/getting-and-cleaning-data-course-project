### Read in the measurement X test and train data and row-bind the two into a new object "united".
train <- read.table("UCI HAR Dataset\\train\\X_train.txt")  
test <- read.table("UCI HAR Dataset\\test\\X_test.txt")
united <- rbind(train, test)

### Read in the features and activity labels and assign them to new objects "feat" and "activity", accordingly.
feat <- read.table("UCI HAR Dataset\\features.txt")
activity <- read.table("UCI HAR Dataset\\activity_labels.txt")

### Read in the activity y test and train data and row-bind the two into a new object "y_united".
y_train <- read.table("UCI HAR Dataset\\train\\y_train.txt")
y_test <- read.table("UCI HAR Dataset\\test\\y_test.txt")
y_united <- rbind(y_train, y_test)

### Read in the subject test and train data and row-bind the two into a new object "s_united".
s_train <- read.table("UCI HAR Dataset\\train\\subject_train.txt")
s_test <- read.table("UCI HAR Dataset\\test\\subject_test.txt")
s_united <- rbind(s_train, s_test)

### Choose only a subset of features from "feat" based on regex "mean\\()|std" and assign it to 
# a new object "subsetted".
subsetted <- subset(feat, grepl("mean\\()|std", feat$V2))
### choose only the first column with features' numbers and assign to a new vector "colno".
colno <- as.vector(subsetted[,1])
### subset the combined measurement dataframe "united" by using subsetted features numbers "colno".
united <- united[, colno]

### STEP 3. Uses descriptive activity names to name the activities in the data set: 
### rename the activity integer ids to descriptive activity names/labels in a combined activity dataframe "y_united".
y_united[,1] <- gsub("1", "walking", y_united[,1])
y_united[,1] <- gsub("2", "walking upstairs", y_united[,1])
y_united[,1] <- gsub("3", "walking downstairs", y_united[,1])
y_united[,1] <- gsub("4", "sitting", y_united[,1])
y_united[,1] <- gsub("5", "standing", y_united[,1])
y_united[,1] <- gsub("6", "laying", y_united[,1])

### column-bind the combined subject, activity and combined measurement dataframes and assign to "tidyset"
tidyset <- cbind(s_united, y_united, united)

### STEP 4. Appropriately label the data set with descriptive variable names following a naming 
### convention described in the Codebook.md
names(tidyset) <- c("subject", "activity", as.vector(subsetted[,2]))
names(tidyset) <- gsub("^([A-Za-z]+)-([A-Za-z]+)\\(\\)-?([A-Za-z]?)", "\\1\\2\\3", names(tidyset), perl=T)
names(tidyset) <- gsub("^t", "time", names(tidyset))
names(tidyset) <- gsub("^f", "frequency", names(tidyset))
names(tidyset) <- gsub("Acc", "Acceleration", names(tidyset))
names(tidyset) <- gsub("Gyro", "Gyroscope", names(tidyset))
names(tidyset) <- gsub("Mag", "Magnitude", names(tidyset))
names(tidyset) <- gsub("std", "StandardDeviation", names(tidyset))
names(tidyset) <- gsub("BodyBody", "Body", names(tidyset))
names(tidyset) <- gsub("mean", "Mean", names(tidyset))

### load dplyr package
library("dplyr")
### group the dataframe both by subject and activity
by_s_a <- group_by(tidyset, subject, activity)

### calculate the mean of each variable for each subject and each activity and assign to "ave"
ave <- summarise_each(by_s_a, funs(mean))
### save the "ave" object to file named "course-project.txt"
write.table(ave, file="course-project.txt")

### The new tidy dataset can be read into R using the following code:
### data <- read.table("course-project.txt")
