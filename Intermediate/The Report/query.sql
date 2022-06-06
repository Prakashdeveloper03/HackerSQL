SELECT CASE
    WHEN gr.grade > 7 THEN st.name
    ELSE NULL
    END AS names,
    gr.grade,
    st.marks
FROM students st
INNER JOIN grades gr
ON st.marks BETWEEN gr.min_mark AND gr.max_mark
ORDER BY gr.grade DESC, names ASC, st.marks ASC;