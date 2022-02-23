# Task-1 Create a visualization that provides a breakdown between the male and female employees working in the company each year, starting from 1990. 
# STEP1 we will retrieve the required data from our data-bases employess-mod to solve our business problems 
# STEP-2 Then we will visualise male and female data for each year on Tableau
# First we have just retrieve the required data from the employees databases
USE employees_mod;
SELECT emp_no,from_date,to_date
FROM t_dept_emp;
# Now we will select the distict value to remove duplicates
SELECT DISTINCT  emp_no,from_date,to_date
FROM  t_dept_emp;
# As we want to show employees divison per year we will only extract year from the date columns, and we will save our years in a new columns which is calender years
 # the count function will give us a numerical-values of total-number of employees for gender according to group by columns , somply it will give us a aggreagate value.
   # Now we need to look at our relational-schema to move forward with our task. if we see t.employees table we have gender and hire date, and in our t-dept-emp we have from-date abd end-date of employees 
   # so we will perform a join here to retrieve the complete information of employees as both have the primary-keys as emp_no
   # we are organising the value the way we want to see our data.
   SELECT 
   YEAR(d.from_date) AS calendar_year,
   e.gender,
   COUNT(e.emp_no) AS num_of_employees 
   
   FROM t_employees e
       JOIN 
	t_dept_emp  d ON d.emp_no = e.emp_no
    
    GROUP BY calendar_year, e.gender
 
    HAVING calendar_year >= 1990;
   
   
   
 