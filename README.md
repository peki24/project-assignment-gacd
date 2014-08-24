project-assignment-gacd
=======================

Getting and cleaning data project assignment

The purpose of this file is to explain the procedure of making the tidy data set required for a course project.

The first step was to download all the data that was necessary for creating tidy data set and store the data 
in the R working directory.

After that i read all of the tables into R using read.table.

Next step was merging the training and the test sets together to form one big data set. I merged X_train.txt,
subject_train.txt and y_train.txt using cbind in that order in form of data frames that were read into R. The same 
goes for y_train.txt, subject_test.txt and y_test.txt. Then i merged those two data sets (train and test) using rbind
and named this data set df. I assigned column names from features.txt file to my new df data frame and added two extra
column names "Subject" for column that was created by merging subject_train and subject_test and "Activity" for column
that was created by merging y_train and y_test.

I assigned descriptive activity names that were listed in file activity_labels.txt to an Activity column using a for loop.

Using grep function, i extracted only the measurements on the mean and standard deviation for each measurement, that includes
the meanfreq variables, because, in my opinion they should be included.

Next step was to rebind "subject" and "activity" columns to this new data frame.

I removed all the interpunction signs from column names and converted all the letters to lowercase.

I created a second, independent tidy data set with the average of each variable for each activity and each subject using
aggregate function, that represents a final tidy data set. It is in wide data format and has 180 observations of 81 variables.

I created a codebook that contains name and description for each variable.



 


 


