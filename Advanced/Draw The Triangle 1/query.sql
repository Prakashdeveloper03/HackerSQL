SET @row := 21;
SELECT repeat('* ', @row := @row - 1)
FROM information_schema.tables;