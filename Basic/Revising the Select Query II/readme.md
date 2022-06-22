# Revising the Select Query II
![made-with-sql](https://img.shields.io/badge/Made%20with-SQL-007396.svg)
![terminal](https://img.shields.io/badge/Windows%20Terminal-4D4D4D?logo=windows%20terminal&logoColor=white)
![sublime text](https://img.shields.io/badge/sublime_text-%23575757.svg?logo=sublime-text&logoColor=important)
![vscode](https://img.shields.io/badge/Visual_Studio_Code-0078D4?logo=visual%20studio%20code&logoColor=white)

Query the NAME field for all American cities in the CITY table with populations larger than `120000`. The CountryCode for America is `USA`.

The CITY table is described as follows:

![query](https://s3.amazonaws.com/hr-challenge-images/8137/1449729804-f21d187d0f-CITY.jpg)

### Solution
```sql
SELECT
    Name
FROM
    City
WHERE
    Population > 120000
    AND CountryCode = "USA";
```