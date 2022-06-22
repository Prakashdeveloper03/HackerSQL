SELECT
    ROUND(
        ABS(MIN(lat_N) - MAX(lat_N)) + ABS(MIN(long_W) - MAX(long_W)),
        4
    )
FROM
    Station