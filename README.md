# HumanActivityRecognitionUsingSamrtPhoneInR

The project's purpose is to assess your data collection, cleaning, and manipulation skills, with the aim of creating a tidy dataset for future analysis. Peer evaluation based on specific criteria will determine your grade. To complete the project, you must submit a tidy dataset, a GitHub repository containing your analysis script, and a CodeBook.md explaining variables, data, and transformations. Additionally, include a README.md in the repository to provide an overview of your scripts. The project involves using data from accelerometers in Samsung Galaxy S smartphones, which is relevant to the field of wearable computing. This data is crucial for developing advanced algorithms in companies like Fitbit, Nike, and Jawbone Up. More information about the data can be found on the course website.

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The individual should create an R script named "run_analysis.R" to perform the following tasks:

1. Merge the training and test sets into a single data set.
2. Extract only the measurements related to the mean and standard deviation for each measurement.
3. Assign descriptive activity names to label the activities in the data set.
4. Appropriately label the data set with descriptive variable names.
5. Generate a second, independent tidy data set from the data set obtained in step 4. This new dataset should contain the average of each variable for each activity and each subject.
In the "run_analysis.R" script, each step should be implemented.

This file 'run_analysis.R' contains all the code to perform the analyses described in the 5 steps. They can be launched in RStudio by just importing the file.

# About this R script
File with R code "run_analysis.R" perform 5 following steps ():
## 1.Data Preparation:
  - Combine training and test sets into one dataset.
  - Read various data files, including training and testing tables, feature vectors, and activity labels.
  - Assign suitable column names to the dataset.
  - Merge all the collected data into a single, comprehensive dataset.

## 2. Feature Selection:
  - Identify and extract measurements associated with mean and standard deviation.
  - Retrieve column names.
  - Create a vector to specify which columns correspond to IDs, means, and standard deviations.
  - Extract the necessary data based on the identified columns.

## 3. Activity Labeling:
  - Label the activities in the dataset using descriptive names.

## 4.Variable Labeling:
  - Label the dataset's variables with clear and descriptive names.

## 5.Tidy Data Creation:
  - Create a second, independent tidy dataset.
  - Calculate the average of each variable for each activity and subject.
  - Generate this summary dataset.
  - Save the resulting tidy dataset as a text file for future analysis.
