SELECT
    DISTINCT City
FROM
    Station
WHERE
    RIGHT(City, 1) NOT IN ('a', 'e', 'i', 'o', 'u');