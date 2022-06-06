SELECT ct.Continent, FLOOR(AVG(ci.Population)) FROM City ci
INNER JOIN Country ct ON ci.Countrycode = ct.Code
GROUP BY ct.Continent;