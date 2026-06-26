/*
Question: What are the most optimal skills to learn 
- Identify skills in high demand and associated with high average salary
- Concentrates on remote positions with specified salaries 
- Why? Targets skills that offer job security (high demand) 
*/

WITH skills_demand AS (
    SELECT 
        sjd.skill_id,
        sd.skills,
        COUNT(sjd.job_id) AS demand_count
    FROM job_postings_fact jp

    INNER JOIN skills_job_dim sjd ON jp.job_id = sjd.job_id
    INNER JOIN skills_dim sd ON sjd.skill_id = sd.skill_id

    WHERE 
        jp.job_title_short = 'Data Analyst' AND
        jp.salary_year_avg IS NOT NULL AND
        jp.job_work_from_home = TRUE 
    GROUP BY sjd.skill_id, sd.skills
), average_salary AS (
    SELECT 
        sjd.skill_id,
        sd.skills,
        ROUND(AVG(jp.salary_year_avg),0) AS avg_salary
    FROM job_postings_fact jp

    INNER JOIN skills_job_dim sjd ON jp.job_id = sjd.job_id
    INNER JOIN skills_dim sd ON sjd.skill_id = sd.skill_id

    WHERE 
        jp.job_title_short = 'Data Analyst'
        AND jp.salary_year_avg IS NOT NULL
        AND jp.job_work_from_home = TRUE
        
    GROUP BY sjd.skill_id, sd.skills
)

SELECT 
    s.skill_id,
    s.skills,
    s.demand_count,
    a.avg_salary
FROM skills_demand s
INNER JOIN average_salary a ON s.skill_id = a.skill_id
ORDER BY demand_count DESC , avg_salary DESC
LIMIT 25; 