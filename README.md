# Course-3-Project
Course 3 Project : Data Cleaning
---------------------------------------------------------------------------------------------
Human Activity Recognition Using Smartphones Dataset
---------------------------------------------------------------------------------------------

Brief about the project ‘run analysis.R’ 

Scope: 
This project is about creating two tidy datasets from a source dataset prepared by Jorge L. Reyes

1.	mean_and_std_deviation_dataset -> First dataset is a tidy dataset by extracting only those variables which has mean and standard deviation for each measurement after merging two main source dataset test.txt and train.txt datasets.

2.	avg_of_each_activities_per_subject -> Second independent tidy dataset which uses the dataset created by first step and creates a compact dataset or a pivot table listing the average of each variable for each activity and each subject.

Operation of run analysis.R:

1.  Download source file for the project
2.  Unzip the file in dir  "../HAR"
3.  Read all six activity lables 
4.  Read all features lables, these will be the column names or 561 variables both for test and train datasets
5.  Read volunteer_ID or subject, there are total 30 subjects in this project
6.  Read 'test' dataset
7.  Read activities from Y_test, logically total number of observations must be equal to number of rows in the test dataset. 
8.  Assign activity lable to each observation  for eg. 1=WALKING, 3=WALKING_DOWNSTAIRS and so on.
9.  Include 6 activities decriptive names against each row/observation to main test dataset. 
10. Repat step 5 to 9 for train dataset

11. Use descriptive activity names to name the activities in the data set

12. Merging two datasets in a single dataset

13. Extract only the measurements on the mean and standard deviation for each measurement.

14. Dataset 'mean_and_std_deviation_dataset' is created

15. Appropriately label the data set with descriptive variable names. 

16. From the data set in step 14 and 15, create a second, independent tidy data set with the average of each variable for each activity and each subject.

17. Tidy dataframe 'avg_of_each_activities_per_subject' is created. 

18. Output both datasets as txt and csv file format for further analysis




--------------------------------------------------------------------------------------------------------------------------------
Source Dataset Introduction

The script ‘run analysis.R’ uses a source dataset file from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Above dataset is prepared after an experiment by Jorge L Reyes from Smartlab - Non Linear Complex Systems Laboratoryby recording human activity by wearing a smartphone and recognize linear, angular and gravitational movements by using embedded accelerometer and gyroscope. 

The experiments have been carried out with 30 volunteer or Subjects. Each subject performed six activities labeled as (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone.

3-axial linear acceleration and 3-axial angular velocity at a constant rate was captured. 
The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers or subjects were selected for generating the training data (train.txt) and 30% the test (test.txt) data.

Please read  
- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.

Files or datasets used for this project

- 'features.txt': List of all features. Total 561 unique features or variables are measured.

- subject_(test/train) : the subject or volunteer IDs mapped against each observations under test or train environment. An Important file used to create and map volunteer ID against all activities and in final datasets.

- activity_labels : an activity label file used in this project

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

There are other measurement files/datasets as well but for this project we are not using them.



____________________________________
Code Book  
____________________________________

Variable and Its Descriptions

The output of the script 'run analysis.R' has two datasets

1.	mean_and_std deviation_dataset.txt
2.	avg()_of each_activities_per_subject.txt

Variables: Total 68 variables

1.	volunteer_ID:  
			Unit: integer value (1 to 30), each represents a volunteer on which different activities are measured.

2.	activity:  	
			Unit: six different activities performed and by each volunteer
			Levels: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

Rest 66 variable syntax is as given below:

Please refer below syntax definition:

(time/freq)_ (body/gravity)_ (jerk/”blank”)_ (magnitude/”blank”)_ (std/mean)_ (X-axis/Y-axis/Z-axis/”blank”)

Unit: all 66 variables has numerical value

For eg: 
time_body_linear_acceleration_std_X-axis 
time_body_angular_acceleration_jerk_mean_X-axis
time_body_linear_acceleration_mag

Please note: 
Each variable is a unique measurement type either under time domain or on frequency domain
Each variable type is either ‘body’ or motion detected due to ‘gravity’
Each variable type is either ‘linear’ or ‘angular’ acceleration
Each variables type is either ‘standard deviation’ or ‘mean’
Some variable type has _mag_, these are for recording the magnitude values.
Most variable type has X or Y or Z axis to record axis based vlaues..

List of Variables: 

1.	time_body_linear_acceleration_std_X-axis
2.	time_body_linear_acceleration_std_Y-axis
3.	time_body_linear_acceleration_std_Z-axis
4.	time_gravity_linear_acceleration_std_X-axis
5.	time_gravity_linear_acceleration_std_Y-axis
6.	time_gravity_linear_acceleration_std_Z-axis
7.	time_body_linear_acceleration_jerk_std_X-axis
8.	time_body_linear_acceleration_jerk_std_Y-axis
9.	time_body_linear_acceleration_jerk_std_Z-axis
10.	time_body_angular_acceleration_std_X-axis
11.	time_body_angular_acceleration_std_Y-axis
12.	time_body_angular_acceleration_std_Z-axis
13.	time_body_angular_acceleration_jerk_std_X-axis
14.	time_body_angular_acceleration_jerk_std_Y-axis
15.	time_body_angular_acceleration_jerk_std_Z-axis
16.	time_body_linear_acceleration_mag_std
17.	time_gravity_linear_acceleration_mag_std
18.	time_body_linear_acceleration_jerk_mag_std
19.	time_body_angular_acceleration_mag_std
20.	time_body_angular_acceleration_jerk_mag_std
21.	freq_body_linear_acceleration_std_X-axis
22.	freq_body_linear_acceleration_std_Y-axis
23.	freq_body_linear_acceleration_std_Z-axis
24.	freq_body_linear_acceleration_jerk_std_X-axis
25.	freq_body_linear_acceleration_jerk_std_Y-axis
26.	freq_body_linear_acceleration_jerk_std_Z-axis
27.	freq_body_angular_acceleration_std_X-axis
28.	freq_body_angular_acceleration_std_Y-axis
29.	freq_body_angular_acceleration_std_Z-axis
30.	freq_body_linear_acceleration_mag_std
31.	freq_body_linear_acceleration_jerk_mag_std
32.	freq_body_angular_acceleration_mag_std
33.	freq_body_angular_acceleration_jerk_mag_std
34.	time_body_linear_acceleration_mean_X-axis
35.	time_body_linear_acceleration_mean_Y-axis
36.	time_body_linear_acceleration_mean_Z-axis
37.	time_gravity_linear_acceleration_mean_X-axis
38.	time_gravity_linear_acceleration_mean_Y-axis
39.	time_gravity_linear_acceleration_mean_Z-axis
40.	time_body_linear_acceleration_jerk_mean_X-axis
41.	time_body_linear_acceleration_jerk_mean_Y-axis
42.	time_body_linear_acceleration_jerk_mean_Z-axis
43.	time_body_angular_acceleration_mean_X-axis
44.	time_body_angular_acceleration_mean_Y-axis
45.	time_body_angular_acceleration_mean_Z-axis
46.	time_body_angular_acceleration_jerk_mean_X-axis
47.	time_body_angular_acceleration_jerk_mean_Y-axis
48.	time_body_angular_acceleration_jerk_mean_Z-axis
49.	time_body_linear_acceleration_mag_mean
50.	time_gravity_linear_acceleration_mag_mean
51.	time_body_linear_acceleration_jerk_mag_mean
52.	time_body_angular_acceleration_mag_mean
53.	time_body_angular_acceleration_jerk_mag_mean
54.	freq_body_linear_acceleration_mean_X-axis
55.	freq_body_linear_acceleration_mean_Y-axis
56.	freq_body_linear_acceleration_mean_Z-axis
57.	freq_body_linear_acceleration_jerk_mean_X-axis
58.	freq_body_linear_acceleration_jerk_mean_Y-axis
59.	freq_body_linear_acceleration_jerk_mean_Z-axis
60.	freq_body_angular_acceleration_mean_X-axis
61.	freq_body_angular_acceleration_mean_Y-axis
62.	freq_body_angular_acceleration_mean_Z-axis
63.	freq_body_linear_acceleration_mag_mean
64.	freq_body_linear_acceleration_jerk_mag_mean
65.	freq_body_angular_acceleration_mag_mean
66.	freq_body_angular_acceleration_jerk_mag_mean
67.	volunteer_ID
68.	activity




License:
========
Original Dataset Owner: 
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.







