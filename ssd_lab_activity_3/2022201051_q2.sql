-- Get Full name, ssn, number of employees that he is supervising for 
-- all the direct
-- supervisors in ascending order.
-- Output – Full name, ssn, Dept. Id, Dept. Number of employees

select S.emp_name, S.emp_ssn, S.dept_id, S.dname, T.count_subordinates from 
(select count(*) as count_subordinates, mgr.ssn as mgr_ssn    
from EMPLOYEE as emp, EMPLOYEE as mgr where 
mgr.ssn = emp.Super_Ssn group by mgr_ssn) as T, 

(select emp.ssn as emp_ssn, concat(emp.fname, " ", emp.Minit, " " , emp.lname) as emp_name,  
dept.Dname as dname, emp.Dno as dept_id from EMPLOYEE as emp, DEPARTMENT as dept where 
emp.Dno = dept.Dnumber) S 

where T.mgr_ssn = S.emp_ssn order by T.count_subordinates;