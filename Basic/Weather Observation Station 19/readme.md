# Weather Observation Station 19
![made-with-sql](https://img.shields.io/badge/Made%20with-SQL-007396.svg)
![terminal](https://img.shields.io/badge/Windows%20Terminal-4D4D4D?logo=windows%20terminal&logoColor=white)
![sublime text](https://img.shields.io/badge/sublime_text-%23575757.svg?logo=sublime-text&logoColor=important)
![vscode](https://img.shields.io/badge/Visual_Studio_Code-0078D4?logo=visual%20studio%20code&logoColor=white)

Consider **P1(a, b)** and **P2(c, d)** to be two points on a 2D plane.
- `a` happens to equal the minimum value in Northern Latitude (LAT_N in STATION).
- `b` happens to equal the minimum value in Western Longitude (LONG_W in STATION).
- `c` happens to equal the maximum value in Northern Latitude (LAT_N in STATION).
- `d` happens to equal the maximum value in Western Longitude (LONG_W in STATION).

Query the **Euclidean Distance** between points `P1` and `P2` and round it to a scale of `4` decimal places.

**Input Format**

The STATION table is described as follows:

![query](https://s3.amazonaws.com/hr-challenge-images/9336/1449345840-5f0a551030-Station.jpg)

where `LAT_N` is the northern latitude and `LONG_W` is the western longitude.

### Solution
```sql
SELECT
    ROUND(
        SQRT(
            POWER(MAX(lat_N) - MIN(lat_N), 2) + POWER(MAX(long_W) - MIN(long_W), 2)
        ),
        4
    )
FROM
    STATION;
```