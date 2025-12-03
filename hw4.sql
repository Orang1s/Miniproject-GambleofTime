/*
Question1: Find maximal departure delay in minutes for each airline. Sort results from smallest to largest maximum 
delay. Output airline names and values of the delay.
*/
SELECT 
    al.Name,
    MAX(f.DepDelay) AS Max_Delay_Minutes
FROM al_perf f
JOIN L_AIRLINE_ID al ON f.DOT_ID_Reporting_Airline = al.ID
GROUP BY al.Name
ORDER BY Max_Delay_Minutes ASC;
-- Rows returned: 12

/*
Question2: Find maximal early departures in minutes for each airline. Sort results from largest to smallest. Output 
airline names.
*/
SELECT 
    al.Name,
    ABS(MIN(f.DepDelay)) AS Max_EarlyDepMin
FROM al_perf f
JOIN L_AIRLINE_ID al ON f.DOT_ID_Reporting_Airline = al.ID
WHERE f.DepDelay < 0 
GROUP BY al.Name
ORDER BY Max_EarlyDepMin DESC;
-- Rows returned: 12

/*
Question3: Rank days of the week by the number of flights performed by all airlines on that day (1 is the busiest). 
Output the day of the week names, number of flights and ranks in the rank increasing order.
*/
SELECT 
    w.Day AS Day_Name,
    COUNT(*) AS Flight_Count,
    RANK() OVER (ORDER BY COUNT(*) DESC) AS Rank_Place
FROM al_perf f
JOIN L_WEEKDAYS w ON f.DayOfWeek = w.Code
GROUP BY w.Day
ORDER BY Rank_Place ASC;
-- Rows returned: 7

/*
Question4: Find the airport that has the highest average departure delay among all airports. Consider 0 minutes delay 
for flights that departed early. Output one line of results: the airport name, code, and average delay.
*/
SELECT 
    a.Name AS Airport_Name,
    f.Origin AS Airport_Code,
    AVG(CASE WHEN f.DepDelay < 0 THEN 0 ELSE f.DepDelay END) AS Avg_Delay
FROM al_perf f
JOIN L_AIRPORT a ON f.Origin = a.Code
GROUP BY a.Name, f.Origin
ORDER BY Avg_Delay DESC
LIMIT 1;
-- Rows returned: 1

/*
Question5: For each airline find an airport where it has the highest average departure delay. Output an airline name, a 
name of the airport that has the highest average delay, and the value of that average delay.
*/
WITH AlApStats AS (
    SELECT 
        al.Name AS Airline_Name,
        ap.Name AS Airport_Name,
        AVG(CASE WHEN f.DepDelay < 0 THEN 0 ELSE f.DepDelay END) AS Avg_Delay
    FROM al_perf f
    JOIN L_AIRLINE_ID al ON f.DOT_ID_Reporting_Airline = al.ID
    JOIN L_AIRPORT ap ON f.Origin = ap.Code
    GROUP BY 
		al.Name, ap.Name
),
RankedStats AS (
    SELECT 
        Airline_Name,
        Airport_Name,
        Avg_Delay,
        RANK() OVER (PARTITION BY Airline_Name ORDER BY Avg_Delay DESC) as rnk
    FROM AlApStats
)
SELECT 
    Airline_Name,
    Airport_Name,
    Avg_Delay
FROM RankedStats
WHERE rnk = 1;
-- Rows returned: 12

/*
Question6:
a: Check if your dataset has any canceled flights.
b: If it does, what was the most frequent reason for each departure airport? Output airport name, 
the most frequent reason, and the number of cancelations for that reason.
*/
SELECT COUNT(*) as Cancelled_Count 
FROM al_perf 
WHERE Cancelled = 1;
-- Rows returned: 1

WITH CancelCounts AS (
    SELECT 
        ap.Name AS Airport_Name,
        lc.Reason AS Reason_Description,
        COUNT(*) AS Reason_Count
    FROM al_perf f
    JOIN L_AIRPORT ap ON f.Origin = ap.Code
    JOIN L_CANCELATION lc ON f.CancellationCode = lc.Code
    WHERE f.Cancelled = 1
    GROUP BY 
        ap.Name, lc.Reason
),
RankedCancel AS (
    SELECT 
        Airport_Name,
        Reason_Description,
        Reason_Count,
        RANK() OVER (PARTITION BY Airport_Name ORDER BY Reason_Count DESC) as rnk
    FROM 
        CancelCounts
)
SELECT 
    Airport_Name,
    Reason_Description,
    Reason_Count
FROM RankedCancel
WHERE 
    rnk = 1;
-- Rows returned 182

/*
Question7: Build a report that for each day output average number of flights over the preceding 3 days.
*/
WITH DailyCounts AS (
    SELECT 
        FlightDate, 
        COUNT(*) as Daily_Flights
    FROM al_perf f
    GROUP BY FlightDate
)
SELECT 
    FlightDate,
    Daily_Flights,
    AVG(Daily_Flights) OVER (
        ORDER BY FlightDate 
        RANGE INTERVAL 3 DAY PRECEDING AND INTERVAL 1 DAY PRECEDING
    ) as Avg_Preceding_3_Days
FROM 
    DailyCounts
ORDER BY 
    FlightDate;
-- Rows returned: 31