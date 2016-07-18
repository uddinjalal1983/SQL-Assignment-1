-- 1. Which destination in the flights database is the furthest distance away, based on information in the flights table.
-- Show the SQL query(s) that support your conclusion.

SELECT distance FROM flights WHERE distance > 0 ORDER BY distance DESC LIMIT 1;

-- 2. What are the different numbers of engines in the planes table? For each number of engines, which aircraft have
-- the most number of seats? Show the SQL statement(s) that support your result.


select engine, tailnum, sum(seats) from planes group by engine order by sum(seats) desc;


-- 3. Show the total number of flights.

SELECT flight, count(*) FROM flights;

-- 4. Show the total number of flights by airline (carrier).

SELECT carrier, COUNT(*)
FROM flights 
group by carrier
ORDER BY COUNT(*);

-- 5. Show all of the airlines, ordered by number of flights in descending order.

SELECT carrier , flight FROM flights ORDER BY flight DESC;

-- 6. Show only the top 5 airlines, by number of flights, ordered by number of flights in descending order.

SELECT carrier, COUNT(*)
FROM flights 
group by carrier
ORDER BY COUNT(*) DESC limit 5;
 
-- 7. Show only the top 5 airlines, by number of flights of distance 1,000 miles or greater, ordered by number of
-- flights in descending order.

SELECT carrier, COUNT(*)
FROM flights where distance >= 1000
group by carrier
ORDER BY COUNT(*) DESC limit 5 ;

-- 8. Create a question that (a) uses data from the flights database, and (b) requires aggregation to answer it, and
-- write down both the question, and the query that answers the question.

-- Question- On average how much time did the three major New York airports spends on air?

SELECT AVG(air_time) FROM flights WHERE origin IN ('EWR','LGA','JFK');