#reading data
dfal<-read.table("./UCI HAR Dataset/activity_labels.txt")
dff<-read.table("./UCI HAR Dataset/features.txt")
dftrs<-read.table("./UCI HAR Dataset/train/subject_train.txt")
dftrx<-read.table("./UCI HAR Dataset/train/X_train.txt")
dftry<-read.table("./UCI HAR Dataset/train/y_train.txt")
dftss<-read.table("./UCI HAR Dataset/test/subject_test.txt")
dftsx<-read.table("./UCI HAR Dataset/test/X_test.txt")
dftsy<-read.table("./UCI HAR Dataset/test/y_test.txt")
#Merging the training and the test sets to create one data set (step 1)
dftr<-cbind(dftrx,dftrs,dftry)
dfts<-cbind(dftsx,dftss,dftsy)
df<-rbind(dftr,dfts)
# assigning column names from "features data"
colnames(df)<-c(as.character(dff[,2]),"Subject","Activity")
#Uses descriptive activity names to name the activities in the data set (step3)
for (i in c(1:6)) {df$Activity[df$Activity == as.character(i)]<-as.character(dfal[i,2])}
#Extracts only the measurements on the mean and standard deviation for each measurement (step 2)
ind<-grep("mean",colnames(df))
ind1<-grep("std",colnames(df))
ind2<-sort(c(ind,ind1))
df1<-df[,ind2]
#rebinding subject and activity columns
df2<-cbind(df1,df$Subject,df$Activity)
colnames(df2)<-c(colnames(df1),"Subject","Activity")
#labeling variables, removing dashes etc. and converting to lowercase (step4)
colnames(df2)<-gsub("-|\\()", "", colnames(df2))
colnames(df2)<-tolower(colnames(df2))
#Creating a second, independent tidy data set with the average of each variable for each activity and each subject (step5) 
df3<-aggregate(df2[,c(1:79)],list(df2$subject,df2$activity),mean)
colnames(df3)<-c("subject","activity",colnames(df3[c(3:81)]))
#saving tidy data set as txt file
write.table(df3,file="tidy_data.txt",row.name=FALSE)