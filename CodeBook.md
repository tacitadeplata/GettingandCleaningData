---
title: "CodeBook"
author: "Juan Luis Cabrera"
date: "April 19, 2016"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## Final assignment of Coursera's Getting and Cleaning Data course

In this code book we describe the variables, data and any transformations or work performed to clean up the data. 

This is the codebook for the final assignment of Coursera's Getting and Cleaning Data course. This assignment is based on the Human Activity Recognition Using Smartphones Data Set by Jorge L. Reyes-Ortiz.1,2., Davide Anguita.1., Alessandro Ghio.1., Luca Oneto.1. and Xavier Parra.2. [1 - Smartlab - Non-Linear Complex Systems Laboratory DITEN - Università degli Studi di Genova, Genoa .I-16145., Italy.
2 - CETpD - Technical Research Centre for Dependency Care and Autonomous Living Universitat Politècnica de Catalunya .BarcelonaTech.. Vilanova i la Geltrú .08800., Spain activityrecognition@smartlab.ws]. 

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ  
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean


From original test and training datasets two new datasets have been extracted: 
1. a dataset including mean and std variables for each activity and subject and 
2. a dataset called "datatidy.txt" including only mean variables for each activity and subject. This tidy dataset is the one submited as required in the assignment instructions. The variables in such a tidy datasets are the following:   

1. activity 
2. subject 
3. tBodyAcc-mean...X 
4. tBodyAcc-mean...Y 
5. tBodyAcc-mean...Z 
6. tGravityAcc-mean...X 
7. tGravityAcc-mean...Y
8. tGravityAcc-mean...Z 
9. tBodyAccJerk-mean...X 
10. tBodyAccJerk-mean...Y  
11. tBodyAccJerk-mean...Z  
12. tBodyGyro-mean...X  
13. tBodyGyro-mean...Y 
14. tBodyGyro-mean...Z 
15. tBodyGyroJerk-mean...X 
16. tBodyGyroJerk-mean...Y 
17. tBodyGyroJerk-mean...Z 
18. tBodyAccMag-mean.. 
19. tGravityAccMag-mean.. 
20. tBodyAccJerkMag-mean.. 
21. tBodyGyroMag-mean.. 
22. tBodyGyroJerkMag-mean.. 
23. fBodyAcc-mean...X 
24. fBodyAcc-mean...Y  
25. fBodyAcc-mean...Z 
26. fBodyAcc-meanFreq...X 
27. fBodyAcc-meanFreq...Y 
28. fBodyAcc-meanFreq...Z 
29. fBodyAccJerk-mean...X 
30. fBodyAccJerk-mean...Y 
31. fBodyAccJerk-mean...Z 
32. fBodyAccJerk-meanFreq...X 
33. fBodyAccJerk-meanFreq...Y 
34. fBodyAccJerk-meanFreq...Z 
35. fBodyGyro-mean...X 
36. fBodyGyro-mean...Y 
37. fBodyGyro-mean...Z 
38. fBodyGyro-meanFreq...X 
39. fBodyGyro-meanFreq...Y 
40. fBodyGyro-meanFreq...Z 
41. fBodyAccMag-mean.. 
42. fBodyAccMag-meanFreq.. 
43. fBodyBodyAccJerkMag-mean.. 
44. fBodyBodyAccJerkMag-meanFreq.. 
45. fBodyBodyGyroMag-mean.. 
46. fBodyBodyGyroMag-meanFreq.. 
47. fBodyBodyGyroJerkMag-mean.. 
48. fBodyBodyGyroJerkMag-meanFreq..
49. angle.tBodyAccMean,gravity.
50. angle.tBodyAccJerkMean.,gravityMean.
51. angle.tBodyGyroMean,gravityMean. 
52. angle.tBodyGyroJerkMean,gravityMean. 
53. angle.X.gravityMean. 
54. angle.Y.gravityMean. 
55. angle.Z.gravityMean. 

Note the activities have been unlabeled and take values on the set: WALKING, WALKING UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING . The datafile is saved at the working directory in the file "datatidy.txt""
