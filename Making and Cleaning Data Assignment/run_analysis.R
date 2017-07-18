
library(plyr)
library(reshape2)

filename <- "getdata_dataset.zip"

## Download and unzip the dataset:
if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
  download.file(fileURL, filename, method="curl")
}  
if (!file.exists("UCI HAR Dataset")) { 
  unzip(filename) 
}

###1.#####

x_train<-read.table("UCI HAR Dataset/train/X_train.txt")
y_train<-read.table("UCI HAR Dataset/train/y_train.txt")
subject_train<-read.table("UCI HAR Dataset/train/subject_train.txt")
x_test<-read.table("UCI HAR Dataset/test/X_test.txt")
y_test<-read.table("UCI HAR Dataset/test/y_test.txt")
subject_test<-read.table("UCI HAR Dataset/test/subject_test.txt")
subject_train<-read.table("UCI HAR Dataset/train/subject_train.txt")
x_data<-rbind(x_test,x_train)
y_data<-rbind(y_test,y_train)
subject_data<-rbind(subject_test,subject_train)


###2.###
features<-read.table("UCI HAR Dataset/features.txt")
meanstd<-grep(".*mean.*|.*std.*",features[,2])
x_data<-x_data[,meanstd]
names(x_data)<-features[meanstd,2]


####3.#########

activity<-read.table("UCI HAR Dataset/activity_labels.txt")
y_data[,1]<-activity[y_data[,1],2]
names(y_data)<-"Activities"


############.4####################
names(subject_data)<-"Subject"
totaldat<-cbind(x_data,y_data,subject_data)


################3.5###################

#####totaldat<-as.data.table(totaldat)###
###avg_data<-totaldat[,lapply(.SD,mean),by=.(Activities,Subject)]###

averages_data <- ddply(totaldat, .(Subject,Activities), function(x) colMeans(x[, 1:66]))
write.table(averages_data,"tidydata.txt",row.names = FALSE,quote = FALSE,sep ='\t' )
