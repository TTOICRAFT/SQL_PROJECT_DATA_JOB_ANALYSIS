/*
What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions
- Focuses on roles with specified salary, regardless of location
- why? It reveals how different skills impact salary levels for data analysts, and
    helps identify the most financially rewarding skills to acquire or improve
*/

SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN  skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN  skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst' AND
        salary_year_avg IS NOT NULL AND
        job_work_from_home = True
GROUP BY 
    skills
ORDER BY 
    avg_salary DESC
LIMIT 25;


/*
    Based on the Analysis of the top-paying skills for data analysts, 
     several key insights emerge:

  High-paying roles are heavily engineering-focused, not just analysis-focused.
  Skills like PySpark ($208k), Databricks, Airflow, Kubernetes, Scala, and GCP 
  show that top-paying “data analyst” jobs overlap strongly with data engineering 
  and big data infrastructure. The trend: analysts who can work with distributed 
  systems and cloud platforms earn significantly more than dashboard-only analysts.

  Machine learning & advanced analytics tools boost salary ceilings. Tools like 
  DataRobot, scikit-learn, Pandas, NumPy, Jupyter, and Watson suggest that higher 
  pay is linked to analysts who can move beyond reporting into predictive modeling 
  and automation. The market rewards analysts who can build models, not just interpret 
  results.

  DevOps & collaboration tools are surprisingly high value. Bitbucket, GitLab, Jenkins, 
  Atlassian, Linux, and Kubernetes appearing in the top salaries shows that modern 
  analytics teams operate in production environments. The trend: analysts who understand
  version control, CI/CD, and deployment workflows are positioned closer to technical 
  leadership — and that proximity to engineering drives higher compensation.

*/