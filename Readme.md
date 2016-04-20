---
title: "README"
author: "Juan Luis Cabrera"
date: "April 19, 2016"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## Final assignment of Coursera's Getting and Cleaning Data course

The script runs in the UCI HAR Dataset directory. It works with dplyr and tidyr packages which are loaded. 
The script reads the required information from the dataset directory: features and activity labels datasets, subject and activity labels for test and training data and the data for the test and training cases. From these datasets it select all columns which head contains "mean" or "std" and assemble subsets including subject and activity label information for each especific row, then the script joins both datasets by subject. From this outcome activity, subject and columns containg the character "mean" are selected to get the tidy dataset which is finally saved in the file datatidy.txt

```{run_analysis}
rm( list = ls() )
library(dplyr)
library(tidyr)
## set UCI HAR Dataset the working directory 
## change this path according to your case
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
        
```

