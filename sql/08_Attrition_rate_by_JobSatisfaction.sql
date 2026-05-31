-- Q: Does job satisfaction level affect attrition rate?
-- Finding: Attrition decreases as satisfaction increases. Employees with the lowest satisfaction (1) have the highest attrition rate (22.84%), 
-- while those with the highest satisfaction (4) have the lowest (11.33%) — roughly half the rate.
-- Takeaway: Job satisfaction is inversely correlated with attrition. Targeted intervention for low-satisfaction employees (1 and 2) could meaningfully reduce turnover.

SELECT JobSatisfaction,
    COUNT(*) AS total_employees,
    SUM(AttritionValue) AS left_company,
    ROUND(SUM(AttritionValue) / COUNT(*) * 100, 2) AS attrition_rate
FROM employees
GROUP BY JobSatisfaction
ORDER BY JobSatisfaction;