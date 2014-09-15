cat("loading required packages")
library(dplyr)
library(tidyr)
library(data.table) #loading required packages


rData <- function(x, y, sub) {
        # this function will take the data set, assign the names and the right columns
        if(!file.exists("./UCI HAR Dataset")){stop("data set directory does not exist, please check instructions") }
        x <- read.table(x, quote="\"", stringsAsFactors=FALSE)
        features <- read.table("./UCI HAR Dataset/features.txt", quote="\"", stringsAsFactors=FALSE) #read column names
        names(x) <- features$V2
        #next lines subsets
                x <- select(x, contains("-mean()"), contains("-std()"))
                y <- read.table(y, quote="\"", stringsAsFactors=FALSE)
                names(y) <- "activity_id"
                x <- cbind(y, x) # now we have the right set with means and std of x plus the activity
        # now we attach the subject ID
                        sub <- read.table(sub, quote="\"", stringsAsFactors=FALSE)
                        names(sub) <- "subject_id"
                        x <- cbind(sub, x)
        x
}
yTest <- "./UCI HAR Dataset/test/y_test.txt"
xTest <- "./UCI HAR Dataset/test/X_test.txt"
subTest <- "./UCI HAR Dataset/test/subject_test.txt"
yTrain <- "./UCI HAR Dataset/train/y_train.txt"
xTrain <- "./UCI HAR Dataset/train/X_train.txt"
subTrain <- "./UCI HAR Dataset/train/subject_train.txt"

dataTrain <- rData(xTrain, yTrain, SubTrain)




#View(set_test)

