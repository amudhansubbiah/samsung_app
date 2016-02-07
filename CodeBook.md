Getting and Cleaning Data Course Project - Coursera Course Name: Amudhan Subbiah

Source

UCI HAR Dataset from the UCI Machine learning repository.

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ Reference - Human Activity Recognition Using Smartphones Dataset Version 1.0 By - Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto. Smartlab - Non Linear Complex Systems Laboratory DITEN - Università degli Studi di Genova. Via Opera Pia 11A, I-16145, Genoa, Italy. activityrecognition@smartlab.ws www.smartlab.ws ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

Description of the Available Files

'features_info.txt': Shows information about the variables used on the feature vector.

'features.txt': List of all features.

'activity_labels.txt': Links the class labels with their activity name.

'train/X_train.txt': Training set.

'train/y_train.txt': Training data set labels.

'test/X_test.txt': Test set.

'test/y_test.txt': Test data set labels.

The following files are available for the train and test data. Their descriptions are equivalent.

'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ Initial Steps

Activity Test Data - "Y_test.txt" Activity Train Data - "Y_train.txt"

Subject Train Data - "subject_train.txt" Subject Test Data - "subject_test.txt"

Features Test Data - "X_test.txt" Features Train Data - "X_train.txt"

Combining Datasets

Subject - rbind(SubjectTrain, SubjectTest)

Activity - rbind(ActivityTrain, ActivityTest)

Features - rbind(FeaturesTrain, FeaturesTest)

Attaching Names to the data

names(Subject)<-c("subject") names(Activity)<- c("activity") FeaturesNames <- read.table(("features.txt"),head=FALSE) names(Features)<- FeaturesNames[,2]

Combining subject & activity to one dataset and merging it with Features dataset

Subject + Activity - cbind(Subject, Activity) AllData - cbind(Features, SubjectActivity)

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

Extracts only the measurements on the mean and standard deviation for each measurement
use grep("mean\(\)|std\(\)"

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

Uses descriptive activity names to name the activities in the data set
name the activity list using the activity_label file

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

Appropriately labels the data set with descriptive variable names
use gsub to label the variable names

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

creates a second, independent tidy data set with the average of each variable for each activity and each subject
aggregate the data by subject and acitvity with mean of each variable as the output

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
