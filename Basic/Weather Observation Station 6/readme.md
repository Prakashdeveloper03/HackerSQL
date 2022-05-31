# Weather Observation Station 6
![made-with-sql](https://img.shields.io/badge/Made%20with-SQL-007396.svg)
![terminal](https://img.shields.io/badge/Windows%20Terminal-4D4D4D?logo=windows%20terminal&logoColor=white)
![sublime text](https://img.shields.io/badge/sublime_text-%23575757.svg?logo=sublime-text&logoColor=important)
![vscode](https://img.shields.io/badge/Visual_Studio_Code-0078D4?logo=visual%20studio%20code&logoColor=white)

Query the list of `CITY` names starting with vowels (i.e., a, e, i, o, or u) from `STATION`. Your result **cannot contain duplicates**.

The STATION table is described as follows:

![query](https://s3.amazonaws.com/hr-challenge-images/9336/1449345840-5f0a551030-Station.jpg)

where `LAT_N` is the northern latitude and `LONG_W` is the western longitude.

### Solution
```sql
SELECT DISTINCT City FROM Station
WHERE LEFT(City, 1) IN ('a','e','i','o','u');
```