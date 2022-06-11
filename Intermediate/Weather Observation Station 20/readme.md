# Weather Observation Station 20
![made-with-sql](https://img.shields.io/badge/Made%20with-SQL-007396.svg)
![terminal](https://img.shields.io/badge/Windows%20Terminal-4D4D4D?logo=windows%20terminal&logoColor=white)
![sublime text](https://img.shields.io/badge/sublime_text-%23575757.svg?logo=sublime-text&logoColor=important)
![vscode](https://img.shields.io/badge/Visual_Studio_Code-0078D4?logo=visual%20studio%20code&logoColor=white)

A **median** is defined as a number separating the higher half of a data set from the lower half. Query the median of the Northern Latitudes (LAT_N) from STATION and round your answer to `4` decimal places.

**Input Format**

The STATION table is described as follows:

![query](https://s3.amazonaws.com/hr-challenge-images/9336/1449345840-5f0a551030-Station.jpg)

where `LAT_N` is the northern latitude and `LONG_W` is the western longitude.

### Solution
```sql
SET @r = 0;
SELECT ROUND(AVG(Lat_N), 4)
FROM (SELECT (@r := @r + 1) AS r, Lat_N FROM Station ORDER BY Lat_N)
Temp
WHERE
    r = (SELECT CEIL(COUNT(*) / 2) FROM Station) OR
    r = (SELECT FLOOR((COUNT(*) / 2) + 1) FROM Station)
```