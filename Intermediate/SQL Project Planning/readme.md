# SQL Project Planning
![made-with-sql](https://img.shields.io/badge/Made%20with-SQL-007396.svg)
![terminal](https://img.shields.io/badge/Windows%20Terminal-4D4D4D?logo=windows%20terminal&logoColor=white)
![sublime text](https://img.shields.io/badge/sublime_text-%23575757.svg?logo=sublime-text&logoColor=important)
![vscode](https://img.shields.io/badge/Visual_Studio_Code-0078D4?logo=visual%20studio%20code&logoColor=white)

You are given a table, Projects, containing three columns: Task_ID, Start_Date and End_Date. It is guaranteed that the difference between the End_Date and the Start_Date is equal to 1 day for each row in the table.

![table1](https://s3.amazonaws.com/hr-challenge-images/12894/1443819551-639948acc0-1.png)

If the End_Date of the tasks are consecutive, then they are part of the same project. Samantha is interested in finding the total number of different projects completed.

Write a query to output the start and end dates of projects listed by the number of days it took to complete the project in ascending order. If there is more than one project that have the same number of completion days, then order by the start date of the project.

**Sample Input**

![sample input](https://s3.amazonaws.com/hr-challenge-images/12894/1443819440-1c40e943a1-2.png)

**Sample Output**

```
2015-10-28 2015-10-29
2015-10-30 2015-10-31
2015-10-13 2015-10-15
2015-10-01 2015-10-04
```

**Explanation**

The example describes following four projects:
- Project 1: Tasks 1, 2 and 3 are completed on consecutive days, so these are part of the project. Thus start date of project is 2015-10-01 and end date is 2015-10-04, so it took 3 days to complete the project.
- Project 2: Tasks 4 and 5 are completed on consecutive days, so these are part of the project. Thus, the start date of project is 2015-10-13 and end date is 2015-10-15, so it took 2 days to complete the project.
- Project 3: Only task 6 is part of the project. Thus, the start date of project is 2015-10-28 and end date is 2015-10-29, so it took 1 day to complete the project.
- Project 4: Only task 7 is part of the project. Thus, the start date of project is 2015-10-30 and end date is 2015-10-31, so it took 1 day to complete the project.

### Solution
```sql
SELECT
    START_DATE,
    MIN(END_DATE)
FROM
    (
        SELECT
            START_DATE
        FROM
            PROJECTS
        WHERE
            START_DATE NOT IN (
                SELECT
                    END_DATE
                FROM
                    PROJECTS
            )
    ) A,
    (
        SELECT
            END_DATE
        FROM
            PROJECTS
        WHERE
            END_DATE NOT IN (
                SELECT
                    START_DATE
                FROM
                    PROJECTS
            )
    ) B
WHERE
    START_DATE < END_DATE
GROUP BY
    START_DATE
ORDER BY
    (MIN(END_DATE) - START_DATE),
    START_DATE;
```