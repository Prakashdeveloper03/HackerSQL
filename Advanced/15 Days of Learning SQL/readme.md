# 15 Days of learning SQL
![made-with-sql](https://img.shields.io/badge/Made%20with-SQL-007396.svg)
![terminal](https://img.shields.io/badge/Windows%20Terminal-4D4D4D?logo=windows%20terminal&logoColor=white)
![sublime text](https://img.shields.io/badge/sublime_text-%23575757.svg?logo=sublime-text&logoColor=important)
![vscode](https://img.shields.io/badge/Visual_Studio_Code-0078D4?logo=visual%20studio%20code&logoColor=white)

Julia conducted a `15` days of learning SQL contest. The start date of the contest was March 01, 2016 and the end date was March 15, 2016.

Write a query to print total number of unique hackers who made at least  submission each day (starting on the first day of the contest), and find the hacker_id and name of the hacker who made maximum number of `1` submissions each day. If more than one such hacker has a maximum number of submissions, print the lowest hacker_id. The query should print this information for each day of the contest, sorted by the date.

**Input Format**

The following tables hold contest data:

**Hackers:**

The hacker_id is the id of the hacker, and name is the name of the hacker.

![hackers_table](https://s3.amazonaws.com/hr-challenge-images/19597/1458511164-12adec3b8b-ScreenShot2016-03-21at3.26.47AM.png)

**Submissions:**

The submission_date is the date of the submission, submission_id is the id of the submission, hacker_id is the id of the hacker who made the submission, and score is the score of the submission.

![submissions_table](https://s3.amazonaws.com/hr-challenge-images/19597/1458511251-0b534030b9-ScreenShot2016-03-21at3.26.56AM.png)

**Sample Input**

For the following sample input, assume that the end date of the contest was March 06, 2016.

![sample_input 1](https://s3.amazonaws.com/hr-challenge-images/19597/1458511957-814a2c7bf2-ScreenShot2016-03-21at3.27.06AM.png)

![sample_input 2](https://s3.amazonaws.com/hr-challenge-images/19597/1458512015-ff6a708164-ScreenShot2016-03-21at3.27.21AM.png)

**Sample Output**
```
2016-03-01 4 20703 Angela
2016-03-02 2 79722 Michael
2016-03-03 2 20703 Angela
2016-03-04 2 20703 Angela
2016-03-05 1 36396 Frank
2016-03-06 1 20703 Angela
```

### Solution
```sql
SELECT
    submission_date,
    (
        SELECT
            COUNT(DISTINCT hacker_id)
        FROM
            submissions S2
        WHERE
            S2.submission_date = S1.submission_date
            AND (
                SELECT
                    COUNT(DISTINCT S3.submission_date)
                FROM
                    SUBMISSIONS S3
                WHERE
                    S3.hacker_id = S2.hacker_id
                    AND S3.submission_date < S1.submission_date
            ) = DATEDIFF(S1.submission_date, '2016-03-01')
    ),
    (
        SELECT
            hacker_id
        FROM
            submissions S2
        WHERE
            S2.submission_date = S1.submission_date
        GROUP BY
            hacker_id
        ORDER BY
            COUNT(submission_id) DESC,
            hacker_id
        LIMIT
            1
    ) AS TMP,
    (
        SELECT
            NAME
        FROM
            hackers
        WHERE
            hacker_id = TMP
    )
FROM
    (
        SELECT
            DISTINCT submission_date
        FROM
            submissions
    ) S1
GROUP BY
    submission_date;
```