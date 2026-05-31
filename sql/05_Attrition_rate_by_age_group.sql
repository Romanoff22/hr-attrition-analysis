-- Q: Are younger employees leaving more than older ones?
-- Employees range from 18 to 60 years old, with an average age of 36.92.
-- Finding: Employees under 30 have the highest attrition rate at 27.91%, nearly double the company average of 16.12%. 
-- Attrition drops significantly with age. The 30-40 group sits at 13.84%, and the 41-50 group at 10.56%.
-- Takeaway: Early career employees are the most likely to leave. This suggests the company may struggle with onboarding, career growth opportunities or compensation for younger employees. 

SELECT 
    CASE 
        WHEN Age < 30 THEN 'Under 30'
        WHEN Age BETWEEN 30 AND 40 THEN '30-40'
        WHEN Age BETWEEN 41 AND 50 THEN '41-50'
        ELSE 'Over 50'
    END AS age_group,
    COUNT(*) AS total_employees,
    SUM(AttritionValue) AS left_company,
    ROUND(SUM(AttritionValue) / COUNT(*) * 100, 2) AS attrition_rate_by_age
FROM employees
GROUP BY age_group
ORDER BY attrition_rate_by_age DESC;