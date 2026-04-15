SELECT * FROM employee e1
WHERE salary = (
    SELECT MAX(salary) FROM employee e2
    WHERE e1.dept = e2.dept
);

SELECT * FROM (
    SELECT *, DENSE_RANK() OVER (PARTITION BY dept ORDER BY salary DESC) as rank FROM employee
) AS ranked_employees WHERE rank = 1;