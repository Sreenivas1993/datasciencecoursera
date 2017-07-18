Getting and cleaning data assignment

run_analysis.R does the following steps

1.Download the dataset in the working directory<br/>
2.merge the test and train dataset into one dataset<br/>
3.read the feature information to 'features' dataset and take yhe columns which have means and standard deviation in it<br/>
4.Read the activity information to'activity' dataset and replace the activity number with activity name<br/>
5.Given proper column names to all dataset and all data set are merged using'cbind'<br/>
6.Have taken averages of all columns other than activities and subject grouped by these two columns and this tidy data set is stored in 'tidydata.txt'<br/>
