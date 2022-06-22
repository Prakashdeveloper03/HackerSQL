# The Blunder
![made-with-sql](https://img.shields.io/badge/Made%20with-SQL-007396.svg)
![terminal](https://img.shields.io/badge/Windows%20Terminal-4D4D4D?logo=windows%20terminal&logoColor=white)
![sublime text](https://img.shields.io/badge/sublime_text-%23575757.svg?logo=sublime-text&logoColor=important)
![vscode](https://img.shields.io/badge/Visual_Studio_Code-0078D4?logo=visual%20studio%20code&logoColor=white)

Samantha was tasked with calculating the average monthly salaries for all employees in the EMPLOYEES table, but did not realize her keyboard's `0` key was broken until after completing the calculation. She wants your help finding the difference between her miscalculation (using salaries with any zeros removed), and the actual average salary.

Write a query calculating the amount of error (i.e.: **actual - miscalculated** average monthly salaries), and round it up to the next integer.

**Input Format**

The EMPLOYEES table is described as follows:

![table image](https://s3.amazonaws.com/hr-challenge-images/12893/1443817108-adc2235c81-1.png)

**Note:** Salary is per month.

**Constraints** : 1000 < Salary < 10<sup>5</sup>

**Sample Input**

![sample input](https://s3.amazonaws.com/hr-challenge-images/12893/1443817161-299cc6eb7f-2.png)

**Sample Output**
```
2061
```

**Explanation**

The table below shows the salaries without zeros as they were entered by Samantha:

![table](https://s3.amazonaws.com/hr-challenge-images/12893/1443817229-eb00d44a3b-3.png)

Samantha computes an average salary of *98.00*. The actual average salary is *2159.00*.

The resulting error between the two calculations is *2159.00 - 98.00 = 2061.00*. Since it is equal to the integer **2061**, it does not get rounded up.


### Solution
```sql
SELECT
    CEIL(AVG(Salary) - AVG(REPLACE(Salary, '0', '')))
FROM
    EMPLOYEES
```