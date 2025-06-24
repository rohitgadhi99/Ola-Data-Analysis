-- Q1. Retrieve all successful bookings

SELECT * FROM bookings 
WHERE Booking_Status = 'Success';

-- Q.2. Find the average ride distance for each vehicle type

select vehicle_type, avg(ride_distance) as avg_distance
from bookings
group by Vehicle_Type;

-- Q.3. Get the total number of cancelled rides by customers

SELECT COUNT(*) as cancelled_by_customer FROM bookings
WHERE Booking_Status = 'canceled by Customer';

-- Q.4. List the top 5 customers who booked the highest number of rides

SELECT Customer_ID, COUNT(Booking_ID) as total_rides
FROM bookings
GROUP BY Customer_ID
ORDER BY total_rides DESC LIMIT 5;

-- Q.5. Get the number of rides cancelled by drivers due to personal and car-related issues

SELECT COUNT(*) FROM bookings
WHERE canceled_Rides_by_Driver = 'Personal & Car related issue';

-- Q.6.  Find the maximum and minimum driver ratings for Prime Sedan bookings

select max(Driver_Ratings) as max_rating, min(Driver_Ratings) as min_rating from bookings
where Vehicle_Type = 'Prime Sedan';

-- Q.7. Retrieve all rides where payment was made using UPI

select * FROM bookings
WHERE Payment_Method = 'UPI';

-- Q.8. Find the average customer rating per vehicle type

SELECT Vehicle_Type, AVG(Customer_Rating) as avg_customer_rating
FROM bookings
GROUP BY Vehicle_Type;

-- Q.9. Calculate the total booking value of rides completed successfully

SELECT SUM(Booking_Value) as total_successful_ride_value
FROM bookings
WHERE Booking_Status = 'Success';

-- Q.10. List all incomplete rides along with the reason

SELECT Booking_ID, Incomplete_Rides_Reason
FROM bookings
WHERE Incomplete_Rides = 'Yes';

-- Q.11. 1. What is the average V_TAT and C_TAT by vehicle type?

SELECT 
  Vehicle_Type,
  ROUND(AVG(V_TAT), 2) AS Avg_Vehicle_Wait_Time,
  ROUND(AVG(C_TAT), 2) AS Avg_Customer_Wait_Time
FROM bookings
WHERE Booking_Status = 'Success'
GROUP BY Vehicle_Type;

-- Q.12. Which days of the week have the highest and lowest number of completed rides?

SELECT 
  DAYNAME(Date) AS Day_Of_Week,
  COUNT(*) AS Completed_Rides
FROM bookings
WHERE Booking_Status = 'Success'
GROUP BY Day_Of_Week
ORDER BY FIELD(Day_Of_Week, 'Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday');

-- Q.13. What is the average booking value per km for each vehicle type?

SELECT 
  Vehicle_Type,
  ROUND(SUM(Booking_Value) / SUM(Ride_Distance), 2) AS Revenue_Per_KM
FROM bookings
WHERE Booking_Status = 'Success' AND Ride_Distance > 0
GROUP BY Vehicle_Type;

-- Q.14. What percentage of total bookings are incomplete?

SELECT 
  ROUND(SUM(CASE WHEN Incomplete_Rides = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS Incomplete_Ride_Percentage
FROM bookings;







