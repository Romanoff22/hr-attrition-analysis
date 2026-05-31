-- Q: Does working overtime increase the likelihood of attrition?
-- Finding: Employees who work overtime have a significantly higher attrition rate (30.53%) compared to those who do not (10.44%) — nearly 3x higher.
-- Takeaway: Overtime is a strong attrition signal. 
-- Employees burning out from extended hours are at substantially greater risk of leaving, making workload management a key lever for retention.

SELECT OverTime,
    COUNT(*) AS total_employees,
    SUM(AttritionValue) AS left_company,
    ROUND(SUM(AttritionValue) / COUNT(*) * 100, 2) AS attrition_rate_by_overtime
FROM employees
GROUP BY OverTime
ORDER BY attrition_rate_by_overtime DESC;