My first course project 

The project dataset is the Human Activity Recognition Using Smartphones Dataset.Through cleaning the data,finally I get 
the tidy data "haras".

The following is a detailed steps how the script works:
1、Set the working directory and download the dataset,then unpack the dataset,and named it as "UCI HAR Dataset".

2、Read the dataset to R,incloding the test,train data and features,etc.

3、Before the merger of test and train data, appropriately labels the dataset with descriptive variable names.

4、Add column of activity and subject to the test and train data.

5、Merge the training and the test sets to create one data set as "har".

6、Extract only the measurements on the mean and standard deviation for each measurement,and named respectively as "harmean" and "harstd".

7、Use descriptive activity names to name the activities in the data set.

8、Create a second, independent tidy data set with the average of each variable for each activity and each subject，and named as "haras".

9、Create the "haras" with write.table()
