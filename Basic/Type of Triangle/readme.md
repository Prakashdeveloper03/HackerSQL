# Type of Triangle
![made-with-sql](https://img.shields.io/badge/Made%20with-SQL-007396.svg)
![terminal](https://img.shields.io/badge/Windows%20Terminal-4D4D4D?logo=windows%20terminal&logoColor=white)
![sublime text](https://img.shields.io/badge/sublime_text-%23575757.svg?logo=sublime-text&logoColor=important)
![vscode](https://img.shields.io/badge/Visual_Studio_Code-0078D4?logo=visual%20studio%20code&logoColor=white)

Write a query identifying the type of each record in the TRIANGLES table using its three side lengths. Output one of the following statements for each record in the table:

- **Equilateral**: It's a triangle with  sides of equal `3` length.
- **Isosceles**: It's a triangle with  sides of equal `2` length.
- **Scalene**: It's a triangle with  sides of differing `3` lengths.
- **Not A Triangle**: The given values of A, B, and C don't form a triangle.

**Input Format**

The TRIANGLES table is described as follows:

![table image](https://s3.amazonaws.com/hr-challenge-images/12887/1443815629-ac2a843fb7-1.png)

Each row in the table denotes the lengths of each of a triangle's three sides.

**Sample Input**

![sample input](https://s3.amazonaws.com/hr-challenge-images/12887/1443815827-cbfc1ca12b-2.png)

**Sample Output**
```
Isosceles
Equilateral
Scalene
Not A Triangle
```

### Solution
```sql
SELECT
    IF(
        A + B <= C
        OR B + C <= A
        OR A + C <= B,
        "Not A Triangle",
        IF(
            A = B
            AND B = C,
            "Equilateral",
            IF(
                A = B
                OR B = C
                OR A = C,
                "Isosceles",
                "Scalene"
            )
        )
    )
FROM
    TRIANGLES;
```