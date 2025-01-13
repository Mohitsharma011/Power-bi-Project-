create database website;
use website;
drop table website_data;
select * from website_data;
-- Retrieve the average Session Duration, Bounce Rate, and ConversionRate for each Traffic Source. Sort the results by Traffic Source in ascending order.
SELECT 
    ROUND(AVG(sessionduration), 1) AS avg_session_duration,
    ROUND(AVG(bouncerate), 1) AS avg_bounce_rate,
    ROUND(AVG(conversionrate), 1) AS avg_conversion_rate
FROM
    website_data
GROUP BY trafficsource
ORDER BY trafficsource ASC;

-- Query to Retrieve the Total Number of Visits for Each Traffic Source
SELECT 
    TrafficSource, 
    SUM(PreviousVisits) AS Total_Visits
FROM 
   website_data
GROUP BY 
    TrafficSource
ORDER BY 
    Total_Visits DESC;
    
-- 3. Query to Find the Traffic Source with the Lowest Bounce Rate
SELECT 
    trafficsource, ROUND(AVG(bouncerate), 2) AS avg_bouncerate
FROM
    website_data
GROUP BY trafficsource
ORDER BY avg_bouncerate ASC
LIMIT 1;

-- 4. Query to Find the Total Time On Page for Each Traffic Source 
SELECT 
    trafficsource, ROUND(SUM(timeonpage), 1) AS total_timepage
FROM
    website_data
GROUP BY trafficsource
ORDER BY total_timepage DESC;


-- 5.Query to Retrieve the Maximum Session Duration and its Associated Traffic Source 
SELECT 
    trafficsource, MAX(sessionduration) AS highest_session
FROM
    website_data
GROUP BY trafficsource
ORDER BY highest_session DESC
LIMIT 1;

-- 6. Query to Find the Average Time On Page and Previous Visits for Sessions with High Conversion Rate
SELECT 
    ROUND(AVG(timeonpage), 1) AS AVG_Timeonpage,
    ROUND(AVG(previousvisits), 1) AS Avg_previousvisits
FROM
    website_data
WHERE
    conversionrate > 0.5;
    
-- 7. Query to Retrieve the Traffic Source with the Maximum Page Views
-- This query will show the Traffic Source that has the highest total Page Views.

-- select trafficsource ,sum(pageviews) as Total_Page_views
-- from website_data
-- group by trafficsource
-- order by Total_Page_views Desc
-- limit 1;

-- 8. Query to Retrieve the Average Session Duration for Each Traffic Source and Filter by Bounce Rate Less Than 50%
-- This query calculates the average Session Duration for each Traffic Source but only includes sessions where the Bounce Rate is less than 50%.

select trafficsource,avg(sessionduration) as avg_sessionduration from website_data where bouncerate < 0.5
group by trafficsource order by avg_sessionduration desc;










