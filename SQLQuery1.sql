---Question 1: What are the total number of countries involved in deforestation? 


SELECT COUNT(DISTINCT country_code) AS total_countries_involved
FROM Forest_Area
WHERE forest_area_sqkm > 0;


---Question 2: Show the income groups of countries having total area ranging from 75,000 to 150,000 square meter?


SELECT 
    r.income_group,
    COUNT(*) AS country_count
FROM 
    Land_Area l
JOIN 
    Region r ON l.country_code = r.country_code
WHERE 
    l.total_area_sq_mi BETWEEN 75000 AND 150000
GROUP BY 
    r.income_group;

---Question 3: Calculate average area in square miles for countries in the 'upper middle income region'. Compare the result with the rest of the income categories.

SELECT 
    CASE 
        WHEN r.income_group = 'Upper middle income' THEN 'Upper middle income'
        ELSE 'Other income categories'
    END AS income_group,
    AVG(l.total_area_sq_mi) AS avg_area_sq_mi
FROM 
    Land_Area l
JOIN 
    Region r ON l.country_code = r.country_code
GROUP BY 
    CASE 
        WHEN r.income_group = 'Upper middle income' THEN 'Upper middle income'
        ELSE 'Other income categories'
    END;

---Question 4: Determine the total forest area in square km for countries in the 'high income' group. Compare result with the rest of the income categories.

SELECT 
    CASE 
        WHEN r.income_group = 'High income' THEN 'High income'
        ELSE 'Other income categories'
    END AS income_group,
    SUM(f.forest_area_sqkm) AS total_forest_area_sqkm
FROM 
    Forest_Area f
JOIN 
    Region r ON f.country_code = r.country_code
GROUP BY 
    CASE 
        WHEN r.income_group = 'High income' THEN 'High income'
        ELSE 'Other income categories'
    END;

---Question 5: Show countries from each region(continent) having the highest total forest areas. 

WITH RankedCountries AS (
    SELECT 
        f.country_code,
        r.region,
        f.country_name,
        f.forest_area_sqkm,
        ROW_NUMBER() OVER (PARTITION BY r.region ORDER BY f.forest_area_sqkm DESC) AS rank
    FROM 
        Forest_Area f
    JOIN 
        Region r ON f.country_code = r.country_code
)
SELECT 
    region,
    country_name,
    forest_area_sqkm
FROM 
    RankedCountries
WHERE 
    rank = 1;



