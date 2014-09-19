
cat("loading required packages")
library(dplyr)
library(tidyr) #loading required packages

if(!file.exists("./UCI HAR Dataset")){stop("data set directory does not exist, please check instructions") }

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
## variable definition, the script is working under supposition that working directory contains data set and script
# remember to read readme.md

yTest <- "./UCI HAR Dataset/test/y_test.txt"
xTest <- "./UCI HAR Dataset/test/X_test.txt"
subTest <- "./UCI HAR Dataset/test/subject_test.txt"
yTrain <- "./UCI HAR Dataset/train/y_train.txt"
xTrain <- "./UCI HAR Dataset/train/X_train.txt"
subTrain <- "./UCI HAR Dataset/train/subject_train.txt"

# following lines creathe the set and respective id's 
# see the function definition for further details        
dataTest <- rData(xTest, yTest, subTest)        
dataTrain <- rData(xTrain, yTrain, subTrain)
set_id <- "test"
dataTest <- cbind(set_id, dataTest)
set_id <- "train"
dataTrain <- cbind(set_id, dataTrain)
data <- rbind_list(dataTest, dataTrain) #bind them all
rm(dataTest, dataTrain) #free memory

actLab <- read.table("./UCI HAR Dataset/activity_labels.txt", col.names = c("activity_id", "activity_label"), quote="\"")
data <- inner_join(actLab, data, by = "activity_id") # add activity label from txt
summaryData <-
        data %.% 
        select( -set_id, -activity_id) %.% #drop unneeded data
        group_by( "activity_label", "subject_id") %.% #grouping as required by point 5
        summarise_each( funs(mean)) 
write.table(summaryData, file = "./results.txt", row.names = F, col.names = T) 
cat("results.txt was written with following data...")
print(tbl_df(summaryData))
        
# so now we've completed functional requirements the data is merged, summarised and subseted
