# super ssn is the manager
# Get Full name and ssn of managers of the departments in which at least one of the
# employees work less than 40 hours.
# Output – Full name, ssn, Dept. Id, Dept. Name

select  
		subordinate.mgr_name, subordinate.mgr_ssn, subordinate.mgr_dept, subordinate.mgr_dname   
from 

(select concat(mgr.fname, " ", mgr.Minit, " " , mgr.lname) as "mgr_name", 
 emp.ssn as "emp_ssn", mgr.ssn as "mgr_ssn", dept.Dnumber as "mgr_dept", dept.Dname as "mgr_dname"   
from EMPLOYEE as emp, EMPLOYEE as mgr, DEPARTMENT as dept where 
mgr.ssn = emp.Super_Ssn and dept.Dnumber = mgr.Dno) as subordinate, 

(select emp.ssn as "emp_ssn", COALESCE(sum(works_on.hours), 0) as "working_hours" 
from WORKS_ON as works_on, EMPLOYEE as emp where 
works_on.Essn = emp.Ssn group by emp.ssn) as worktime 

where subordinate.emp_ssn = worktime.emp_ssn and worktime.working_hours < 40






