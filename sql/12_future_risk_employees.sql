-- Q: Which currently employed employees show the highest risk of future attrition?
-- Finding: 26 active employees meet all three high-risk criteria — no promotion in 3+ years, job satisfaction of 1 or 2, and working overtime.
-- 21 of the 26 are in R&D (dept size: 961), with 5 in Sales (dept size: 446).
-- High-income roles are not immune: five managers earning above $16,000 appear in the list.
-- The longest-stalled employees have gone 15 years without promotion while still working overtime.
-- Takeaway: This CTE surfaces a concrete, actionable watchlist for HR. The presence of senior, well-compensated employees in the high-risk group suggests that 
-- money alone does not offset stagnation and burnout — promotion pathways and workload relief matter independent of salary.

WITH risk_profile AS (
    SELECT 
        EmployeeNumber,
        Department,
        JobRole,
        MonthlyIncome,
        YearsSinceLastPromotion,
        JobSatisfaction,
        OverTime,
        Attrition,
        COUNT(*) OVER (PARTITION BY Department) AS dept_size
    FROM employees
)
SELECT * FROM risk_profile
WHERE Attrition = 'No'
    AND YearsSinceLastPromotion >= 3
    AND JobSatisfaction <= 2
    AND OverTime = 'Yes'
ORDER BY YearsSinceLastPromotion DESC;