# assignment_gccleaning
Assignment: Getting and Cleaning Data Course Project

==================================================================
This is the assignment of the Getting and Cleaning Data Project
==================================================================


The dataset includes the following files:
=========================================

- 'README.md'

- ‘run_analysis.R’: this is the script to be evaluated

- ‘tidy_data.txt’: output file

- code_book.txt : the code book of the project



The run_analysis.R script:
 - loads the train and test data
 - creates an unique data frame, called data, to store all the dataset
 - loads and assigns the variable names to data
 - the activity labels are loaded into a data frame and merged with the dataset to replace activity ids with them
 - only the means and standard deviations are extraxted from the dataset
 - the resulting dataframe is grouped by subject and activity and the summirized using the function mean
 - the final dataset, called data_tidy, is written in a file and returned

Reference:
============
The output dataset is derived from [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
