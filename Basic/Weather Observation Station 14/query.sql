SELECT
    TRUNCATE(MAX(Lat_N), 4)
FROM
    Station
WHERE
    Lat_N < 137.2345;