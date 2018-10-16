# One of the most exciting areas in all of data science right now is wearable computing - 
# see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to 
# develop the most advanced algorithms to attract new users. The data linked to from the 
# course website represent data collected from the accelerometers from the Samsung Galaxy S 
# smartphone. A full description is available at the site where the data was obtained:
# 
#      http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
# 
# Here are the data for the project:
#      
#      https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


# Below given  R script called run_analysis.R does the following.
# 
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set with the 
#    average of each variable for each activity and each subject.
#    Please refer to blog https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/


library(plyr)
library(reshape2)


# Download source file for the project
#https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


if(!file.exists("../HAR")) {dir.create("../HAR")}
fileurl1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileurl1,"../HAR/FUCI_HAR_Dataset.ZIP")
unzip("../HAR/FUCI_HAR_Dataset.ZIP",exdir = "../HAR", unzip = "internal",setTimes = FALSE)


# 1. Merge the training and the test sets to create one data set.

# Read all six activity lables 
activity_labels <- read.table("../HAR/UCI HAR Dataset/activity_labels.txt")
activity <- activity_labels[,2]

# Read all features lables, these will be the column names or 561 variables both for test and train datasets
feature <- read.table("../HAR/UCI HAR Dataset/features.txt")

# Read volunteer_ID or subject, there are total 30 subjects in this project

volunteer_ID1 <-read.table("../HAR/UCI HAR Dataset/test/subject_test.txt")

# Read 'test' dataset
test <- read.table("../HAR/UCI HAR Dataset/test/X_test.txt")
names(test) <- feature[,2]                   # naming all 561 columns 
test$volunteer_ID <- volunteer_ID1$V1       # add subject number, there are total 1 to 30 subjects who have participated in the program.  


# Read activities from Y_test, logically total number of observations must be equal to number of rows in the test dataset. 
activities_test <- read.table("../HAR/UCI HAR Dataset/test/Y_test.txt")
activities_test[,"V1"] <- factor(activities_test[,"V1"])

# Assign activity lable to each observation  for eg. 1=WALKING, 3=WALKING_DOWNSTAIRS and so on.
levels(activities_test[,"V1"]) <- activity                  

# 3. Use descriptive activity names to name the activities in the data set

# Include 6 activities decriptive names against each row/observation to main test dataset. 
test$activity <- activities_test$V1


# Read volunteerID or subject, there are total 30 subjects in this project
volunteer_ID <-read.table("../HAR/UCI HAR Dataset/train/subject_train.txt")

# Read 'train' dataset
train <- read.table("../HAR/UCI HAR Dataset/train/X_train.txt")
names(train) <- feature[,2]                  # naming all 561 columns 
train$volunteer_ID <- volunteer_ID$V1        # add subject number, there are total 1 to 30 subjects who have participated in the program.  


# Read activities from Y_test, logically total number of observations must be equal to number of rows in the test dataset. 
activities_train <- read.table("../HAR/UCI HAR Dataset/train/Y_train.txt")
activities_train[,"V1"] <- factor(activities_train[,"V1"])

# Assign activity lable to observation  for eg. 1=WALKING, 3=WALKING_DOWNSTAIRS and so on.
levels(activities_train[,"V1"]) <- activity


# 3. Use descriptive activity names to name the activities in the data set
# Include 6 activities (decriptive name) against each row/observation to main train dataset.
train$activity <- activities_train$V1


# Merging two datasets in a single dataset
single_dataset <- rbind(test,train) 


# 2. Extract only the measurements on the mean and standard deviation for each measurement.

col_names <- names(single_dataset)
col_names <- col_names[!grepl("Freq",col_names)]

cols_w_mean <- col_names[grepl("mean()",col_names)]
cols_w_std <-  col_names[grepl("std()",col_names)]
subset_of_columns <-c(cols_w_std,cols_w_mean, "volunteer_ID","activity")


mean_and_std_deviation_dataset <- subset.data.frame(single_dataset, select = subset_of_columns)
# names(mean_and_std deviation_dataset)



# 4. Appropriately label the data set with descriptive variable names. 

lable <- c("time_body_linear_acceleration_std_X-axis",
           "time_body_linear_acceleration_std_Y-axis",
           "time_body_linear_acceleration_std_Z-axis",
           "time_gravity_linear_acceleration_std_X-axis",
           "time_gravity_linear_acceleration_std_Y-axis",
           "time_gravity_linear_acceleration_std_Z-axis",
           "time_body_linear_acceleration_jerk_std_X-axis",
           "time_body_linear_acceleration_jerk_std_Y-axis",
           "time_body_linear_acceleration_jerk_std_Z-axis",
           "time_body_angular_acceleration_std_X-axis",
           "time_body_angular_acceleration_std_Y-axis",
           "time_body_angular_acceleration_std_Z-axis",
           "time_body_angular_acceleration_jerk_std_X-axis",
           "time_body_angular_acceleration_jerk_std_Y-axis",
           "time_body_angular_acceleration_jerk_std_Z-axis",
           "time_body_linear_acceleration_mag_std",
           "time_gravity_linear_acceleration_mag_std",
           "time_body_linear_acceleration_jerk_mag_std",
           "time_body_angular_acceleration_mag_std",
           "time_body_angular_acceleration_jerk_mag_std",
           "freq_body_linear_acceleration_std_X-axis",
           "freq_body_linear_acceleration_std_Y-axis",
           "freq_body_linear_acceleration_std_Z-axis",
           "freq_body_linear_acceleration_jerk_std_X-axis",
           "freq_body_linear_acceleration_jerk_std_Y-axis",
           "freq_body_linear_acceleration_jerk_std_Z-axis",
           "freq_body_angular_acceleration_std_X-axis",
           "freq_body_angular_acceleration_std_Y-axis",
           "freq_body_angular_acceleration_std_Z-axis",
           "freq_body_linear_acceleration_mag_std",
           "freq_body_linear_acceleration_jerk_mag_std",
           "freq_body_angular_acceleration_mag_std",
           "freq_body_angular_acceleration_jerk_mag_std",
           "time_body_linear_acceleration_mean_X-axis",
           "time_body_linear_acceleration_mean_Y-axis",
           "time_body_linear_acceleration_mean_Z-axis",
           "time_gravity_linear_acceleration_mean_X-axis",
           "time_gravity_linear_acceleration_mean_Y-axis",
           "time_gravity_linear_acceleration_mean_Z-axis",
           "time_body_linear_acceleration_jerk_mean_X-axis",
           "time_body_linear_acceleration_jerk_mean_Y-axis",
           "time_body_linear_acceleration_jerk_mean_Z-axis",
           "time_body_angular_acceleration_mean_X-axis",
           "time_body_angular_acceleration_mean_Y-axis",
           "time_body_angular_acceleration_mean_Z-axis",
           "time_body_angular_acceleration_jerk_mean_X-axis",
           "time_body_angular_acceleration_jerk_mean_Y-axis",
           "time_body_angular_acceleration_jerk_mean_Z-axis",
           "time_body_linear_acceleration_mag_mean",
           "time_gravity_linear_acceleration_mag_mean",
           "time_body_linear_acceleration_jerk_mag_mean",
           "time_body_angular_acceleration_mag_mean",
           "time_body_angular_acceleration_jerk_mag_mean",
           "freq_body_linear_acceleration_mean_X-axis",
           "freq_body_linear_acceleration_mean_Y-axis",
           "freq_body_linear_acceleration_mean_Z-axis",
           "freq_body_linear_acceleration_jerk_mean_X-axis",
           "freq_body_linear_acceleration_jerk_mean_Y-axis",
           "freq_body_linear_acceleration_jerk_mean_Z-axis",
           "freq_body_angular_acceleration_mean_X-axis",
           "freq_body_angular_acceleration_mean_Y-axis",
           "freq_body_angular_acceleration_mean_Z-axis",
           "freq_body_linear_acceleration_mag_mean",
           "freq_body_linear_acceleration_jerk_mag_mean",
           "freq_body_angular_acceleration_mag_mean",
           "freq_body_angular_acceleration_jerk_mag_mean",
           "volunteer_ID",
           "activity")

names(mean_and_std_deviation_dataset) <- lable

# 5. From the data set in step 4, create a second, independent tidy data set with the 
# average of each variable for each activity and each subject.

melted_tidy_data <- melt(mean_and_std_deviation_dataset,id.vars = c(67:68), measure.vars = c(1:66))
avg_of_each_activities_per_subject <- dcast(melted_tidy_data,volunteer_ID + activity ~ variable,mean)


# Write the datasets into a file
if(!file.exists("../HAR/output")) {dir.create("../HAR/output")}

write.table(mean_and_std_deviation_dataset, file = "../HAR/output/mean_and_std deviation_dataset.txt",row.names = FALSE)
write.table(avg_of_each_activities_per_subject, file = "../HAR/output/avg()_of each_activities_per_subject.txt",row.names = FALSE)

# CSV format
write.table(mean_and_std_deviation_dataset, file = "../HAR/output/mean_and_std deviation_dataset.csv",sep = ",",row.names = FALSE)
write.table(avg_of_each_activities_per_subject, file = "../HAR/output/avg()_of each_activities_per_subject.csv",sep = ",",row.names = FALSE)

