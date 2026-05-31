-- Q: Which job roles are hardest to retain?
-- Finding: Sales Representatives have an alarming attrition rate of 39.76% — more than double the company average of 16.12%. 
-- Laboratory Technicians (23.94%) and HR roles (23.08%) also exceed the average significantly.
-- Leadership roles show the strongest retention. Managers (4.90%) and Research Directors (2.50%) have the lowest attrition.
-- Takeaway: Entry to mid-level roles, especially in Sales, are the highest flight risk.

SELECT JobRole,
    COUNT(*) AS total_employees,
    SUM(AttritionValue) AS left_company,
    ROUND(SUM(AttritionValue) / COUNT(*) * 100, 2) AS attrition_rate_by_role
FROM employees
GROUP BY JobRole
ORDER BY attrition_rate_by_role DESC;