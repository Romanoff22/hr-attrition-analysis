-- DATA PREPARATION
-- Added AttritionValue as a binary encoding of the Attrition column (Yes=1, No=0) which enables numerical aggregation for attrition rate calculations

SELECT *
FROM employees; #checking

ALTER TABLE employees RENAME COLUMN ï»¿Age TO Age; # problem in encoding ig, so fixed that

ALTER TABLE employees ADD COLUMN AttritionValue INT;

UPDATE employees
SET AttritionValue = CASE
    WHEN Attrition = 'Yes' THEN 1
    WHEN Attrition = 'No' THEN 0
END
WHERE AttritionValue IS NULL;

DESCRIBE employees;