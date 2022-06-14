# New Companies
![made-with-sql](https://img.shields.io/badge/Made%20with-SQL-007396.svg)
![terminal](https://img.shields.io/badge/Windows%20Terminal-4D4D4D?logo=windows%20terminal&logoColor=white)
![sublime text](https://img.shields.io/badge/sublime_text-%23575757.svg?logo=sublime-text&logoColor=important)
![vscode](https://img.shields.io/badge/Visual_Studio_Code-0078D4?logo=visual%20studio%20code&logoColor=white)

Amber's conglomerate corporation just acquired some new companies. Each of the companies follows this hierarchy:

![table1](https://s3.amazonaws.com/hr-challenge-images/19505/1458531031-249df3ae87-ScreenShot2016-03-21at8.59.56AM.png)

Given the table schemas below, write a query to print the company_code, founder name, total number of lead managers, total number of senior managers, total number of managers, and total number of employees. Order your output by ascending company_code.

**Note:**

- The tables may contain duplicate records.
- The company_code is string, so the sorting should not be numeric. For example, if the company_codes are C_1, C_2, and C_10, then the ascending company_codes will be C_1, C_10, and C_2.

**Sample Input**

Company Table:

![company table](https://s3.amazonaws.com/hr-challenge-images/19505/1458535049-2a207c44b3-ScreenShot2016-03-21at8.50.52AM.png)

Lead_Manager Table:

![lead manager table](https://s3.amazonaws.com/hr-challenge-images/19505/1458535073-919107f639-ScreenShot2016-03-21at8.51.03AM.png)

Senior_Manager Table:

![senior manager table](https://s3.amazonaws.com/hr-challenge-images/19505/1458535111-b1c48335b3-ScreenShot2016-03-21at8.51.15AM.png)

Manager Table:

![manager table](https://s3.amazonaws.com/hr-challenge-images/19505/1458535122-888f4bf340-ScreenShot2016-03-21at8.51.26AM.png)

Employee Table:

![employee table](https://s3.amazonaws.com/hr-challenge-images/19505/1458535134-878767e0d9-ScreenShot2016-03-21at8.51.52AM.png)

**Sample Output**

```
C1 Monika 1 2 1 2
C2 Samantha 1 1 2 2
```

**Explanation**

In company C1, the only lead manager is LM1. There are two senior managers, SM1 and SM2, under LM1. There is one manager, M1, under senior manager SM1. There are two employees, E1 and E2, under manager M1.

In company C2, the only lead manager is LM2. There is one senior manager, SM3, under LM2. There are two managers, M2 and M3, under senior manager SM3. There is one employee, E3, under manager M2, and another employee, E4, under manager, M3.

### Solution
```sql
SELECT
    company_code,
    FOUNDER,
    (
        SELECT
            COUNT(DISTINCT lead_manager_code)
        FROM
            lead_manager
        WHERE
            company_code = c.company_code
    ),
    (
        SELECT
            COUNT(DISTINCT senior_manager_code)
        FROM
            senior_manager
        WHERE
            company_code = c.company_code
    ),
    (
        SELECT
            COUNT(DISTINCT manager_code)
        FROM
            manager
        WHERE
            company_code = c.company_code
    ),
    (
        SELECT
            COUNT(DISTINCT employee_code)
        FROM
            employee
        WHERE
            company_code = c.company_code
    )
FROM
    company c
ORDER BY
    company_code;
```