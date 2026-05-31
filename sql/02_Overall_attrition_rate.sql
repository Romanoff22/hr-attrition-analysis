-- finding out the overall attrition rate so that i can compare all other analyses against this benchmark
-- out of 1470 employees, 16.12% churned

SELECT 
    COUNT(*) AS total_employees,
    SUM(AttritionValue) AS attrited,
    ROUND(AVG(AttritionValue) * 100, 2) AS attrition_rate_overall
FROM employees;