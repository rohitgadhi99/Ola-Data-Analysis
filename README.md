# Ola-Data-Analysis

## Project Overview

![Project Pipeline](https://github.com/rohitgadhi99/Ola-Data-Analysis/blob/main/Page1%20Ola%20dashboard.png)

This project is an end-to-end data analysis of Ola ride bookings data, focusing on booking patterns, cancellations, customer behavior, and vehicle performance. The goal is to derive actionable business insights from raw data using Excel (data cleaning), SQL (analysis), and Power BI (visualization) — simulating a real-world data analyst workflow.

### Data Setup and Cleaning
   - Generated this Bengaluru city Ola rides (for the month of July 2024) dataset `Bookings` using ChatGPT prompt (prompt give in document)
   - Using Excel – Performed Data Cleaning & Prepared for analysis

### Solving Business problems
   - Using MySQL – For Data Analysis & Key Business Queries

### 1. Retrieve all successful bookings: 
```
SELECT * FROM bookings 
WHERE Booking_Status = 'Success';
```

Business Insight: Total number of rides that were completed. Reveals service reliability and success rate. Helps benchmark service performance and track operational health.

### 2. Find the average ride distance for each vehicle type:
```
select  vehicle_type, avg(ride_distance) as avg_distance
from bookings
group by Vehicle_Type;
```
Business Insight: Understands which vehicle types are used for longer vs. shorter trips. Helps in fleet optimization and pricing strategy (e.g., SUVs for longer trips)

### 3. Get the total number of cancelled rides by customers:
```
SELECT COUNT(*) as cancelled_by_customer FROM bookings
WHERE Booking_Status = 'canceled by Customer';
```
Business Insight: Measures customer-related service failures. Important for identifying friction in customer experience or app issues.

### 4. List the top 5 customers who booked the highest number of rides: 
```
SELECT Customer_ID, COUNT(Booking_ID) as total_rides
FROM bookings
GROUP BY Customer_ID
ORDER BY total_rides DESC LIMIT 5; 
```
Business Insight: Identifies most loyal and frequent customers. Useful for customer retention strategies and targeted loyalty programs.

### 5. Get the number of rides cancelled by drivers due to personal and car-related issues: 
```
SELECT COUNT(*) FROM bookings
WHERE canceled_Rides_by_Driver = 'Personal & Car related issue';
```
Business Insight: Breaks down driver-side operational problems. Helps in driver training, support, and maintenance scheduling.

### 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
```
select max(Driver_Ratings) as max_rating, min(Driver_Ratings) as min_rating 
from bookings
where Vehicle_Type = 'Prime Sedan';
```
Business Insight: Understands service quality consistency for a premium segment. Ensures that high-value customers receive high-quality service.

### 7. Retrieve all rides where payment was made using UPI: 
```
select * FROM bookings
WHERE Payment_Method = 'UPI';
```
Business Insight: Captures user adoption of UPI. Useful for marketing partnerships or discount campaigns with payment providers.


### 8. Find the average customer rating per vehicle type: 
```
SELECT Vehicle_Type, AVG(Customer_Rating) as avg_customer_rating
FROM bookings
GROUP BY Vehicle_Type;
```
Business Insight: Understands which vehicle types provide a better customer experience. Helps in training or removing underperforming vehicle types/drivers.

### 9. Calculate the total booking value of rides completed successfully: 
```
SELECT SUM(Booking_Value) as total_successful_ride_value
FROM bookings
WHERE Booking_Status = 'Success';
```
Business Insight: Revenue from completed rides only. More accurate representation of income than total booking value.

### 10. List all incomplete rides along with the reason: 
```
SELECT Booking_ID, Incomplete_Rides_Reason
FROM bookings
WHERE Incomplete_Rides = 'Yes';
```
Business Insight: Operational problems or service gaps. Identifies the most common reasons for failure — can be fixed via tech or process.

### 11. What is the average V_TAT and C_TAT by vehicle type?
```
SELECT 
  Vehicle_Type,
  ROUND(AVG(V_TAT), 2) AS Avg_Vehicle_Wait_Time,
  ROUND(AVG(C_TAT), 2) AS Avg_Customer_Wait_Time
FROM bookings
WHERE Booking_Status = 'Success'
GROUP BY Vehicle_Type;
```
Business Insight: This shows how long customers wait for a vehicle and how long vehicles wait for customers. If V_TAT is high → indicates delayed driver arrival and
If C_TAT is high → indicates delayed customer readiness. Can help optimize pickup processes and app experience.

### 12. Which days of the week have the highest and lowest number of completed rides?
```
SELECT 
  DAYNAME(Date) AS Day_Of_Week,
  COUNT(*) AS Completed_Rides
FROM bookings
WHERE Booking_Status = 'Success'
GROUP BY Day_Of_Week
ORDER BY FIELD(Day_Of_Week, 'Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday');
```
Business Insight: Understand weekly booking patterns. Helps identify peak demand days. Can plan driver staffing and surge pricing better.

### Q.13. What is the average booking value per km for each vehicle type?
```
SELECT 
  Vehicle_Type,
  ROUND(SUM(Booking_Value) / SUM(Ride_Distance), 2) AS Revenue_Per_KM
FROM bookings
WHERE Booking_Status = 'Success' AND Ride_Distance > 0
GROUP BY Vehicle_Type;
```
Business Insight: Helps understand earnings efficiency. Which vehicle types are most profitable per km? Can help Ola adjust pricing models or prioritize supply.

### Q.14. What percentage of total bookings are incomplete?
```
SELECT 
  ROUND(SUM(CASE WHEN Incomplete_Rides = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS Incomplete_Ride_Percentage
FROM bookings;
```
Business Insight: It is a service quality metric which provides an overview of system/service failures. High incomplete ride % may point to app bugs, location mismatches, driver delays, etc. Helps identify areas needing tech or operational fixes.


## Power BI Dashboard

### Page1: Shown on top
   - Overall summary page showing KPIs such as Total bookings, Total booking value, Booking status breakdown and Ride volume over 

### Page2:
   - Overall summary page showing KPIs such as Total bookings, Total booking value, Booking status breakdown and Ride volume over
     
![Project Pipeline](https://github.com/rohitgadhi99/Ola-Data-Analysis/blob/main/Page2%20Ola%20dashboard.png)

![Project Pipeline](https://github.com/rohitgadhi99/Ola-Data-Analysis/blob/main/Page3%20Ola%20dashboard.png)

![Project Pipeline](https://github.com/rohitgadhi99/Ola-Data-Analysis/blob/main/Page4%20Ola%20dashboard.png)

![Project Pipeline](https://github.com/rohitgadhi99/Ola-Data-Analysis/blob/main/Page5%20Ola%20dashboard.png)







