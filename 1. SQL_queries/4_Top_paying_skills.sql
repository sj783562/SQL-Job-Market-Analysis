/*
Question: What are top skills based on salary?
- Look at the average salary associated with each skill for Data analyst positions
- Focuses on roles with specialized salaries , regardless of location
- Why? It reveals how different skills impact salary levels for data analysts and
    help identify the most financially rewarding skill to acquire or improve
*/

SELECT 
    sd.skills AS skill_name,
    ROUND(AVG(jp.salary_year_avg),0) AS avg_salary
FROM job_postings_fact jp

INNER JOIN skills_job_dim sjd ON jp.job_id = sjd.job_id
INNER JOIN skills_dim sd ON sjd.skill_id = sd.skill_id

WHERE 
    jp.job_title_short = 'Data Analyst'
    AND jp.salary_year_avg IS NOT NULL
    
GROUP BY sd.skills
ORDER BY avg_salary DESC  
LIMIT 25;

/*
Here are three concise insights
AI & Data Engineering dominate: Skills like TensorFlow, PyTorch, Hugging Face, Kafka, Airflow, and Cassandra indicate that AI and data engineering expertise command the highest salaries.
Cloud & DevOps skills boost pay: Knowledge of Terraform, Ansible, Puppet, VMware, and GitLab shows that analysts with cloud and automation skills earn significantly more.
Hybrid skill sets earn the most: The highest-paying roles combine Data Analysis + Programming + AI + Cloud/Data Engineering, highlighting the growing demand for multi-skilled professionals.

[
  {
    "skill_name": "svn",
    "avg_salary": "400000"
  },
  {
    "skill_name": "solidity",
    "avg_salary": "179000"
  },
  {
    "skill_name": "couchbase",
    "avg_salary": "160515"
  },
  {
    "skill_name": "datarobot",
    "avg_salary": "155486"
  },
  {
    "skill_name": "golang",
    "avg_salary": "155000"
  },
  {
    "skill_name": "mxnet",
    "avg_salary": "149000"
  },
  {
    "skill_name": "dplyr",
    "avg_salary": "147633"
  },
  {
    "skill_name": "vmware",
    "avg_salary": "147500"
  },
  {
    "skill_name": "terraform",
    "avg_salary": "146734"
  },
  {
    "skill_name": "twilio",
    "avg_salary": "138500"
  },
  {
    "skill_name": "gitlab",
    "avg_salary": "134126"
  },
  {
    "skill_name": "kafka",
    "avg_salary": "129999"
  },
  {
    "skill_name": "puppet",
    "avg_salary": "129820"
  },
  {
    "skill_name": "keras",
    "avg_salary": "127013"
  },
  {
    "skill_name": "pytorch",
    "avg_salary": "125226"
  },
  {
    "skill_name": "perl",
    "avg_salary": "124686"
  },
  {
    "skill_name": "ansible",
    "avg_salary": "124370"
  },
  {
    "skill_name": "hugging face",
    "avg_salary": "123950"
  },
  {
    "skill_name": "tensorflow",
    "avg_salary": "120647"
  },
  {
    "skill_name": "cassandra",
    "avg_salary": "118407"
  },
  {
    "skill_name": "notion",
    "avg_salary": "118092"
  },
  {
    "skill_name": "atlassian",
    "avg_salary": "117966"
  },
  {
    "skill_name": "bitbucket",
    "avg_salary": "116712"
  },
  {
    "skill_name": "airflow",
    "avg_salary": "116387"
  },
  {
    "skill_name": "scala",
    "avg_salary": "115480"
  }
]
*/
