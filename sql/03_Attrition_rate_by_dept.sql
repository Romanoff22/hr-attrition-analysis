-- Q: Which department loses the most employees?
-- Finding: Sales has the highest attrition rate at 20.63%, followed closely by HR at 19.05%. Both exceed the company average of 16.12%.
-- R&D has the lowest at 13.84% despite being the largest department (961 employees out of 1470 employees).
-- Takeaway: Sales and HR are clear retention risks.

SELECT Department, 
    COUNT(*) AS total_employees,
    SUM(AttritionValue) AS left_company,
    ROUND(SUM(AttritionValue) / COUNT(*) * 100, 2) AS attrition_rate_by_dept
FROM employees
GROUP BY Department
ORDER BY attrition_rate_by_dept DESC;

-- Filtering only departments that exceed the company average of 16.12%.It dynamically compares each department against the overall average without hardcoding the value.

SELECT Department,
    ROUND(AVG(AttritionValue) * 100, 2) AS attrition_rate
FROM employees
GROUP BY Department
HAVING attrition_rate > (
    SELECT AVG(AttritionValue) * 100
    FROM employees
)
ORDER BY attrition_rate DESC;
