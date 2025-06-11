USE food_delivery;
SELECT * FROM food_delivery.food_delivery_data;

# find average delivery time by city and traffic condition
SELECT city,Road_traffic_density,AVG(Time_taken_in_min) from food_delivery_data
group by city, Road_traffic_density
order by AVG(Time_taken_in_min);

# an average delivery time taken in different weather condition with distinct traffic situation.
SELECT Weatherconditions, Road_traffic_density, AVG(Time_taken_in_min) FROM food_delivery_data
GROUP BY Weatherconditions, Road_traffic_density
ORDER BY AVG(Time_taken_in_min) DESC; 

SELECT Weatherconditions, Road_traffic_density, AVG(Time_taken_in_min) FROM food_delivery_data
WHERE (Weatherconditions= 'Fog' OR Weatherconditions= 'Cloudy') 
AND  (Road_traffic_density= 'Jam' OR Road_traffic_density= 'High')
GROUP BY Weatherconditions, Road_traffic_density
ORDER BY AVG(Time_taken_in_min) DESC;

# Analyse the comparison of delivery time and total orders by festival or not.
SELECT Festival,COUNT(*) AS 'Total_Orders', AVG(Time_taken_in_min) AS 'Average Delivery Time' from food_delivery_data
group by Festival;

#top 10 delivery person who has deliveres most orders with average minimum delivery time of his career
SELECT Delivery_person_ID, COUNT(*) AS 'Total Delivered Orders', AVG(Time_taken_in_min) AS 'Avg. Delivery time' from food_delivery_data
GROUP BY Delivery_person_ID
ORDER BY COUNT(*) DESC ,AVG(Time_taken_in_min) LIMIT 10;

# impact on delivery time on vehicle condition 
SELECT vehicle_condition, AVG(Time_taken_in_min) from food_delivery_data
group by vehicle_condition
order by vehicle_condition asc ;

SELECT Vehicle_condition,
	CASE
    WHEN Vehicle_condition=0 THEN 'Poor'
    WHEN Vehicle_condition=1 THEN 'Neutral'
    ELSE 'Good'
    END AS condition_of_vehicle,
AVG(Time_taken_in_min) AS 'Avg. delivery time' FROM food_delivery_data
GROUP BY Vehicle_condition
ORDER BY AVG(Time_taken_in_min) ;

#order volume over time
select 
	CASE 
		WHEN month(Order_Date)=2 THEN 'FEBRUARY'
        WHEN month(Order_Date)=3 THEN 'MARCH'
        ELSE 'APRIL'
        END AS 'month_name', COUNT(*) AS 'total orders within_month'
        from food_delivery_data
        GROUP BY month_name
        order by COUNT(*) ;
        
# show the relation between type of vehicle, type of order and traffic density if exists
SELECT Type_of_vehicle, AVG(Time_taken_in_min) FROM food_delivery_data
GROUP BY Type_of_vehicle
ORDER BY AVG(Time_taken_in_min);

SELECT Type_of_order, AVG(Time_taken_in_min) FROM food_delivery_data
GROUP BY Type_of_order
ORDER BY AVG(Time_taken_in_min);

SELECT Road_traffic_density, AVG(Time_taken_in_min) FROM food_delivery_data
GROUP BY Road_traffic_density
ORDER BY AVG(Time_taken_in_min);

SELECT Type_of_order, Road_traffic_density ,AVG(Time_taken_in_min) FROM food_delivery_data
GROUP BY Type_of_order, Road_traffic_density
ORDER BY AVG(Time_taken_in_min) ;
    
# the rating of deliver person is affected by the time taken in delivery by him?
SELECT Delivery_person_Ratings, AVG(Time_taken_in_min) FROM food_delivery_data
GROUP BY Delivery_person_Ratings
ORDER BY AVG(Time_taken_in_min) DESC;
    
# is there any impact of weather condition on delivery?
SELECT Weatherconditions, AVG(Time_taken_in_min) FROM food_delivery_data
GROUP BY Weatherconditions
ORDER BY AVG(Time_taken_in_min) DESC;