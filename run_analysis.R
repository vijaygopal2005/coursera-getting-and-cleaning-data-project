library(dplyr)
setwd("C:\\vijay")
fileName <- "getdata%2Fprojectfiles%2FUCI HAR Dataset.zip"
#download the dataset if not exist
if(!file.exists(fileName)){
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",fileName)
}

if (!file.exists("UCI HAR Dataset")) { 
  unzip(filename) 
}

# Read test data
x_test <- read.table("C:\\vijay\\Coursera\\UCI HAR Dataset\\test\\X_test.txt",sep = "")
y_test <- read.table("C:\\vijay\\Coursera\\UCI HAR Dataset\\test\\y_test.txt",sep = "")
subject_test <- read.table("C:\\vijay\\Coursera\\UCI HAR Dataset\\test\\subject_test.txt",
                           sep = "")
colnames(subject_test) <- "subject_id"

# Read train data
x_train <- read.table("C:\\vijay\\Coursera\\UCI HAR Dataset\\train\\X_train.txt",sep = "")
y_train <- read.table("C:\\vijay\\Coursera\\UCI HAR Dataset\\train\\y_train.txt",sep = "")
subject_train <- read.table("C:\\vijay\\Coursera\\UCI HAR Dataset\\train\\subject_train.txt",sep = "")
colnames(subject_train) <- "subject_id"

#Read activity data
activity_label <- read.table("C:\\vijay\\Coursera\\UCI HAR Dataset\\activity_labels.txt",sep = "")
colnames(activity_label) <- c("activity_label","activity_name")

# Read features data
features <- read.table("C:\\vijay\\Coursera\\UCI HAR Dataset\\features.txt",sep = "")

# set column names for the test data from features dataset
colnames(x_test) <- features[,2]
colnames(y_test) <- "activity_label"
# merge all the test datasets
final_test <- cbind(subject_test,y_test,x_test)

# set column names for the train dataset from the test dataset
colnames(x_train) <- colnames(x_test)
colnames(y_train) <- colnames(y_test)

# merge the train datasets
final_train <- cbind(subject_train,y_train,x_train)

#merge the train and test dataset
final_data <- rbind(final_train,final_test)

# extract the mean and standard deviation variables
sub_data <- final_data[,grep("subject_id|activity_label|mean|std",colnames(final_data))]

# using descriptive activity name
cleanData <- merge(activity_label,sub_data,by = "activity_label",all.y = TRUE)

# calculate average of all columns grouped by activity and subject
aggData <- cleanData %>% group_by(activity_name,subject_id) %>% summarise_all(mean)

write.table(aggData,"C:\\vijay\\Coursera\\UCI HAR Dataset\\tidy.txt",row.names = FALSE)


