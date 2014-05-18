Getting and Cleaning Data Course Project
=============================================

### What the script does

The script `run_analysis.R` reads from the original datasets and generates a tidy dataset as required by the course project instructions.

### How to use the script

1. Download the original dataset provided by the course project from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). The dataset is in zip format, so you will need to extract the files to a directory on your computer.

2. Download `run_analysis.R` to the working directory of R, and source the script with the following command: `source("run_analysis.R")`.

3. Call function `run_analysis()` to process the original dataset. You may specify the following parameters:

    * `path`: the path (directory) containing the original dataset. The default value is `UCI HAR Dataset`, which is the name of the directory in the original zip file.
    
    * `output`: the name of the output file (tidy dataset). The default value is `tidy_dataset.txt`.
    
    This function also returns the tidy dataset as a data frame object, so you may get the result using something like `d <- run_analysis()`.

### Notice

This script is only tested on OS X, and I'm not sure if it works correctly on Windows because the format of a file path may be different.