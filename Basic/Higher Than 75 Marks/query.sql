SELECT
    Name
FROM
    Students
WHERE
    Marks > 75
ORDER BY
    RIGHT(Name, 3) ASC,
    Id ASC;