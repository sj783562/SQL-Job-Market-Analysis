/*
Question: What are the most in-demand skills for Data Analysts?
- Join job postings to inner join table similar to query 2
- Identify the top 5 in-demand skills for Data Analysts
- Focus on all job postings
- Why? Retreives the top 5 skills with the highest demand in job market, 
    providing insights into most valuable skills for job seekers
*/

SELECT 
    sd.skills AS skill_name,
    COUNT(sjd.job_id) AS demand_count
FROM job_postings_fact jp

INNER JOIN skills_job_dim sjd ON jp.job_id = sjd.job_id
INNER JOIN skills_dim sd ON sjd.skill_id = sd.skill_id

WHERE jp.job_title_short = 'Data Analyst'
GROUP BY sd.skills
ORDER BY demand_count DESC  
LIMIT 5;
