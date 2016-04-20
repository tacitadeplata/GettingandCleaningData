rm( list = ls() )
library(dplyr)
library(tidyr)
## set UCI HAR Dataset the working directory 
        setwd( "~/coursera/GettingandCleaningData/finalassignment/UCI HAR Dataset" )

## Read features and activity_labels files and convert them to data frame tbl
        features <- tbl_df( read.table( "features.txt", col.names=c("index", "feature") ) )
        activity_labels <- tbl_df( read.table( "activity_labels.txt", sep=" ", col.names = c( "activitylabel", "activity" ) ) )
        
# Read subject and activity_label for test and training and convert them to data frame tbl
        subject_test <- tbl_df(read.table( "test/subject_test.txt", col.names = c( "subject" ) ) )
        activity_label_test <- tbl_df( read.table( "test/y_test.txt", col.names = c( "activitylabel" ) ) )
        subject_train <- tbl_df( read.table( "train/subject_train.txt", col.names = c( "subject" ) ) )
        activity_label_train <- tbl_df(  read.table( "train/y_train.txt", col.names = c( "activitylabel" ) ) )

## Read data for the test and training cases, add features as column names and conver them to data frame tbl
        data_test <- tbl_df( read.table( "test/X_test.txt", col.names=features$feature ) )
        data_train <- tbl_df( read.table( "train/X_train.txt", col.names=features$feature ) )
        
## select all columns headed with mean and all columns headed with std    
        sub_test <- select(data_test, contains( "mean" ) , contains( "std" ) )
        sub_train <- select( data_train, contains( "mean" ), contains( "std" ) )
        
## assemble the subsets to include subject and activity_label information for each especific row 
        data_test <- bind_cols( subject_test, activity_label_test, sub_test)
        data_train <- bind_cols( subject_train, activity_label_train, sub_train)
      
## Join both data sets by subject
        data <- bind_rows(data_test,data_train) %>% left_join(activity_labels) %>% select( -activitylabel)
        
# select activity, subject and columns containg the character "mean"
        dtidy <- select( data, activity, subject, contains( "mean" )) 

# save dtidy dataset         
        write.table(dtidy,file="datatidy.txt")
        
        
        