# Challeges
![made-with-sql](https://img.shields.io/badge/Made%20with-SQL-007396.svg)
![terminal](https://img.shields.io/badge/Windows%20Terminal-4D4D4D?logo=windows%20terminal&logoColor=white)
![sublime text](https://img.shields.io/badge/sublime_text-%23575757.svg?logo=sublime-text&logoColor=important)
![vscode](https://img.shields.io/badge/Visual_Studio_Code-0078D4?logo=visual%20studio%20code&logoColor=white)

Julia asked her students to create some coding challenges. Write a query to print the hacker_id, name, and the total number of challenges created by each student. Sort your results by the total number of challenges in descending order. If more than one student created the same number of challenges, then sort the result by hacker_id. If more than one student created the same number of challenges and the count is less than the maximum number of challenges created, then exclude those students from the result.

**Input Format**

The following tables contain contest data:

- **Hackers**: The hacker_id is the id of the hacker, and name is the name of the hacker.

    ![hackers](https://s3.amazonaws.com/hr-challenge-images/19506/1458521004-cb4c077dd3-ScreenShot2016-03-21at6.06.54AM.png)

- **Challenges**: The challenge_id is the id of the challenge, and hacker_id is the id of the student who created the challenge.

    ![challenges](https://s3.amazonaws.com/hr-challenge-images/19506/1458521079-549341d9ec-ScreenShot2016-03-21at6.07.03AM.png)

**Sample Input**

**Hackers Table**

![sample input1](https://s3.amazonaws.com/hr-challenge-images/19506/1458521384-34c6866dae-ScreenShot2016-03-21at6.07.15AM.png)

**Challenges Table**

![sample input2](https://s3.amazonaws.com/hr-challenge-images/19506/1458521410-befa8e1cd9-ScreenShot2016-03-21at6.07.25AM.png)

**Sample Output**
```
21283 Angela 6
88255 Patrick 5
96196 Lisa 1
```

**Explanation**

For Sample Case, we can get the following details:

![explanation](https://s3.amazonaws.com/hr-challenge-images/19506/1458521677-fd04c384c0-ScreenShot2016-03-21at6.07.38AM.png)

Students 5077 and 62743 both created 4 challenges, but the maximum number of challenges created is 6 so these students are excluded from the result.

### Solution
```sql
SELECT
    h.hacker_id,
    h.name,
    COUNT(c.challenge_id) AS c_count
FROM
    Hackers h
    JOIN Challenges c ON c.hacker_id = h.hacker_id
GROUP BY
    h.hacker_id,
    h.name
HAVING
    c_count = (
        SELECT
            COUNT(c2.challenge_id) AS c_max
        FROM
            challenges AS c2
        GROUP BY
            c2.hacker_id
        ORDER BY
            c_max DESC
        LIMIT
            1
    )
    OR c_count IN (
        SELECT
            DISTINCT c_compare AS c_unique
        FROM
            (
                SELECT
                    h2.hacker_id,
                    h2.name,
                    COUNT(challenge_id) AS c_compare
                FROM
                    Hackers h2
                    JOIN Challenges c ON c.hacker_id = h2.hacker_id
                GROUP BY
                    h2.hacker_id,
                    h2.name
            ) counts
        GROUP BY
            c_compare
        HAVING
            COUNT(c_compare) = 1
    )
ORDER BY
    c_count DESC,
    h.hacker_id;
```