SELECT
    City,
    LENGTH(City)
FROM
    Station
ORDER BY
    LENGTH(City) DESC,
    City ASC
LIMIT
    1;

SELECT
    City,
    LENGTH(City)
FROM
    Station
ORDER BY
    LENGTH(City) ASC,
    City ASC
LIMIT
    1;