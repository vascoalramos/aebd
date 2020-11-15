-- 1.
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
    inner join (select job_id, job_title
                from jobs
                where job_title = 'Programmer' or job_title = 'Sales Representative') temp_jobs
            on employees.job_id = temp_jobs.job_id;

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
where first_name like '%d' and last_name like 'G%';

-- 11
select *
from employees
where extract(month from hire_date) = 6;

-- 12
select * 
from employees
where commission_pct is null and salary between 2000 and 5000 and department_id = 30;

-- 13 TODO: check this (year)
select first_name||' '||last_name as name
from employees
where extract(year from hire_date) = 1998;

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
from (select employee_id, extract(year from hire_date) as h_year, extract(month from hire_date) as h_month
        from employees
        where extract(year from hire_date) = 2007) emp_temp
group by h_month;

-- 19
select country_name, count(*)
from countries
    inner join (select country_id, city from locations) cities on countries.country_id = cities.country_id
group by country_name;

-- 20
select department_name, avg(salary)
from employees
    inner join (select department_id, department_name from departments) depts on employees.department_id = depts.department_id
where commission_pct is not null
group by department_name;

-- 21
insert into employees values (
    207,
    'Vasco',
    'Ramos',
    'VR',
    '123.456.789',
    TO_DATE('15-11-2020', 'dd-MM-yyyy'),
    'IT_PROG',
    5000,
    NULL,
    103,
    60
);

-- 22
update employees
set salary = 8000
where employee_id = 115 and salary < 6000;

-- 23
select department_name, count(employee_id) as nr_employees
from employees
    inner join departments on employees.department_id = departments.department_id
group by department_name;

-- 24
select job_title, employee_id, (end_date - start_date) as duration_days
from (select * from job_history where department_id = 20) j_hist_dept_20
    inner join jobs on j_hist_dept_20.job_id = jobs.job_id;
    
-- 25 TODO: check this (year range)
select job_title, department_name, last_name, hire_date
from (select last_name, job_id, department_id, hire_date
        from employees
        where extract(year from hire_date) between 2001 and 2005) emps_between
    inner join jobs on emps_between.job_id = jobs.job_id
    inner join departments on emps_between.department_id = departments.department_id;
    
-- 26
select job_title, avg(salary)
from (select job_id, salary from employees) emps
    inner join jobs on emps.job_id = jobs.job_id
group by job_title;

-- 27
select job_title, (max_salary - salary) as salary_diff
from (select job_id, salary from employees) emps
    inner join jobs on emps.job_id = jobs.job_id;
    
-- 28 TODO: nao percebi...
select *
from employees
    inner join job_history on employees.employee_id = job_history.employee_id
where salary > 15000;

-- 29
select employees.first_name||' '||employees.last_name as name
from employees
    inner join employees managers on employees.manager_id = managers.employee_id
where employees.hire_date < managers.hire_date;

-- 30
select employees.first_name||' '||employees.last_name as emp_name, country_name
from employees
    inner join departments on employees.department_id = departments.department_id
    inner join locations on departments.location_id = locations.location_id
    inner join countries on locations.country_id = countries.country_id;
    
-- 31 TODO: check this
select extract(month from hire_date) as month, count(employee_id)
from (select location_id from locations where city = 'Seattle') seattle
    inner join departments on seattle.location_id = departments.location_id
    inner join employees on departments.department_id = employees.department_id
group by extract(month from hire_date)
having count(employee_id) > 5;

-- 32
select country_name, city, count(departments.department_id) as nr_depts
from (select department_id
        from employees
        group by department_id
        having count(employee_id) > 5) depts_bg_5_emps
    inner join departments on depts_bg_5_emps.department_id = departments.department_id
    inner join locations on departments.location_id = locations.location_id
    inner join countries on locations.country_id = countries.country_id
group by country_name, city;

-- 33
select managers.first_name
from employees
    inner join employees managers on employees.manager_id = managers.employee_id
group by managers.employee_id, managers.first_name
having count(employees.employee_id) > 5;

-- 34
select city
from (select department_id from employees where employee_id = 105) dept_emp_105
    inner join departments on dept_emp_105.department_id = departments.department_id
    inner join locations on departments.location_id = locations.location_id;


