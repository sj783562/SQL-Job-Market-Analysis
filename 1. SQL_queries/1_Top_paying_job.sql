/*
Question: What are the top-paying job?
- Identify the top 10 highest paying Data Analyst roles that are available remotely
- Focuses on job postings with specialised salaries (remove nulls)  
- Why? Highlight the top-paying opportunities for Data Analysts, offering insights into employment opportunities
*/

SELECT 
    jb.job_id,
    jb.job_title,
    jb.job_location,
    jb.job_schedule_type,
    jb.salary_year_avg,
    jb.job_posted_date,
    c.name AS company_name

FROM job_postings_fact jb
LEFT JOIN company_dim c
ON jb.company_id = c.company_id

WHERE 
    jb.job_title_short = 'Data Analyst' AND
    jb.job_location = 'Anywhere' AND
    jb.salary_year_avg IS NOT NULL

ORDER BY jb.salary_year_avg DESC
LIMIT 10;
