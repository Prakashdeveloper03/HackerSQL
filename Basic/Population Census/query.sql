SELECT
    SUM(ci.population)
FROM
    City ci
    INNER JOIN Country ct ON ct.code = ci.countrycode
WHERE
    ct.continent = "Asia";