# Draw The Triangle 1
![made-with-sql](https://img.shields.io/badge/Made%20with-SQL-007396.svg)
![terminal](https://img.shields.io/badge/Windows%20Terminal-4D4D4D?logo=windows%20terminal&logoColor=white)
![sublime text](https://img.shields.io/badge/sublime_text-%23575757.svg?logo=sublime-text&logoColor=important)
![vscode](https://img.shields.io/badge/Visual_Studio_Code-0078D4?logo=visual%20studio%20code&logoColor=white)

P(R) represents a pattern drawn by Julia in R rows. The following pattern represents P(5):
```
* * * * *
* * * *
* * *
* *
*
```
Write a query to print the pattern P(20).

### Solution
```sql
SET @row := 21;
SELECT repeat('* ', @row := @row - 1)
FROM information_schema.tables;
```