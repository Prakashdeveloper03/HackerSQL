# Occupations
![made-with-sql](https://img.shields.io/badge/Made%20with-SQL-007396.svg)
![terminal](https://img.shields.io/badge/Windows%20Terminal-4D4D4D?logo=windows%20terminal&logoColor=white)
![sublime text](https://img.shields.io/badge/sublime_text-%23575757.svg?logo=sublime-text&logoColor=important)
![vscode](https://img.shields.io/badge/Visual_Studio_Code-0078D4?logo=visual%20studio%20code&logoColor=white)

Pivot the Occupation column in **OCCUPATIONS** so that each Name is sorted alphabetically and displayed underneath its corresponding Occupation. The output column headers should be Doctor, Professor, Singer, and Actor, respectively.

**Note:** Print NULL when there are no more names corresponding to an occupation

**Input Format**

The OCCUPATIONS table is described as follows:

![occupations](https://s3.amazonaws.com/hr-challenge-images/12889/1443816414-2a465532e7-1.png)

Occupation will only contain one of the following values: Doctor, Professor, Singer or Actor.

**Sample Input**

![sample input](https://s3.amazonaws.com/hr-challenge-images/12890/1443817648-1b2b8add45-2.png)

**Sample Output**
```
Jenny    Ashley     Meera  Jane
Samantha Christeen  Priya  Julia
NULL     Ketty      NULL   Maria
```

**Explanation**

The first column is an alphabetically ordered list of Doctor names.
The second column is an alphabetically ordered list of Professor names.
The third column is an alphabetically ordered list of Singer names.
The fourth column is an alphabetically ordered list of Actor names.
The empty cell data for columns with less than the maximum number of names per occupation (in this case, the Professor and Actor columns) are filled with **NULL** values.

### Solution
```sql
SET
    @r1 = 0,
    @r2 = 0,
    @r3 = 0,
    @r4 = 0;

SELECT
    MIN(Doctor),
    MIN(Professor),
    MIN(Singer),
    MIN(Actor)
FROM
    (
        SELECT
            CASE
                WHEN Occupation = "Doctor" THEN (@r1: = @r1 + 1)
                WHEN Occupation = "Professor" THEN (@r2: = @r2 + 1)
                WHEN Occupation = "Singer" THEN (@r3: = @r3 + 1)
                WHEN Occupation = "Actor" THEN (@r4: = @r4 + 1)
            END AS RowNumber,
            CASE
                WHEN Occupation = "Doctor" THEN Name
            END AS Doctor,
            CASE
                WHEN Occupation = "Professor" THEN Name
            END AS Professor,
            CASE
                WHEN Occupation = "Singer" THEN Name
            END AS Singer,
            CASE
                WHEN Occupation = "Actor" THEN Name
            END AS Actor
        FROM
            OCCUPATIONS
        ORDER BY
            Name
    ) Temp
GROUP BY
    RowNumber;
```