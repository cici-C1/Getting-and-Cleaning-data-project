##setwd
setwd("D:/R/Getting_and_Cleaning_Data_Course/course project")

##download the dataset
furl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(furl,destfile = "UCI HAR Dataset.zip")

##read the dataset to R
train <- read.table("UCI HAR Dataset/train/X_train.txt",sep = "",header = FALSE) 
y_train <- read.table("UCI HAR Dataset/train/y_train.txt",sep = "",header = FALSE) 
test <- read.table("UCI HAR Dataset/test/X_test.txt",sep = "",header = FALSE) 
y_test <- read.table("UCI HAR Dataset/test/y_test.txt",sep = "",header = FALSE)
features <- read.table("UCI HAR Dataset/features.txt",sep = "",header = FALSE)
sub_train <- read.table("UCI HAR Dataset/train/subject_train.txt",sep = "",header = FALSE)
sub_test <- read.table("UCI HAR Dataset/test/subject_test.txt",sep = "",header = FALSE)
act_laber <- read.table("UCI HAR Dataset/activity_labels.txt",sep = "",header = FALSE)


##4、Appropriately labels the dataset with descriptive variable names
names(train) <- features[,2]
names(test) <- features[,2]

train$act <- y_train[,1]  ##add column of activity 
test$act <- y_test[,1]

train$sub <- sub_train[,1]  ##add column of subject
test$sub <- sub_test[,1]

##1、Merges the training and the test sets to create one data set
har <- rbind(train,test)  

##2、Extracts only the measurements on the mean and standard deviation for each measurement
harmean <- sapply(har[,1:561],mean)  
harstd <- sapply(har[,1:561],sd)   

##3、Uses descriptive activity names to name the activities in the data set
str(act_laber)   
act_laber[[2]] <- as.character(act_laber[[2]])

har[har[,562] %in% "1",562] <- act_laber[1,2]
har[har[,562] %in% "2",562] <- act_laber[2,2]
har[har[,562] %in% "3",562] <- act_laber[3,2]
har[har[,562] %in% "4",562] <- act_laber[4,2]
har[har[,562] %in% "5",562] <- act_laber[5,2]
har[har[,562] %in% "6",562] <- act_laber[6,2]

##5、creates a second, independent tidy data set with the average of each variable 
##for each activity and each subject.
haras <- aggregate(. ~ act+sub,har[,1:563],mean)
write.table(haras, file = "haras.txt", row.names = FALSE,col.names = TRUE)
