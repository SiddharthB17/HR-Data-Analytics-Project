SELECT * FROM hr_analytics.hrdata;

SELECT sum(employee_count) from hrdata;

SELECT sum(employee_count) from hrdata where education='High School';
SELECT sum(employee_count) from hrdata where education="Bachelor's Degree";
SELECT sum(employee_count) from hrdata where education="Associates Degree";
SELECT sum(employee_count) from hrdata where education="Master's Degree";
SELECT sum(employee_count) from hrdata where education="Doctoral Degree";


SELECT sum(employee_count) from hrdata where department="Sales";
SELECT sum(employee_count) from hrdata where department="R&D";
SELECT sum(employee_count) from hrdata where department="HR";

SELECT count(attrition) from hrdata where attrition='Yes';
SELECT count(attrition) from hrdata where attrition='Yes' and education='Doctoral Degree';
SELECT count(attrition) from hrdata where attrition='Yes' and department='R&D';
SELECT count(attrition) from hrdata where attrition='Yes' and education_field='Medical';

SELECT count(attrition) from hrdata where attrition='Yes' and department='R&D' 
and education_field='Medical' and education='High School';

select ((select count(attrition) from hrdata where attrition='Yes')/sum(employee_count))*100 from hrdata;

select ((select count(attrition) from hrdata where attrition='Yes' and department='Sales')/sum(employee_count))*100 from hrdata where department='Sales';

select sum(employee_count)-(select count(attrition) from hrdata where attrition='Yes' and gender='Male') from hrdata where gender='Male';

select round(avg(age),0) as Avg_age from hrdata;

select gender, count(attrition) from hrdata 
where attrition='Yes' and education='High school'
group by gender 
order by count(attrition) desc;

select department, count(attrition), 
round((count(attrition)/(select count(attrition) from hrdata where attrition='Yes' and gender='Female'))*100,2) 
from hrdata 
where attrition='Yes' and gender='Female'
group by department
order by count(attrition) desc;


select age, sum(employee_count) from hrdata
where department='R&D' and gender='Female'
group by age
order by age;

select education_field, count(attrition) from hrdata 
where attrition='Yes' and department='Sales'
group by education_field
order by count(attrition) desc;

select age_band,gender, count(attrition), 
round((count(attrition)/(select count(attrition) from hrdata where attrition='Yes'))*100,2)
from hrdata 
where attrition='Yes' 
group by age_band,gender
order by age_band,gender;


SELECT 
    job_role,
    SUM(CASE WHEN job_satisfaction = 1 THEN employee_count ELSE 0 END) AS one,
    SUM(CASE WHEN job_satisfaction = 2 THEN employee_count ELSE 0 END) AS two,
    SUM(CASE WHEN job_satisfaction = 3 THEN employee_count ELSE 0 END) AS three,
    SUM(CASE WHEN job_satisfaction = 4 THEN employee_count ELSE 0 END) AS four
FROM 
    hrdata
GROUP BY 
    job_role
ORDER BY 
    job_role;

select age_band, gender,sum(employee_count) from hrdata
group by age_band,gender
order by age_band,gender desc



