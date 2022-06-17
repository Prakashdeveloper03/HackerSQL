SELECT
    h.hacker_id,
    h.name,
    sum(sscore)
FROM
    Hackers h
    INNER JOIN (
        SELECT
            s.hacker_id,
            max(score) AS sscore
        FROM
            Submissions s
        GROUP BY
            s.hacker_id,
            s.challenge_id
    ) st ON h.hacker_id = st.hacker_id
GROUP BY
    h.hacker_id,
    h.name
HAVING
    sum(sscore) > 0
ORDER BY
    sum(sscore) DESC,
    h.hacker_id ASC;