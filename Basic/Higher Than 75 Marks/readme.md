# Higher Than 75 Marks
![made-with-sql](https://img.shields.io/badge/Made%20with-SQL-007396.svg)
![terminal](https://img.shields.io/badge/Windows%20Terminal-4D4D4D?logo=windows%20terminal&logoColor=white)
![sublime text](https://img.shields.io/badge/sublime_text-%23575757.svg?logo=sublime-text&logoColor=important)
![vscode](https://img.shields.io/badge/Visual_Studio_Code-0078D4?logo=visual%20studio%20code&logoColor=white)

Query the `Name` of any student in `STUDENTS` who scored higher than  Marks. Order your output by the *last three characters of each name*. If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.

**Input Format**

The STUDENTS table is described as follows:

![table image](https://s3.amazonaws.com/hr-challenge-images/12896/1443815243-94b941f556-1.png)

The Name column only contains uppercase (A-Z) and lowercase (a-z) letters.

**Sample Input**

![sample input](https://s3.amazonaws.com/hr-challenge-images/12896/1443815209-cf4b260993-2.png)

**Sample Output**
```
Ashley
Julia
Belvet
```

**Explanation**

Only Ashley, Julia, and Belvet have Marks > 75. If you look at the last three characters of each of their names, there are no duplicates and 'ley' < 'lia' < 'vet'.

### Solution
```sql
SELECT Name FROM Students
WHERE Marks > 75
ORDER BY RIGHT(Name, 3) ASC, Id ASC;
```