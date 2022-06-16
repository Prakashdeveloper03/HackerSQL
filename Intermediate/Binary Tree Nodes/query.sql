SELECT
    N,
    IF(
        P IS NULL,
        "Root",
        IF(
            (
                SELECT
                    COUNT(*)
                FROM
                    BST
                WHERE
                    P = BinaryTree.N
            ) > 0,
            "Inner",
            "Leaf"
        )
    )
FROM
    BST AS BinaryTree
ORDER BY
    N;