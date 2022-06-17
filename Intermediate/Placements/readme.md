# Placements
![made-with-sql](https://img.shields.io/badge/Made%20with-SQL-007396.svg)
![terminal](https://img.shields.io/badge/Windows%20Terminal-4D4D4D?logo=windows%20terminal&logoColor=white)
![sublime text](https://img.shields.io/badge/sublime_text-%23575757.svg?logo=sublime-text&logoColor=important)
![vscode](https://img.shields.io/badge/Visual_Studio_Code-0078D4?logo=visual%20studio%20code&logoColor=white)

You are given three tables: Students, Friends and Packages. Students contains two columns: ID and Name. Friends contains two columns: ID and Friend_ID (ID of the ONLY best friend). Packages contains two columns: ID and Salary (offered salary in $ thousands per month).

![table 1](https://s3.amazonaws.com/hr-challenge-images/12895/1443820186-2a9b4939a8-1.png)

Write a query to output the names of those students whose best friends got offered a higher salary than them. Names must be ordered by the salary amount offered to the best friends. It is guaranteed that no two students got same salary offer.

**Sample Input**

![sample input1](https://s3.amazonaws.com/hr-challenge-images/12895/1443820079-9bd1e231b1-2_1.png)

![sample input2](https://s3.amazonaws.com/hr-challenge-images/12895/1443820100-adb691b2f5-2_2.png)

**Sample Output**
```
Samantha
Julia
Scarlet
```

**Explanation**

See the following table:
![explanation](https://s3.amazonaws.com/hr-challenge-images/12895/1443819966-c37c146d27-3.png)

Now, Samantha's best friend got offered a higher salary than her at 11.55
Julia's best friend got offered a higher salary than her at 12.12
Scarlet's best friend got offered a higher salary than her at 15.2
Ashley's best friend did NOT get offered a higher salary than her
The name output, when ordered by the salary offered to their friends, will be:
- Samantha
- Julia
- Scarlet

### Solution
```sql
SELECT
    temp1.sn
FROM
    (
        SELECT
            S.ID si,
            S.Name sn,
            P.Salary ps
        FROM
            Students S
            JOIN Packages P ON S.ID = P.ID
    ) temp1
    JOIN (
        SELECT
            FF.ID fi,
            FF.Friend_ID fd,
            PP.Salary pps
        FROM
            Friends FF
            JOIN Packages PP ON FF.Friend_ID = pp.ID
    ) temp2 ON temp1.si = temp2.fi
    AND temp1.ps < temp2.pps
ORDER BY
    temp2.pps ASC;
```