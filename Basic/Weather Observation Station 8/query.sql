SELECT DISTINCT City FROM Station
WHERE LEFT(City, 1) IN ('a','e','i','o','u') AND
      RIGHT(City, 1) IN ('a','e','i','o','u');