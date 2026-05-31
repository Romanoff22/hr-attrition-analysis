-- Q: Does tenure at the company influence attrition rate?
-- Finding: Attrition is highest among employees with 0–2 years tenure (29.82%) and drops steadily with experience — falling to 8.13% for those with 10+ years.
-- Employees who left also averaged fewer years at the company (5.13 vs 7.37), less time in their current role (2.90 vs 4.48), and slightly less time since last promotion (1.95 vs 2.23).
-- Takeaway: Early tenure is the highest-risk window. Onboarding experience, early career development and timely promotions are likely critical retention levers,
-- particularly in the first two years.

SELECT Attrition,
    ROUND(AVG(YearsAtCompany), 2) AS avg_years,
    ROUND(AVG(YearsInCurrentRole), 2) AS avg_years_in_role,
    ROUND(AVG(YearsSinceLastPromotion), 2) AS avg_since_promotion
FROM employees
GROUP BY Attrition;

SELECT 
    CASE 
        WHEN YearsAtCompany <= 2 THEN '0-2 years'
        WHEN YearsAtCompany BETWEEN 3 AND 5 THEN '3-5 years'
        WHEN YearsAtCompany BETWEEN 6 AND 10 THEN '6-10 years'
        ELSE '10+ years' 
    END AS tenure_band,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS left_company,
    ROUND(AVG(CASE WHEN Attrition = 'Yes' THEN 1.0 ELSE 0 END) * 100, 2) AS attrition_rate_by_tenure
FROM employees
GROUP BY tenure_band
ORDER BY attrition_rate_by_tenure DESC;
