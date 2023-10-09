# The original data was transformed by performing the following steps:
1. Merging the training and the test sets to create one data set.
2. Extracting only the measurements on the mean and standard deviation for each measurement.
3. Using descriptive activity names to name the activities in the data set
4. Appropriately labeling the data set with descriptive activity names.
5. Creating a second, independent tidy data set with the average of each variable for each activity and each subject.

# About the R Script
File with R code "run_analysis.R" perform the above mentioned 5 steps 

# About Variables
`x_train`, `y_train`, `x_test`, `y_test`, `subject_train` and `subject_test` contain the data from the downloaded files.
`merge_train_data`, `merge_test_data` merges the train and test data
`combined_data` is the combined dataset obtained after merging `merge_train_data`, `merge_test_data` datasets
`allColNames` contains the names of all columns
`setActivityNames` contains the mean and standard deviation values for all columns
`final_data` contains all the columns with numeric values
`avg_of_columns` contains the avlerage calculated for all columns
