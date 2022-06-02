# Weather Observation Station 11
![made-with-sql](https://img.shields.io/badge/Made%20with-SQL-007396.svg)
![terminal](https://img.shields.io/badge/Windows%20Terminal-4D4D4D?logo=windows%20terminal&logoColor=white)
![sublime text](https://img.shields.io/badge/sublime_text-%23575757.svg?logo=sublime-text&logoColor=important)
![vscode](https://img.shields.io/badge/Visual_Studio_Code-0078D4?logo=visual%20studio%20code&logoColor=white)

Query the list of `CITY` names from `STATION` that either do not start with vowels or do not end with vowels. Your result *cannot contain duplicates*.

The STATION table is described as follows:

![query](https://s3.amazonaws.com/hr-challenge-images/9336/1449345840-5f0a551030-Station.jpg)

where `LAT_N` is the northern latitude and `LONG_W` is the western longitude.

### Solution
```sql
SELECT DISTINCT City FROM Station
WHERE RIGHT (City, 1) NOT IN ('A','E', 'I', 'O', 'U') 
      OR LEFT (City, 1) NOT IN ('A','E', 'I', 'O', 'U');
```