*Getting the Data;
*Importing the dataset;
proc import datafile='/home/u64069381/Data.csv'
	dbms=csv out=EDA_Project;
run;

*Checking the data to get the details of the variables in the dataset;
proc contents data=eda_project varnum;
run;

*Check descriptive statistics of the numerical variables in the data;
proc means data=eda_project;
run;



/*Data Cleaning*/
*Check missing values in the data set;
proc means data=eda_project nmiss;
run;

*Changing the name of variable ‘No-show’ to ‘Show’
and changing the label from No-Show to Show;
data apt_data1(rename=('No-Show'n = Show));
set eda_project;
label 'No-Show'n='Show';
run;

*Inverting No-Show → Show values with integer values.;
data apt_data2;
set apt_data1;
if show='No' then Show=1;
else if show='Yes' then Show=0;
run;
/*to check the names of the variables*/
proc print data=apt_data1 (obs=5);
run;

*removing unwanted columns;
data EDA(drop=patientid appointmentid);

*Correcting naming;
set apt_data2 (rename=(Hipertension=Hypertension));

*Dropping columns;
drop scheduledday appointmentday;

*Extracting date part;
Schld_date = datepart(scheduledday);
Apt_date = datepart(Appointmentday);

*formatting date columns & Creating new column;
format schld_date apt_date date9.;
day_diff = (apt_date - schld_date);
run;

*Checking data once;
proc contents data=eda nodetails;
run;



/*Exploratory Data Analysis*/
*Get the percentage of Show and create a bar graph;
ods graphics on;
proc freq data=work.eda;
tables show/nocum
	plots=freqplot(type=bar scale=percent);
run;
ods graphics off;

*Is gender related to whether a patient will be there at the scheduled appointment or not?;
ods graphics on;
proc freq data=eda;
tables show*gender/
	plots=freqplot(twoway=stacked);
run;
ods graphics off;

*Are patients with scholarships more likely to miss their appointment?;
ods graphics on;
proc freq data=eda;
tables show*scholarship/
	plots=freqplot(twoway=stacked);
run;
ods graphics off;

*Are patients with hypertension more likely to miss their appointment?;
ods graphics on;
proc freq data=eda;
tables show*hypertension/
	plots=freqplot(twoway=stacked);
run;
ods graphics off;

*Are patients who don't receive SMS more likely to miss their appointment?;
ods graphics on;
proc freq data=eda;
tables show*sms_received/ 
	plots=freqplot(twoway=stacked orient=Horizontal);
run;
ods graphics off;

*Is the time difference between the scheduling and appointment related 
to whether a patient will show up for an appointment or not?;
data day_cat;
set eda;
length day_diff2 $ 16;
if day_diff <= 0 then day_diff2 = 'Same Day';
else if day_diff <= 4 then day_diff2 = 'Few Days';
else if day_diff > 4 and day_diff <= 15 then day_diff2 = 'More than 4';
else day_diff2 = 'More than 15';
run;

proc freq data=day_cat;
tables day_diff2/nocum;
run;

ods graphics on;
proc freq data=day_cat;
tables show*day_diff2 /plots=freqplot(twoway=cluster);
run;
ods graphics off;

*Is there an effect of Age if the patient will turn up for their appointment or not?;
proc univariate data=eda;
	class show;
	var age;
	histogram age/ overlay;
run;

*Which are the neighborhood where patients more than 500 are missing their appointments ?;
data No_show;
set eda;
if show=0;
run;

ods graphics / reset width=14in height=6in imagemap;
proc sgplot data=WORK.NO_SHOW;
 vbar Neighbourhood / group=Show groupdisplay=cluster 
  fillattrs=(transparency=0.25) datalabelfitpolicy=none;
 yaxis grid;
 refline 508 / axis=y lineattrs=(thickness=2 color=Red) label 
  labelattrs=(color=Red);
 keylegend / location=inside;
run;
ods graphics / reset;

*On which weekdays people don’t show up most often?;
data weekdays;
set eda;
apt_day =weekday(apt_date);
if apt_day = 1 then week_day = 'Sun';
else if apt_day = 2 then week_day = 'Mon';
else if apt_day = 3 then week_day = 'Tues';
else if apt_day = 4 then week_day = 'Wednes';
else if apt_day = 5 then week_day = 'Thurs';
else if apt_day = 6 then week_day = 'Fri';
else week_day = 'Satr';
run;
*Bar char;
title "Weekdays On Which Most of the Appointments Were Missed ";
proc sgplot data = weekdays;
    vbar week_day/ group=show groupdisplay=cluster stat=freq  ;
run;