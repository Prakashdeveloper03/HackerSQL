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