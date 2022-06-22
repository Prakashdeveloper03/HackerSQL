# Print Prime Numbers
![made-with-sql](https://img.shields.io/badge/Made%20with-SQL-007396.svg)
![terminal](https://img.shields.io/badge/Windows%20Terminal-4D4D4D?logo=windows%20terminal&logoColor=white)
![sublime text](https://img.shields.io/badge/sublime_text-%23575757.svg?logo=sublime-text&logoColor=important)
![vscode](https://img.shields.io/badge/Visual_Studio_Code-0078D4?logo=visual%20studio%20code&logoColor=white)

Write a query to print all prime numbers less than or equal to `1000`. Print your result on a single line, and use the ampersand (`&`) character as your separator (instead of a space).

For example, the output for all prime numbers <= `10`  would be:
```
2&3&5&7
```

### Solution
```sql
SELECT
	GROUP_CONCAT(NUMB SEPARATOR '&')
FROM
	(
		SELECT
			@num: = @num + 1 AS NUMB
		FROM
			information_schema.tables t1,
			information_schema.tables t2,
			(
				SELECT
					@num: = 1
			) tmp
	) temp
WHERE
	NUMB <= 1000
	AND NOT EXISTS(
		SELECT
			*
		FROM
			(
				SELECT
					@nu: = @nu + 1 AS NUMA
				FROM
					information_schema.tables t1,
					information_schema.tables t2,
					(
						SELECT
							@nu: = 1
					) tmp1
				LIMIT
					1000
			) ta
		WHERE
			FLOOR(NUMB / NUMA) = (NUMB / NUMA)
			AND NUMA < NUMB
			AND NUMA > 1
	)
```