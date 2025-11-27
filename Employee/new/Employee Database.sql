create database Employee_bm205;
use employee_bf285;
CREATE TABLE  Employee (emp_no decimal (4,0) PRIMARY KEY, ename varchar (30) default NULL, mgr_no decimal(4,0) default NULL, hiredate date default NULL, sal decimal(7,2) default NULL,dept_no decimal (2,0) references dept(deptno) on delete cascade on update cascade);
desc Employee;
create table dept( dept_no decimal (2,0) primary key, d_name varchar (20) default NULL, d_loc varchar (20) default NULL);
desc dept;
create table incentives( emp_no decimal (4,0), incentive_date date , incentive_amount decimal (10,2), primary key(emp_no, incentive_date));
desc incentives;
create table project (p_no decimal (4,0) primary key, p_name varchar (20) not null, p_loc varchar (30));
desc project;
create table assigned_to (emp_no decimal(4,0) references Employee(emp_no) on delete cascade on update cascade, p_no int references project(p_no) on delete cascade on update cascade, job_role varchar (30), primary key(emp_no, p_no));
show tables;

insert into dept VALUES(10,'Accounting', 'Mumbai'); insert into dept VALUES(20,'Research','Bengaluru'); insert into dept VALUES(30,'Sales','Delhi'); insert into dept VALUES(40,'Operations','Chennai');
Select * from dept;

ALTER TABLE Employee MODIFY COLUMN sal DECIMAL(9,2);

insert into Employee VALUES(7369,'Adarsh',7902,'2012-12-17','80000.00','20'); insert into Employee VALUES(7499,'Shruthi',7698,'2013-02-20','16000.00','30'); insert into Employee VALUES(7521,'Anvitha',7698,'2015-02-22','12500.00','30');  insert into Employee VALUES(7654,'Ramesh',7698,'2014-09-28','12500.00','30');insert into Employee VALUES(7782,'Clark',7839,'2017-06-09','24500.00','10');
insert into Employee VALUES(7788,'Scott',7566,'2010-12-09','30000.00','20'); insert into Employee VALUES(7839,'King',NULL,'2009-11-17','500000.00','10');  insert into Employee VALUES(7876,'Adams',7788,'2013-01-12','11000.00','20'); insert into Employee VALUES(7902,'Ford',7566,'2010-12-03','30000.00','20');
select * from emp;

INSERT INTO incentives VALUES(7499,'2019-02-01',5000.00); INSERT INTO incentives VALUES(7521,'2019-03-01',2500.00); INSERT INTO incentives VALUES(7566,'2022-02-01',5070.00); INSERT INTO incentives VALUES(7654,'2020-02-01',2000.00); INSERT INTO incentives VALUES(7654,'2022-04-01',879.00); INSERT INTO incentives VALUES(7521,'2019-02-01',8000.00);
INSERT INTO incentives VALUES(7698,'2019-03-01',500.00); INSERT INTO incentives VALUES(7698,'2020-03-01',9000.00); INSERT INTO incentives VALUES(7698,'2022-04-01',4500.00);

select * from incentives;

INSERT INTO project VALUES(101,'AI Project','BENGALURU'); INSERT INTO project VALUES(102,'IOT','HYDERABAD');  INSERT INTO project VALUES(104,'DATA SCIENCE','MYSURU'); INSERT INTO project VALUES(105,'AUTONOMUS SYSTEMS','PUNE');

select * from project;

INSERT INTO assigned_to VALUES(7499,101,'Software Engineer'); INSERT INTO assigned_to VALUES(7521,101,'Software Architect'); INSERT INTO assigned_to VALUES(7566,101,'Project Manager'); INSERT INTO assigned_to VALUES(7654,102,'Sales'); INSERT INTO assigned_to VALUES(7521,102,'Software Engineer'); INSERT INTO assigned_to VALUES(7499,102,'Software Engineer'); INSERT INTO assigned_to VALUES(7654,103,'Cyber Security');
INSERT INTO assigned_to VALUES(7698,104,'Software Engineer'); INSERT INTO assigned_to VALUES(7900,105,'Software Engineer'); INSERT INTO assigned_to VALUES(7839,104,'General Manager');

select * from assigned_to;
select e.emp_no from Employee e, assigned_to a, project p where e.emp_no=a.emp_no and a.p_no=p.p_no and p.p_loc in ('Bengaluru','Hyderabad','Mysuru');

SELECT emp_no FROM Employee WHERE emp_no NOT IN (SELECT emp_no FROM Incentives);

select e.emp_no, e.ename, d.d_name, d.d_loc, a.job_role, p.p_loc from Employee e, dept d, assigned_to a, project p where e.dept_no=d.dept_no and e.emp_no=a.emp_no and a.p_no=p.p_no and d.d_loc=p.p_loc;

SELECT e2.ENAME AS Manager_Name FROM EMPLOYEE e1 JOIN EMPLOYEE e2 ON e1.MGR_NO = e2.EMPNO GROUP BY e2.ENAME HAVING COUNT(e1.EMPNO) = ( SELECT MAX(emp_count)
FROM (
	SELECT COUNT(e1.EMPNO) AS emp_count
	FROM EMPLOYEE e1
	WHERE e1.MGR_NO IS NOT NULL
	GROUP BY e1.MGR_NO
) AS counts
);

-- q1
SELECT E.ENAME AS MANAGER_NAME FROM EMPLOYEE E WHERE E.EMP_NO in (SELECT MGR_NO FROM EMPLOYEE GROUP BY MGR_NO ORDER BY COUNT(*) DESC); 

-- q3
SELECT M.ENAME FROM EMPLOYEE M WHERE M.EMP_NO IN ( SELECT MGR_NO FROM EMPLOYEE)  AND M.SAL > ( SELECT AVG(E.SAL) FROM EMPLOYEE E WHERE E.MGR_NO = M.EMP_NO);

-- q4
SELECT e.*, i.incentive_amount FROM employee e JOIN incentives i ON e.emp_no = i.emp_no WHERE i.incentive_date BETWEEN '2019-02-01' AND '2019-02-28' 
AND i.incentive_amount = ( SELECT MAX(incentive_amount) FROM incentives WHERE incentive_date BETWEEN '2019-02-01' AND '2019-02-28' 
AND incentive_amount < (SELECT MAX(incentive_amount) FROM incentives WHERE incentive_date BETWEEN '2019-02-01' AND '2019-02-28'));

-- q5
SELECT * FROM employee e WHERE e.DEPT_NO = (SELECT E1.DEPT_NO FROM EMPLOYEE E1 WHERE E1.EMP_NO=E.MGR_NO);

-- q6
SELECT DISTINCT e.ename FROM employee e, incentives i  WHERE (e.sal + i.incentive_amount) >= ANY ( SELECT (e1.sal + i1.incentive_amount) FROM employee e1 JOIN incentives i1 ON e1.emp_no = i1.emp_no WHERE e1.dept_no = e.dept_no);



