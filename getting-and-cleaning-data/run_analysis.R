run_analysis <- function(path = "UCI HAR Dataset", output = "tidy_dataset.txt") {
  # Set a global option to disable auto converting strings to factors
  # when reading from a data file
  options(stringsAsFactors = FALSE)
  
  # Configurations: files to read
  f_x_test <- paste(path, "/test/X_test.txt", sep = "")
  f_y_test <- paste(path, "/test/y_test.txt", sep = "")
  f_s_test <- paste(path, "/test/subject_test.txt", sep = "")
  f_x_train <- paste(path, "/train/X_train.txt", sep = "")
  f_y_train <- paste(path, "/train/y_train.txt", sep = "")
  f_s_train <- paste(path, "/train/subject_train.txt", sep = "")
  f_features <- paste(path, "/features.txt", sep = "")
  f_activities <- paste(path, "/activity_labels.txt", sep = "")
  
  # Read files
  d_x_test <- read.table(f_x_test)
  d_y_test <- read.table(f_y_test)
  d_s_test <- read.table(f_s_test)
  d_x_train <- read.table(f_x_train)
  d_y_train <- read.table(f_y_train)
  d_s_train <- read.table(f_s_train)
  d_features <- read.table(f_features)
  d_activities <- read.table(f_activities)
  
  # Get descriptive labels: features and activities
  features <- d_features[,2]
  activities <- d_activities[,2]
  
  # Create a list of columns (mean and std) to be extracted
  cols_to_extract <- c(1,2,3,4,5,6,41,42,43,44,45,46,81,82,83,84,85,86,
                       121,122,123,124,125,126,161,162,163,164,165,166,
                       201,202,214,215,227,228,240,241,253,254,
                       266,267,268,269,270,271,345,346,347,348,349,350,
                       424,425,426,427,428,429,503,504,529,530,542,543)
  
  # Convert the list of indices to a list of labels
  cols_to_extract_labels <- features[cols_to_extract]
  
  # Extract columns, merge test and train datasets, merge subject and activity columns
  d_x <- rbind(d_x_test[,cols_to_extract], d_x_train[,cols_to_extract])
  d_y <- rbind(d_y_test, d_y_train)
  d_s <- rbind(d_s_test, d_s_train)
    
  # Aggregate the dataset: average value grouped by activity and subject
  d <- aggregate(d_x, by=list(d_s[,1], d_y[,1]), FUN=mean)
  
  # Label the columns and activities
  names(d) <- c("Subject", "Activity", cols_to_extract_labels)
  d$Activity <- activities[d$Activity]
  
  # Write the tidy dataset to a local file
  write.table(d, output, quote=FALSE, row.names=FALSE)
  
  # Return the tidy dataset object to the calling environment
  d
}