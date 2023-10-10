datapath = 'UCI HAR Dataset'
list.files(datapath,recursive=TRUE)

# Reading training tables - x_train, y_train and subject_train
xtrain = read.table(file.path(datapath, "train", "X_train.txt"),header = FALSE)
ytrain = read.table(file.path(datapath, "train", "y_train.txt"),header = FALSE)
subject_train = read.table(file.path(datapath, "train", "subject_train.txt"),header = FALSE)

# Reading testing tables - x_test, y_test and subject_test
xtest = read.table(file.path(datapath, "test", "X_test.txt"),header = FALSE)
ytest = read.table(file.path(datapath, "test", "y_test.txt"),header = FALSE)
subject_test = read.table(file.path(datapath, "test", "subject_test.txt"),header = FALSE)

# Reading feature data
features = read.table(file.path(datapath, "features.txt"),header = FALSE)

#Reading activity label data
activityLabels = read.table(file.path(datapath, "activity_labels.txt"),header = FALSE)


# Add labesl to xtrain ,ytrain, subject train
colnames(xtrain) = features[,2]
colnames(ytrain) = "activityId"
colnames(subject_train) = "subjectId"

# Add labesl to xtrain ,ytrain, subject train
colnames(xtest) = features[,2]
colnames(ytest) = "activityId"
colnames(subject_test) = "subjectId"

# Change labels for activitylabels
colnames(activityLabels) <- c('activityId','activityType')


# 1
# Merge train and test data
merge_train_data = cbind(ytrain, subject_train, xtrain)
merge_test_data = cbind(ytest, subject_test, xtest)
#Create the main data table by merging both train and test tables
combined_data = rbind(merge_train_data, merge_test_data)
dim(combined_data)


# 2
# Extracts only the measurements on the mean and standard deviation for each measurement

# Get all columns names from merged data
allColNames = colnames(combined_data)

# create subset for calculating mean and standard deviation of the activityId and subjectId
mean_and_std = (grepl("activityId" , allColNames) | grepl("subjectId" , allColNames) | grepl("mean.." , allColNames) | grepl("std.." , allColNames))

# get mean and standard deviation values for all activityId and subjectId
mean_and_sd_values <- combined_data[ , mean_and_std == TRUE]


# 3
# Use descriptive activity names to name the activities in the data set
setActivityNames = merge(mean_and_sd_values, activityLabels, by='activityId', all.x=TRUE)
colnames(setActivityNames)


# 4
# Appropriately labels the data set with descriptive variable names
# created variables with appropriate label names
names(setActivityNames)

names(setActivityNames)<-gsub("Acc", "Accelerometer", names(setActivityNames))
names(setActivityNames)<-gsub("Gyro", "Gyroscope", names(setActivityNames))
names(setActivityNames)<-gsub("BodyBody", "Body", names(setActivityNames))
names(setActivityNames)<-gsub("Mag", "Magnitude", names(setActivityNames))
names(setActivityNames)<-gsub("^t", "Time", names(setActivityNames))
names(setActivityNames)<-gsub("^f", "Frequency", names(setActivityNames))
names(setActivityNames)<-gsub("tBody", "TimeBody", names(setActivityNames))
names(setActivityNames)<-gsub("-mean()", "Mean", names(setActivityNames), ignore.case = TRUE)
names(setActivityNames)<-gsub("-std()", "STD", names(setActivityNames), ignore.case = TRUE)
names(setActivityNames)<-gsub("-freq()", "Frequency", names(setActivityNames), ignore.case = TRUE)
names(setActivityNames)<-gsub("angle", "Angle", names(setActivityNames))
names(setActivityNames)<-gsub("gravity", "Gravity", names(setActivityNames))

names(setActivityNames)


# 5
# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
# creating a new tidy dataset from the above data

# convert datatype of subjectId to numeric
setActivityNames$subjectId <- as.numeric(as.character(setActivityNames$subjectId))

# create new dataset with all numeric columns
final_data <- setActivityNames[,-82]

# take average of all columns
library(dplyr)
avg_of_columns <- final_data %>%
  group_by(final_data$subjectId, final_data$activityId) %>%
  summarise_all(mean)

# Save the newly created dataset
write.table(final_data, file = "finaldata.txt", row.names = FALSE)
write.table(avg_of_columns, "newtidydata.txt", row.names = FALSE)