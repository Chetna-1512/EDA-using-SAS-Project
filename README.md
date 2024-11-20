# EDA-using-SAS-Project
The healthcare system faces numerous challenges related to patient no-shows, which can significantly affect the efficiency of medical services and scheduling. In this project, we focus on analyzing the factors influencing patient attendance in medical appointments using a real-world dataset. The goal is to explore the variables that may contribute to patients missing their scheduled appointments and provide insights into how healthcare providers can mitigate this issue.

The dataset used for this analysis is the "No-Show Appointments" dataset, available on Kaggle. This dataset contains more than 110,000 records, each representing a medical appointment, and includes several attributes such as the patient's age, gender, health status, appointment details, and whether the patient showed up for the appointment. These attributes are essential for determining the various factors that might influence attendance.

Key factors included in the dataset include:

Patient Demographics: Information such as age, gender, and whether the patient has a scholarship.
Health Conditions: Whether the patient suffers from hypertension, diabetes, alcoholism, or has any disabilities.
Appointment Details: Dates of appointment scheduling, the actual day of the appointment, and the time between scheduling and the appointment.
SMS Reminder: Whether the patient received an SMS reminder about the appointment.
No-Show Status: A binary outcome variable indicating whether the patient attended the appointment or not.
The primary objective of this project is to identify the key factors influencing whether a patient will show up for their appointment or not. To achieve this, we perform a series of exploratory data analysis (EDA) tasks using SAS Studio. The analysis involves cleaning the data, handling missing values, performing statistical analysis, and creating visualizations to uncover patterns and relationships within the data.

The project is divided into several core objectives:

Descriptive Statistics and Data Cleaning: We start by cleaning the dataset, handling missing values, and converting data types as needed. Descriptive statistics are calculated to summarize key characteristics of the dataset, including patient demographics, appointment dates, and no-show rates.

Exploratory Data Analysis: Using various SAS procedures, we explore the relationships between different variables and the likelihood of a patient attending their appointment. Key areas of interest include:

The relationship between age and the likelihood of missing an appointment.
The influence of gender on attendance rates.
The impact of scholarships and health conditions on no-shows.
The effect of receiving an SMS reminder on appointment attendance.
The role of time between scheduling and the actual appointment.
Visualization: Various plots such as bar charts, histograms, and scatter plots are created to visualize the patterns in the data. For instance, the number of missed appointments is compared across different age groups, gender, and neighborhoods. This helps to visually identify trends and areas of concern.

Results and Insights: The analysis reveals several key findings:

A significant portion of patients miss their appointments, with females being more likely to miss compared to males.
Patients who have received an SMS reminder tend to miss their appointments more often, which requires further investigation.
Certain neighborhoods and age groups show higher no-show rates.
Scholarship status is another strong predictor of whether a patient shows up for their appointment.
In conclusion, this project provides valuable insights into the factors influencing medical appointment attendance. By understanding the underlying causes of no-shows, healthcare providers can make data-driven decisions to improve appointment management. For example, targeted interventions such as better reminder systems, personalized communications, and more flexible appointment scheduling could help reduce the number of missed appointments, improving healthcare service delivery and resource utilization.

The findings from this analysis can also inform policy decisions, particularly in low-income neighborhoods or among specific age groups that are more likely to miss appointments. By addressing these issues, healthcare systems can optimize their resources and enhance patient care.
