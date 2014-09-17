setwd("~/Courses/get cleaning data/GetData_assign1") #office, borrar

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
set_id <- c("test", "train")

# following lines creathe the set and respective id's 
# see the function definition for further details        
dataTest <- rData(xTest, yTest, subTest)        
dataTrain <- rData(xTrain, yTrain, subTrain)
set_id <- "test"
dataTest <- cbind(set_id, dataTest)
set_id <- "train"
dataTrain <- cbind(set_id, dataTrain)
dataTest <- data.table(dataTest, keep.rownames = F, key = names(dataTest[1:3]))
dataTrain <- data.table(dataTrain, keep.rownames = F, key = names(dataTrain[1:3])) # turns df into dt, for easier handling
data <- as.data.table(rbind_list(dataTest, dataTrain)) #bind them all




