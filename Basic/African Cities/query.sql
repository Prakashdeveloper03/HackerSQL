SELECT
    ci.name
FROM
    City ci
    INNER JOIN Country ct ON ci.Countrycode = ct.Code
WHERE
    ct.Continent = "Africa";