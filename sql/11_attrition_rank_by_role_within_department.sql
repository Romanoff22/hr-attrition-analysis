-- Q: Which job roles have the highest attrition rate within each department?
-- Finding: Sales Representatives have the highest attrition rate of any role across all departments (39.76%), ranking 1st in Sales. 
-- In R&D, Laboratory Technicians lead at 23.94%. HR's only non-managerial role (Human Resources) ranks 1st at 23.08%.
-- Manager roles consistently rank last in every department — 0% in HR, 5.56% in R&D, 5.41% in Sales — suggesting seniority is a strong retention factor.    
-- Takeaway: Attrition risk is heavily concentrated in entry-to-mid level individual contributor roles. 
-- Retention efforts should be prioritised for Sales Representatives, Laboratory Technicians and HR staff, as these roles drive the most turnover volume relative to their headcount.

SELECT
    Department,
    JobRole,
    COUNT(*) AS total_employees,
    SUM(AttritionValue) AS left_company,
    ROUND(AVG(AttritionValue) * 100, 2) AS attrition_rate,
    RANK() OVER (PARTITION BY Department ORDER BY AVG(AttritionValue) DESC) AS attrition_rank
FROM employees
GROUP BY Department, JobRole
ORDER BY Department, attrition_rank;