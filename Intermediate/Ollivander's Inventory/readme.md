# Ollivander's Inventory
![made-with-sql](https://img.shields.io/badge/Made%20with-SQL-007396.svg)
![terminal](https://img.shields.io/badge/Windows%20Terminal-4D4D4D?logo=windows%20terminal&logoColor=white)
![sublime text](https://img.shields.io/badge/sublime_text-%23575757.svg?logo=sublime-text&logoColor=important)
![vscode](https://img.shields.io/badge/Visual_Studio_Code-0078D4?logo=visual%20studio%20code&logoColor=white)

Harry Potter and his friends are at Ollivander's with Ron, finally replacing Charlie's old broken wand.

Hermione decides the best way to choose is by determining the minimum number of gold galleons needed to buy each non-evil wand of high power and age. Write a query to print the id, age, coins_needed, and power of the wands that Ron's interested in, sorted in order of descending power. If more than one wand has same power, sort the result in order of descending age.

**Input Format**

The following tables contain data on the wands in Ollivander's inventory:
- **Wands**: The id is the id of the wand, code is the code of the wand, coins_needed is the total number of gold galleons needed to buy the wand, and power denotes the quality of the wand (the higher the power, the better the wand is).

    ![wands](https://s3.amazonaws.com/hr-challenge-images/19502/1458538092-b2a8163a74-ScreenShot2016-03-08at12.13.39AM.png)

- **Wands_Property**: The code is the code of the wand, age is the age of the wand, and is_evil denotes whether the wand is good for the dark arts. If the value of is_evil is 0, it means that the wand is not evil. The mapping between code and age is one-one, meaning that if there are two pairs,
*(code1, age1)* and *(code2, age2)*, then *code1 != code2* and *age1 != age2*
    
    ![wands property](https://s3.amazonaws.com/hr-challenge-images/19502/1458538221-18c4092b7d-ScreenShot2016-03-08at12.13.53AM.png)

**Sample Input**

Wands Table:

![sample input 1](https://s3.amazonaws.com/hr-challenge-images/19502/1458538559-51bf29644e-ScreenShot2016-03-21at10.34.41AM.png)

Wands_Property Table:

![sample input 2](https://s3.amazonaws.com/hr-challenge-images/19502/1458538583-fd514566f9-ScreenShot2016-03-21at10.34.28AM.png)

**Sample Output**

```
9 45 1647 10
12 17 9897 10
1 20 3688 8
15 40 6018 7
19 20 7651 6
11 40 7587 5
10 20 504 5
18 40 3312 3
20 17 5689 3
5 45 6020 2
14 40 5408 1
```

### Solution
```sql
SELECT
    a.id,
    b.age,
    a.coins_needed,
    a.power
FROM
    wands a
    JOIN wands_property b ON a.code = b.code
WHERE
    b.is_evil = 0
    AND a.coins_needed = (
        SELECT
            MIN(a1.coins_needed)
        FROM
            wands a1
            JOIN wands_property b1 ON a1.code = b1.code
        WHERE
            b.age = b1.age
            AND a.power = a1.power
    )
ORDER BY
    a.power DESC,
    b.age DESC;
```