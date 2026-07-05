-- #SQL queries on data base company_db

-- # 1. Select query
-- # select all the columns in the table employee
select * from employee;

-- # get all the details department
select * from department;

# select fname and salary in employee

select fname,salary
from employee ;



-- # select dname and dnumber in department table

select dname , dnumber 
from department;

-- # DISTINCT
-- #select Distinct i,e select unique values from column dno from employee
select distinct dno 
from employee ;

-- #get distinct relationship values from dependent table
select distinct relationship 
from dependent ;

-- # aliases
-- # Retrieve First name and last name of ALL employees using alias
-- -- 1. 
 select fname  Firstname , lname  Lastname

 from employee;
-- -- 2. 


-- # WHERE 
-- #using where clause retrive the information
--  #retrieve the details of all the female employees
    select  * 
    from employee
    where sex = 'f';
--  
--  # get fname and salary info of employees whose salary > 20000
select fname , salary 
from employee
where salary > 20000 ;

--  # get details of employees who has working hours greater than 20 -- works_on table
select * 
from works_on
where hours > 20;
--  
-- #retrieve the table with project location as houston
select * 
from dept_locations
where dlocation = 'houston' ;
-- #Retrieve details of all employees who draw a salary which is at least 30000 
select * 
from employee
where salary >= 30000;
--  
-- #AND
-- # get details of male employees who belongs to department 4
select * 
from employee
where sex = 'm' and dno = 4;

-- # get details from works on table whose project number is 10 and working hours is greater than 7 hours
   select * from works_on
   where pno = 10 and hours > 7 ;
   
--   
-- # or


--   
-- # get details of employees who belongs to dno 4 or 5
select * 
from employee
where dno = 4 or 5 ;
--   
--   
--   # not condition 
--   # not - exclude 
--   # != , <>
--   # get employees who dno not belongs to dno 4
     select * 
     from employee
     where not dno = 4 ;
--  
--  
--  # get details of male employees whose dno is not equal to 4
	select * 
	from  employee
    where sex ='m' and dno <> 4 ;
--  
--  # get fname, sex and dno of employees who belongs to dep no 4 also dep no 5
	select fname , sex , dno 
    from employee
    where dno in ( 4 , 5) ;


--  # between 
--  # get fname and salary of getting between 20k to 30k
select fname , salary 
from employee
where salary between 20000 And  30000 ;

--  # get details of employees whose pno = 10 and working hours between 10 to 30 hours - works_on
  select e.*
  from employee  e join works_on w on e.ssn = w.essn
  where w.pno = 10 and w.hours between 10 and 30;

--  #LIKE operator - wildcards
--  #Display employees whose name begins with  (Hint: use LIKE() function as in address LIKE 'j%'
	select * 
    from employee
    where fname like 'j%' ;
--  
--  #Display employees whose name ends with a "%a'
select * 
from employee 
 where fname like '%a' ;

--   # display the employee names where a in the second position "_a%"
select * 
from employee
where fname like "_a%";
--  
-- # industry used pattren
-- # get details of employees whose fname consists of 'me' in it
select * 
from employee
where fname like '%me%' ;

--  # IN and NOT in 
--  # dno in 4 and 5
--  
   select * 
   from employee 
   where dno in (4 ,5 );
--  
--  
--  # get details of those employees whose pno is 1,2,3,or 10 and thier working hours >10
    select e.* 
    from employee e join works_on w on e.ssn = w.essn
    where w.pno in (1 , 2 , 3, 10) 
    and w.hours > 10 ;
    


--  # is null is not null
--  # get details of employees whose super_ssn is null
	select super_ssn
    from employee
    where super_ssn is not null ;
--  
--  # get essn of those emp who has hours as null
--  select essn from works_on
--  where hours is null;
--  
select essn 
from works_on
where hours is null ; 
--  # Sorting - ORDER BY - Asc / Desc
	select * 
    from employee
    order by salary desc;
    
    select * 
    from employee
    order by salary Asc;
--  
--  # get details of female emp and order their salary in desc order
--  select * 
--  from employee
--  where sex = 'f'
--  order by salary desc
--  limit 2;
select * 
from employee
where sex ='f'
order by salary desc 
limit 2 ;
--  
--   #LIMIT - limit the number of rows to be displayed
-- select * from employee
-- limit 3;
select * from employee
limit 3 ;



--  # get employee table sorted base on salary in asc/desc
select  * 
from employee
order by salary asc;
--  # get details of female memebers sorted salary in desc
select * 
from employee
where sex = 'F'
order by salary desc ;
--  # interview
--  # get fname and salary info of top 3 salary holders
--  select fname , salary from employee
--  order by salary desc
--  limit 3;
select fname , salary 
from employee
order by salary desc 
limit 3 ;
--  # get fname of 3rd highest salary holder -- amazon
-- select fname, salary from employee
-- order by salary desc
-- limit 2,1;
select fname , salary 
from employee
order by salary desc
limit 2 , 1;
--  --  ASSgn
--  # get all the details of the project where project name is product x and product y also newbenefits
--  # get details of employees whose project name has ctx and cty as pattren
--  

-- #aggregation functions - min() and max()
-- # get min salary of all the emp
-- select min(salary) as minimum_salary , max(salary) as maximum_salary
-- from employee;
select  min(salary) 
from employee ;
-- # display min sal of all female emp 
-- select min(salary) as minimum_female_salary
-- from employee
-- where sex='m';
select min(salary) as minimum_female_salary
from employee 
where sex ='f';

-- # minimum and max working hours in the works_on table for project no 2
select min(hours) as minimum_hour , max(hours) as max_hours
from works_on 
where pno = 2 ;

-- # count the number of  employees  - count(*) - count number of rows
-- # count total number of employees in this comapny_db - 8
-- select count(*) as number_of_emp from employee;
-- select count(ssn) as number_of_emp from employee;
-- select count(super_ssn) as number_of_emp from employee;

-- # get total number of employees under dep no 5
-- select count(ssn) as number_emp 
-- from employee
-- where dno = 5 and sex = 'm';

-- # interview
-- # get count of total supervisors and unique supervisors
-- select count(super_ssn) as n, count(distinct super_ssn) as unq
-- from employee;
select count(super_ssn) as n , count(distinct super_ssn) as unq 
from employee ;
-- # SUM()
-- # sum the overall salary of male employees who belongs to dno 5
-- select sum(salary)/count(ssn) as average
-- from employee
-- where sex ='m';

select sum(salary) /count(ssn) as  average
from employee
where sex ='m' ;

-- # # Display the average project hours avg() -- 
-- select round(avg(salary)) as average_salary from employee;

select round(avg(salary)) as average_salary 
from employee ;
-- # assignments
-- # get the total number of projects in works on table out of which how many of them are unique
-- # get total working hours employee with id = essn 999887777 is investing on project 10
select count(pno) as total , count(distinct pno) as unq 
from works_on ;

select sum(hours) as working_hour
from works_on
where essn = 999887777  And pno = 10  ;

-- # GROUP BY 
-- # get department wise total salary 
-- select dno,sum(salary) as total , count(ssn) as number_of_emp
-- from employee
-- group by dno;
select dno , sum(salary) as total_salary , count(ssn) as number_of_emp
from employee
group by dno ;
-- # get gender wise average salary - for dno = 5
-- select sex,dno,avg(salary) as average
-- from employee
-- where dno = 5
-- group by sex;

select sex , dno,avg(salary) as avg_salary 
from employee
where dno = 5 
group by sex;
-- # get total working hours based on employee and keep top 3

select essn, sum(hours) as total_hours
from works_on
group by essn
order by total_hours desc 
limit 3;

-- # multiple group by conditions
-- # Display the average salary of employees (department-wise and gender-wise)
-- -- 	GROUP BY Dno, Sex

	select sex, dno,avg(salary) as average
    from employee
    group by sex, dno ;
-- -- HAVING CLAUSE APPLIED ON AGGREGATED VALUES
-- -- Display the Dno of those departments that has total 4 employees
select dno,sex, count(ssn) as number_of_num
from employee
where	sex ='m'
group by dno
having number_of_num >2 ;


-- # Display the sum of salary in each department that has Total salary greater than 60000
select dno , sum(salary) as total
from employee
group by dno
having total > 60000 ;

-- # assignment
-- # get total working hours per each employee and filter 
-- -- those employees whose total hours is greater than 25 hours
select e.ssn , e.fname , e.lname, sum(w.hours) as total_hours
from employee e join works_on w on e.ssn = w.essn
group by e.ssn , e.fname , e.lname
having sum(w.hours) >25
order by total_hours desc ;
-- # interview display the duplicate records
-- # display duplicate ids(super_ssn) in employee table based on id(super_ssn) 
select super_ssn, count(super_ssn) as occurance
from employee
group by super_ssn
having occurance > 1;


-- # CASE - if else operator
-- # create a new column with male as 1 and female as 0
-- # new column based on m = 1 f =0
select *,
case
when sex = 'm' then 1
else 0
end as gender_flag
from employee;

-- # create a new column with salary > 30k as good salary = 30 as average and remaining as less
select *,
case
when salary > 30000 then 'good'
when salary = 30000 then 'average'
else 'less'
end as salary_info,
case
when sex = 'm' then 1
else 0
end as gender_flag
from employee;

-- # create new column based on super_ssn if super_ssn is non null then super_ssn if it is null put zero
select * ,
case
when super_ssn is not null then super_ssn
else 0
end as new_super_ssn
from employee;




-- # ifnull() method for null imputation
-- # aws - redshift - same function is called with different name as nvl,coelsce
-- # using case to create new column to replace null value in super_ssn
select * ,
ifnull(super_ssn,'not assigned') as new_super_ssn
from employee;

-- # JOINS - joining multiple tables

-- # INNER
select * 
from employee
join dependent
on employee.ssn = dependent.essn;

-- # another best way of writing this syntax
select e.ssn,e.fname,d.bdate , d.relationship 
from employee as e
join dependent as d
on e.ssn = d.essn;


select *
from dependent as d
left join employee as e
on d.essn = e.ssn;

-- #Right join
select *
from dependent as d
right  join employee as e
on d.essn = e.ssn;



select e.fname,d.dependent_name,d.relationship
from employee as e
inner join dependent as d
on e.ssn = d.essn;

select *
from employee e
join dependent d
on e.ssn = d.essn
join department dep
on e.dno = dep.dnumber;


-- # LEFT
select *
from employee e
left join dependent d
on e.ssn = d.essn;

-- # RIGHT
select *
from employee e
right join dependent d
on e.ssn = d.essn;

-- # get fname of those employees who belongs to research department
select *
from employee as e
inner join department dep
on e.dno = dep.dnumber
where dname='research';

-- # get first name of employees whose working hours is greater than 35 hours
select e.fname, w.hours
from employee as e
join works_on as w
on e.ssn = w.essn
where hours>35;

-- # get department name wise maximum salary 
select d.dname, max(e.salary) as max_salary
from employee as e
join department as d
on e.dno = d.dnumber
group by d.dname;

-- # get fname,pno,hours for those who belongs to dep name is research
select e.fname, w.pno , w.hours, d.dname
from employee as e
join department as d
on e.dno = d.dnumber
join works_on as w
on e.ssn = w.essn
where d.dname ='research';









-- # assignment joins

-- # get name of employees and dependents also filter only male dependents
select e.fname , e.lname,d.dependent_name , d.relationship 
from employee e join dependent d on e.ssn = d.essn 
where d.sex = 'M'
order by 
    e.lname, e.fname, d.dependent_name;
    
    
-- # get project names which has total working hours between 10 to 20
select p.pname , w.hours 
from project p join works_on w on p.pnumber = w.pno 
where w.hours  between 10 and 20 ;
-- # get fname and dnumber of those employees who belongs to dept location as houston
select e.dno,e.fname ,l.dlocation 
from employee e join dept_locations  l on e.dno = l.dnumber 
where l.dlocation = "houston" ; 

-- # get fname and salary of those emp who have dependent and who do not have and 
-- -- create new column called flag based on dependent
SELECT 
    e.fname,e.salary,
    CASE 
        WHEN d.essn IS NOT NULL THEN 'Has Dependent'
        ELSE 'No Dependent'
    END AS dependent_flag
FROM 
    employee e
LEFT JOIN 
    dependent d ON e.ssn = d.essn
GROUP BY 
    e.ssn, e.fname, e.salary, d.essn;

-- # Display the ssn and fully concatenated name of all employees
 --   Use CONCAT function as in CONCAT(fname, ' ', minit, ' ', lname)
--    select ssn , concat(fname,'@' ,lname,' ', minit) as fullname
--    from employee;

-- # date functions
-- # year(), month() and day()
   select bdate , year(bdate) as year_of_bday, month(bdate) as month_of_bady, day(bdate)
   from employee;

-- # self join
select e.fname,b.salary from employee e,employee b
where e.ssn = b.ssn;

-- # cross join 
select fname , dname from employee as e
cross join department as b;

-- #UNION 
select * from employee 
where sex = 'f'
union
select * from employee
where sex = 'm';

--  # sub queries
--   
-- # Display the fname and salary of employees whose salary 
-- -- is more than the average salary of all the employees

select fname,salary from employee
where salary > 35125.000000;

select avg(salary) from employee;

-- -- Display the first name of employees working in the research  department - use subquery
select fname,salary from employee
where salary > (select avg(salary) from employee);

-- # get fname, dno of employees whose department is reserach - do not use joins
SELECT e.fname, e.dno
FROM employee e
WHERE e.dno IN (
    SELECT d.dnumber
    FROM department d
    WHERE d.dname = 'Research'
);
select dnumber from department where dname = 'research';

-- # interview - sub queries
-- # get fname,persons(ssn) who are in employee table are also in dependent  table imp
select fname,ssn from employee
where ssn  in (select distinct essn from dependent);

-- select distinct essn from dependent;

-- # assignment 
-- # get fname of those employees whose pno = 10, 1, 3  and their working hours is greater than 20 - subqueries
select fname,ssn  from employee
where ssn in (select essn from works_on where pno in (10,1,3) and hours>20);


-- -- window functions 

-- # ranking functions in sql
-- # rank

-- # The RANK() function is a window function that assigns a rank to each row within a partition of a result set.

-- # rank each employee based on salary
-- # Dense_rank() 

SELECT
	fname,salary,
	dense_rank() OVER ( 
		ORDER BY salary DESC
	) as rank_salary
FROM
	employee;
--     
--     # assignment  rank working hours of each employee in works on table
		select e.fname , w.hours, dense_rank() over( order by hours desc) as hours_fname
        from employee e join works_on w on e.ssn = w.essn  ;
--     
--     # partitioning rank by dno
--     
    SELECT
	fname,
	sex,
	salary,
    dno,
	dense_rank() OVER ( 
		PARTITION BY dno,sex
		ORDER BY salary DESC
        ) as salary_rank_bydno
FROM
	employee;
--     
--     
--      # assignment  rank working hours of each employee in works on table and partition by pno
		select essn as employee_ssn , hours as working_hour , pno as project_number , 
        dense_rank() over ( partition by pno  order by hours desc ) hours_pno
        from works_on 
        where hours is not null 
        order by pno , hours ;
		
--      # row number
--      
     SELECT
	fname,
	sex,
	salary,
    dense_rank () OVER ( 
		ORDER BY salary DESC
	) rank1,
    row_number () OVER ( 
		ORDER BY salary DESC
	) row_num 
FROM
	employee;
--     
--     

--   
--   # lead
  SELECT 
	fname,
    ssn,
	salary,
	LEAD(salary,1) OVER (
		ORDER BY salary desc
	)  as next_person_salary
FROM 
	employee;
    
    # lag
    SELECT 
	fname,
    ssn,
	salary,
	LAG(salary,1) OVER (
		ORDER BY salary desc
	) prev_person_salary
FROM 
	employee
    ;
--     

-- # views in SQL
select * from employee
where dno =5 and salary >30000;

-- CREATE VIEW report1 AS
-- select * from employee
-- where dno =5 and salary >30000;

select * from report1;

-- # replacing the present view
CREATE OR REPLACE VIEW report1 AS
SELECT *
FROM employee
WHERE sex = 'f';


-- # dropping the view
  drop view report1;

-- # STORED PROCEDURE
-- # IN ,OUT,INOUT
 call first_procedure();

-- # prarametric method of creating stored procedure
-- # IN 
-- CREATE DEFINER=`root`@`localhost` PROCEDURE `in_procedure`(IN dep_num int)
-- BEGIN
-- select * from employee
-- where dno = dep_num;
-- END

-- call in_procedure(1);

-- #OUT
-- -- CREATE DEFINER=`root`@`localhost` PROCEDURE `out_procedure`(out no_records int)
-- -- BEGIN
-- -- select count(ssn) into no_records
-- -- from employee;
-- -- END
-- call out_procedure(@no_records);
-- select @no_records as total_emp;

-- # INOUT
-- -- CREATE DEFINER=`root`@`localhost` PROCEDURE `inout_procedure`(IN d_num int, OUT n_records int)
-- -- BEGIN
-- -- select count(ssn) into n_records
-- -- from employee
-- -- where dno = d_num;
-- -- END

-- call inout_procedure(5,@no_records);
-- select @no_records as total_emp;

--  
--  


-- Retrieve the first name and last name of employees who work in 'Bellaire'.
select e.fname , e.lname 
from employee e join dept_locations df on e.dno = df.dnumber 
where df.dlocation = 'Bellaire' ;
-- Find the employee with the highest salary.
select * 
from employee
order by salary desc
limit 1;

-- Find the employee with the lowest salary.(sub quary)
select * 
from employee 
where salary = (select min(salary) from employee)
limit 1;
-- Retrieve all employees whose last name starts with 'S'.
select *
from employee 
where lname like "S%";
-- Retrieve all employees who were born after '1960-01-01'.
select * 
from employee 
where bdate > '1960-01-01';
-- List all departments.
SELECT * FROM company_db.department;
-- Find the department with department number 5.
select * 
from department 
where dnumber = '5';
-- List all projects and their locations.
select d.dname , l.dlocation
from department d join dept_locations l on d.dnumber = l.dnumber ;
-- List all employees who have 'M' as their sex.
select * 
from employee
where sex = "M" ;
-- List the SSNs and names of employees who work in the 'Houston' location.
select e.ssn , fname , lname, l.dlocation
from employee e join dept_locations l on e.dno  = l.dnumber
where l.dlocation ="Houston";
-- Find the department names of departments with a location 'Stafford'.
select *  from department d join dept_locations l on d.dnumber = l.dnumber 
where dlocation = "Stafford";

-- Retrieve all the employees who work for department number 4.
select * 
from employee e join department d on e.dno = d.dnumber 
where d.dnumber = '4';
-- Find all the projects that are managed by department number 5.
select *
from project
where dnum = '5' ;
-- Retrieve the names and salaries of employees who earn more than 30000.
select fname , salary
from employee
where salary > 30000 ;
-- Retrieve employee names along with their supervisors’ SSN.
SELECT 
    e.fname, e.lname, s.ssn AS supervisor_ssn
FROM 
    employee e
JOIN 
    employee s ON e.super_ssn = s.ssn;
-- List the names of employees who have a dependent named 'Alice'.
SELECT 
    e.fname, e.lname
FROM 
    employee e
JOIN 
    dependent d ON e.ssn = d.essn
WHERE 
    UPPER(d.dependent_name) = 'ALICE';
-- Retrieve employee names and their dependent’s names.
select e.fname , e.lname 
from employee e
join dependent d on e.ssn = d.essn ;
-- Find all the employees who are not working on project 1.
SELECT e.*
FROM employee e
WHERE e.ssn NOT IN (
    SELECT essn 
    FROM works_on 
    WHERE pno = 1
);