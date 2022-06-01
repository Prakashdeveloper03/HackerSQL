SELECT DISTINCT City FROM Station
WHERE LEFT(City, 1) NOT IN ('a','e','i','o','u');