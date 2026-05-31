-- Q: Do employees who leave earn less than those who stay?
-- Company average monthly salary: $6,502.93
-- Finding: On the surface, employees who left earned an average of $4,787.09/month compared to $6,832.74 for those who stayed (a gap of $2,045.65).
-- However, when broken down by job role, the pattern disappears.
-- In 4 out of 9 roles (Healthcare Representative, Manufacturing Director, Research Director, Sales Executive), employees who left actually earned MORE than those who stayed.
-- In the remaining roles, the salary gap was small and inconsistent.
-- Takeaway: The overall pay gap is a role composition artifact, not a compensation signal.
-- High-attrition roles (Laboratory Technician, Sales Representative, Research Scientist) happen to be low-paying — pulling down the average for leavers.
-- Once controlled for job role, salary is not a consistent predictor of attrition.

# finding the average salary to use as benchmark
SELECT ROUND(AVG(MonthlyIncome),2) AS company_avg_salary
FROM employees;

SELECT Attrition,
    ROUND(AVG(MonthlyIncome), 2) AS avg_income
FROM employees
GROUP BY Attrition;

SELECT 
    JobRole,
    Attrition,
    COUNT(*) AS employee_count,
    ROUND(AVG(MonthlyIncome), 2) AS avg_monthly_income
FROM employees
GROUP BY JobRole, Attrition
ORDER BY JobRole, Attrition;