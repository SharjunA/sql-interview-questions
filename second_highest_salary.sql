SELECT MAX(salary) AS SecondHighestSalary FROM employee
WHERE salary < (
    SELECT MAX(salary) FROM employee
);

-- Alternative solution using DENSE_RANK (Window function)
SELECT salary AS SecondHighestSalary FROM (
    SELECT salary, DENSE_RANK() OVER (ORDER BY salary DESC) as rank FROM employee
) WHERE rank = 2;