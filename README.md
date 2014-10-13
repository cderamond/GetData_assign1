# getdata-008 assignment 1 - Readme
this git contains my script for assignment 1.
note that by coursera honor code, you must make sure the code you submit is your own. Having said so:
### Acknowledgement
	I have not pulled new changes, as I prepared the assigment for previous period
## Preparation

1. Make sure to set working directory on the root where run_analysis.R is located.
2. Unzip the data set on the same folder.
3. Make sure you have isntalled *dplyr* package on R.

## What's in it?
	* 'run_analysis.R' - main script
	* 'cookbook.md' - recipe for tesults.txt 
	* 'results.txt' - file with data results, product of running script
	
## Instructions

For this script to work, merely run **run_analysis.R**, you will notice results.txt file is created after succesful run.

### what does it do?

The script will take dataset from Human Activity Recognition[1], subset to include only means and St. deviation measures, merge test and train, and, finally, include the activity labels.
Once the data set is ready, it will group according to activity and subject, taking the mean of the measures.
The output will be written to results.txt

 

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012


