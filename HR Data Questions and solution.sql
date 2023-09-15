-- QUESTIONS
SELECT * FROM hr.`human resources`;
-- 1. What is the gender breakdown of employees in the company?
select gender, count(*) AS count
from hr.`human resources`
where Age >=18 and termdate  IS  NOT NULL
Group by gender

-- 2. What is the race/ethnicity breakdown of employees in the company?
SELECT  race, count(*) AS count
from hr.`human resources`
where Age >=18 and termdate IS NOT NULL
Group by race
order by COUNT(*) DESC;

-- 3. What is the age distribution of employees in the company?
select  
  min(Age) AS youngest,
  max(Age) AS oldest
from hr.`human resources`
where Age >=18 and termdate IS NOT NULL;

SELECT
    CASE
        WHEN Age >= 18 AND Age <= 24 THEN '18-24'
        WHEN Age >= 25 AND Age <= 34 THEN '25-34'
        WHEN Age >= 35 AND Age <= 44 THEN '35-44'
        WHEN Age >= 45 AND Age <= 54 THEN '45-54'
        WHEN Age >= 55 AND Age <= 64 THEN '55-64'
        ELSE '65+'
    END AS Age_group, gender,
    COUNT(*) AS Count
FROM hr.`human resources`
WHERE Age >= 18 AND termdate IS NOT NULL
GROUP BY Age_group,gender
ORDER BY Age_group,gender;

-- 4. How many employees work at headquarters versus remote locations?
Select location, count(*) AS count
from hr.`human resources`
where Age >=18 and termdate IS NOT NULL
GROUP BY  location;


-- 5. What is the average length of employment for employees who have been terminated?
SELECT 
    ROUND(AVG(datediff(termdate, hire_date ))/365, 0) AS ave_length_employment
FROM  hr.`human resources`
WHERE termdate <=curdate() AND termdate IS NOT NULL AND Age >=18;

-- 6. How does the gender distribution vary across departments and job titles?
select gender , department, COUNT(*) AS count
from  hr.`human resources`
where Age >=18 and termdate IS NOT NULL
group by gender, department
order by department;

-- 7. What is the distribution of job titles across the company?

select jobtitle, count(*) AS count
from hr.`human resources`
where Age >=18 and termdate IS NOT NULL
group by jobtitle
order by jobtitle DESC;


   
-- 8. What is the distribution of employees across locations by city and state?

select location_state,COUNT(*) AS count
from hr.`human resources`
where Age >=18 and termdate IS NOT NULL
GROUP BY location_state
order by count DESC;

       
-- 9. What is the tenure distribution for each department?
select department , round(avg(datediff(termdate,hire_date)/365),0) AS avg_tenure
from hr.`human resources`
where termdate <=curdate() AND termdate IS NOT NULL AND Age >=18
GROUP BY department;