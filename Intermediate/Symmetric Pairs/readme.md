# Symmetric Pairs
![made-with-sql](https://img.shields.io/badge/Made%20with-SQL-007396.svg)
![terminal](https://img.shields.io/badge/Windows%20Terminal-4D4D4D?logo=windows%20terminal&logoColor=white)
![sublime text](https://img.shields.io/badge/sublime_text-%23575757.svg?logo=sublime-text&logoColor=important)
![vscode](https://img.shields.io/badge/Visual_Studio_Code-0078D4?logo=visual%20studio%20code&logoColor=white)

You are given a table, Functions, containing two columns: X and Y.

![table1](https://s3.amazonaws.com/hr-challenge-images/12892/1443818798-51909e977d-1.png)

Two pairs (X1, Y1) and (X2, Y2) are said to be symmetric pairs if X1 = Y2 and X2 = Y1.

Write a query to output all such symmetric pairs in ascending order by the value of X. List the rows such that X1 ≤ Y1.

**Sample Input**

![sample input](https://s3.amazonaws.com/hr-challenge-images/12892/1443818693-b384c24e35-2.png)

**Sample Output**

```
20 20
20 21
22 23
```


### Solution
```sql
SELECT
    X,
    Y
FROM
    FUNCTIONS F1
WHERE
    EXISTS (
        SELECT
            *
        FROM
            FUNCTIONS F2
        WHERE
            F2.Y = F1.X
            AND F2.X = F1.Y
            AND F2.X > F1.X
    )
    AND (X != Y)
UNION
SELECT
    X,
    Y
FROM
    FUNCTIONS F1
WHERE
    X = Y
    AND (
        (
            SELECT
                COUNT(*)
            FROM
                FUNCTIONS
            WHERE
                X = F1.X
                AND Y = F1.X
        ) > 1
    )
ORDER BY
    X;
```