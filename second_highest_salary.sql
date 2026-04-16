SELECT MAX(salary) AS SecondHighestSalary FROM employee
WHERE salary < (
    SELECT MAX(salary) FROM employee
);

-- Alternative solution using DENSE_RANK (Window function)
SELECT DISTINCT salary AS SecondHighestSalary FROM (
    SELECT salary, DENSE_RANK() OVER (ORDER BY salary DESC) as rank FROM employee
) t WHERE rank = 2;

SELECT MAX(salary) AS SecondHighestSalary FROM (
    SELECT salary, DENSE_RANK() OVER (ORDER BY salary DESC) as rank FROM employee
) t WHERE rank = 2;


SELECT salary AS SecondHighestSalary FROM employee 
ORDER BY salary DESC
LIMIT 1 OFFSET 1;