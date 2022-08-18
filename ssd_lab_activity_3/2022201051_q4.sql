-- Number of locations for the departments whose managers have at 
-- least 2 female
-- dependents.
-- Output – Dept. Id, Dept. Name, Number of locations

select distinct(count(*)) from  
(select mgr.ssn as mgr_ssn, dept.Dnumber as mgr_dept, dept.Dname as mgr_dname, deploc.Dlocation   
from EMPLOYEE as emp, EMPLOYEE as mgr, DEPARTMENT as dept, DEPT_LOCATIONS as deploc
where 
mgr.ssn = emp.Super_Ssn and dept.Dnumber = mgr.Dno and deploc.Dnumber = dept.Dnumber) as T, 

(select essn from DEPENDENT where sex = 'F' group by essn having count(essn) >= 2) as S 

where T.mgr_ssn = S.essn group by T.DLocation;



