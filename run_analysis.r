library(plyr)
library(dplyr)
setwd("D:/All/R/Getting_CleaningData/week4/Data/UCI HAR Dataset")
files<-list.files(getwd(), recursive=TRUE)
files

ActivityTest  <- read.table(file.path(getwd(), "test" , "Y_test.txt" ),header = FALSE)
str(ActivityTest)

ActivityTrain <- read.table(file.path(getwd(), "train", "Y_train.txt"),header = FALSE)
str(ActivityTrain)

SubjectTrain <- read.table(file.path(getwd(), "train", "subject_train.txt"),header = FALSE)
str(SubjectTrain)
SubjectTest  <- read.table(file.path(getwd(), "test" , "subject_test.txt"),header = FALSE)
str(SubjectTest)

FeaturesTest  <- read.table(file.path(getwd(), "test" , "X_test.txt" ),header = FALSE)
str(FeaturesTest)
FeaturesTrain <- read.table(file.path(getwd(), "train", "X_train.txt"),header = FALSE)
str(FeaturesTrain)

Subject <- rbind(SubjectTrain, SubjectTest)
Subject
Activity <- rbind(ActivityTrain, ActivityTest)
Activity
Features <- rbind(FeaturesTrain, FeaturesTest)
Features

names(Subject)<-c("subject")
names(Activity)<- c("activity")
FeaturesNames <- read.table(("features.txt"),head=FALSE)
names(Features)<- FeaturesNames[,2]
Features

SubjectActivity <- cbind(Subject, Activity)
AllData <- cbind(Features, SubjectActivity)
AllData


#Extracts only the measurements on the mean and standard deviation for each measurement
subsetFeaturesNames<-FeaturesNames[,2][grep("mean\\(\\)|std\\(\\)", FeaturesNames[,2])]
selectedNames<-c(as.character(subsetFeaturesNames), "subject", "activity" )
Extract <- AllData[, selectedNames]

#
Activities <- read.table("activity_labels.txt")
Activities
Activity_Sub <- Activity[,1]
Activity_Sub1 <- Activities[Activity_Sub, 2]
names(Activity) <- "activity"
head(Activity_Sub1)

# Appropriately labels the data set with descriptive variable names
names(AllData)<-gsub("^t", "time", names(AllData))
names(AllData)<-gsub("^f", "frequency", names(AllData))
names(AllData)<-gsub("Acc", "Accelerometer", names(AllData))
names(AllData)<-gsub("Gyro", "Gyroscope", names(AllData))
names(AllData)<-gsub("Mag", "Magnitude", names(AllData))
names(AllData)<-gsub("BodyBody", "Body", names(AllData))
names(AllData)


#Data2<-aggregate(. ~subject + activity, Data, mean)
#Data2<-summarize(dg,  mean)
#dg <- group_by(AllData, subject, activity)
#by_group <- AllData %>% group_by(subject, activity)
#by_group %>% summarise_each(funs(mean))


# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
AllData2<-aggregate(. ~subject + activity, AllData, mean)
write.table(AllData2, file = "AllData2.txt",row.name=FALSE)

