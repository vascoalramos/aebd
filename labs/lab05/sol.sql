-- 1. list all jobs with min_salary > 10000
select *
from jobs
where min_salary > 10000;

-- 2.
select first_name||' '||last_name as name, hire_date
from employees
where extract(year from hire_date) between 2001 and 2005
order by hire_date;

-- 3
select first_name||' '||last_name as name, hire_date
from employees
    inner join (select job_id, job_title from jobs) temp_jobs on employees.job_id = temp_jobs.job_id
where job_title = 'Programmer' or job_title = 'Sales Representative';

-- 4
select first_name, last_name, hire_date
from employees
where hire_date > TO_DATE('01-01-2003', 'DD-MM-YYYY');

-- 5.
select *
from employees
where employee_id between 140 and 170;

-- 6
select last_name, commission_pct, hire_date
from employees
where salary < 12000;

-- 7
select job_title, (max_salary - min_salary) as salary_range
from jobs
where (max_salary - min_salary) between 10000 and 20000;

-- 8
select first_name, salary, round(salary/1000) as salary_mil
from employees;

-- 9
select *
from jobs
order by job_title desc;

-- 10
select *
from employees
where last_name like 'G%' and first_name like '%d';

-- 11
select *
from employees
where extract(month from hire_date) = 6;

-- 12
select * 
from employees
where commission_pct is null and salary between 2000 and 5000 and department_id = 30;

-- 13
select first_name||' '||last_name as name
from employees
where extract(year from hire_date) = 2002;

-- 14
select regexp_substr(job_title, '[A-z]*') as job_title_1st_word
from jobs;

-- 15
select first_name, last_name
from employees
where INSTR(last_name, 'b', 4) > 0;

-- 16
select *
from employees
where extract(year from hire_date) = 2007;

-- 17
select trunc(sysdate) - to_date('01-01-2011', 'dd-mm-yyyy') from dual;

-- 18
select h_month, count(*) as nr_employees
from (select employee_id, extract(year from hire_date) as h_year, extract(month from hire_date) as h_month from employees) emp_temp
where h_year = 2007
group by h_month;

-- 19