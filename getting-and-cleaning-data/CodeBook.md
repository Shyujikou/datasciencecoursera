The Code Book
=============

This document contains the explanation of the data and transformations that the script `run_analysis.R` performs to clean up the original data.

### Original Dataset

The original dataset consists of several separated files located in different locations. The script reads the following files:

* `/test/X_test.txt`: values, test dataset.
* `/test/y_test.txt`: activities, test dataset.
* `/test/subject_test.txt`: subjects (i.e. volunteers), test dataset.
* `/train/X_train.txt`: values, train dataset.
* `/train/y_train.txt`: activities, train dataset.
* `/train/subject_train.txt`: subjects (i.e. volunteers), train dataset.
* `/features.txt`: list of features, used to label the columns.
* `/activity_labels.txt`: list of activities, used to label the activities.

### Clean-up Process

According to the course project instructions, the following process is applied to the original dataset.

1. "Extracts only the measurements on the mean and standard deviation for each measurement".

    We can look in `/features.txt` for items containing `mean` or `std` (*n* = 64) and create a list of indices to mark the columns to be extracted and then extract these columns from both test and train datasets.

2. "Merges the training and the test sets to create one data set".

    As the two datasets share exactly the same data structure, we can simply use `rbind()` to merge them.

3. "Creates a second, independent tidy data set with the average of each variable for each activity and each subject".

    To achieve this, we need to group the data by subject and activity, and apply `mean()` to each group of data. There are many ways to achieve this, in this script `aggregate()` function is used for this purpose.

4. "Uses descriptive activity names to name the activities in the data set".

    We can read the list of activities from `/activity_labels.txt` and subtitute the activity IDs with their descriptive names in the summarized dataset.

### Tidy Dataset

The tidy dataset `tidy_dataset.txt` contains 66 columns. The first two columns are `Subject` and `Activity`, and the remaining 64 columns are the average values of extracted columns from the original dataset.

The tidy dataset is generated with `write.table()`. Column are separated with white spaces.