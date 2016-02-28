# 0. Download and unzip data (executed on Mac)
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url = fileUrl, destfile = "./temp.zip")
unzip(zipfile = "./temp.zip")
file.remove("./temp.zip")

# 1. Merges the training and the test sets to create one data set.
# Load Test set
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")

# Load Test set
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")

# Create a data frame for test and train set
testset <- cbind(subject_test,y_test, X_test)
trainset <- cbind(subject_train,y_train, X_train)

data <- rbind(testset, trainset)
#------------------

# 4. Appropriately labels the data set with descriptive variable names.
variable_names <- read.table("./UCI HAR Dataset/features.txt", colClasses="character")
names(data) <- c("subject", "activity", variable_names[[2]])

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.

data <- data[, grep("subject|activity|std|mean", names(data))]

# 3. Uses descriptive activity names to name the activities in the data set
library(dplyr)
labels <- read.table("./UCI HAR Dataset/activity_labels.txt", col.names=c("id", "activity_label"))
data <- merge(data,labels,by.x="activity",by.y="id") %>% select(-activity) %>% rename(activity = activity_label) %>% select(subject, activity, grep("std|mean", names(data)))

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of
#    each variable for each activity and each subject.

data_tidy <- group_by(data, subject, activity) %>% summarize_each(funs(mean))
write.csv(x = data_tidy, file = "./output_dataset/tidy_data.csv")
write.table(x = data_tidy, file = "./output_dataset/tidy_data.txt")
