-- Get the number of projects on which the manager of department 
-- which controls productY is working.
-- Output – Manager ssn, Number of projects

-- q3
select T.mgr_ssn, T.no_of_projects from EMPLOYEE as emp, 
(select works_on.Essn as mgr_ssn , count(*) as no_of_projects from WORKS_ON as works_on where works_on.Essn in (
(select Mgr_ssn as mgr_ssn from DEPARTMENT as department where Dnumber in 
(select Dnum as "dept_no" from PROJECT as prj where Pname = 'ProductY'))) 
group by works_on.Essn) as T 
where 
emp.Ssn = T.mgr_ssn;
