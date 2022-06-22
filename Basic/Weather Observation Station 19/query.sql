SELECT
    ROUND(
        SQRT(
            POWER(MAX(lat_N) - MIN(lat_N), 2) + POWER(MAX(long_W) - MIN(long_W), 2)
        ),
        4
    )
FROM
    STATION;