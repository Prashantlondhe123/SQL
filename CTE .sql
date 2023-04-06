#CTE : 
 /*A common table expression, or CTE, is a temporary named result set created from a simple SELECT statement that can
be used in a subsequent SELECT statement. Each SQL CTE is like a named query, whose result is stored in a virtual table
(a CTE) to be referenced later in the main quer */

WITH my_cte AS (
SELECT a,b,c
 FROM T1
)
SELECT a,c
FROM my_cte
WHERE ....  

Example : 
WITH daily_revenue AS (
SELECT branch, date,
       SUM(unit_price * quantity) AS daily_revenue
FROM   sales
WHERE EXTRACT(YEAR FROM date) = 2021
 GROUP BY 1,2
)

SELECT branch,
 MAX(daily_revenue) max_daily_revenue
FROM daily_revenue
GROUP BY 1
ORDER BY 2 DESC
