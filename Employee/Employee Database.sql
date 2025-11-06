create database Employee_bf285;
use Employee_bf285;
create table 
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

insert into dept VALUES(10,'Accounting', 'Mumbai');
insert into dept VALUES(20,'Research','Bengaluru');
insert into dept VALUES(30,'Sales','Delhi');
insert into dept VALUES(40,'Operations','Chennai');

ALTER TABLE Employee MODIFY COLUMN sal DECIMAL(9,2);

insert into Employee VALUES(7369,'Adarsh',7902,'2012-12-17','80000.00','20');
insert into Employee VALUES(7499,'Shruthi',7698,'2013-02-20','16000.00','30');
insert into Employee VALUES(7521,'Anvitha',7698,'2015-02-22','12500.00','30');
insert into Employee VALUES(7566,'Tanvir',7839,'2008-04-02','29750.00','20');
insert into Employee VALUES(7654,'Ramesh',7698,'2014-09-28','12500.00','30');
insert into Employee VALUES(7698,'Kumar',7839,'2015-05-01','28500.00','30');
insert into Employee VALUES(7782,'Clark',7839,'2017-06-09','24500.00','10');
insert into Employee VALUES(7788,'Scott',7566,'2010-12-09','30000.00','20');
insert into Employee VALUES(7839,'King',NULL,'2009-11-17','500000.00','10');
insert into Employee VALUES(7844,'Turner',7698,'2010-09-08','15000.00','30');
insert into Employee VALUES(7876,'Adams',7788,'2013-01-12','11000.00','20');
insert into Employee VALUES(7900,'James',7698,'2017-12-03','9500.00','30');
insert into Employee VALUES(7902,'Ford',7566,'2010-12-03','30000.00','20');

INSERT INTO incentives VALUES(7499,'2019-02-01',5000.00);
INSERT INTO incentives VALUES(7521,'2019-03-01',2500.00);
INSERT INTO incentives VALUES(7566,'2022-02-01',5070.00);
INSERT INTO incentives VALUES(7654,'2020-02-01',2000.00);
INSERT INTO incentives VALUES(7654,'2022-04-01',879.00);
INSERT INTO incentives VALUES(7521,'2019-02-01',8000.00);
INSERT INTO incentives VALUES(7698,'2019-03-01',500.00);
INSERT INTO incentives VALUES(7698,'2020-03-01',9000.00);
INSERT INTO incentives VALUES(7698,'2022-04-01',4500.00);

INSERT INTO project VALUES(101,'AI Project','BENGALURU');
INSERT INTO project VALUES(102,'IOT','HYDERABAD');
INSERT INTO project VALUES(103,'BLOCKCHAIN','BENGALURU');
INSERT INTO project VALUES(104,'DATA SCIENCE','MYSURU');
INSERT INTO project VALUES(105,'AUTONOMUS SYSTEMS','PUNE');

INSERT INTO assigned_to VALUES(7499,101,'Software Engineer');
INSERT INTO assigned_to VALUES(7521,101,'Software Architect');
INSERT INTO assigned_to VALUES(7566,101,'Project Manager');
INSERT INTO assigned_to VALUES(7654,102,'Sales');
INSERT INTO assigned_to VALUES(7521,102,'Software Engineer');
INSERT INTO assigned_to VALUES(7499,102,'Software Engineer');
INSERT INTO assigned_to VALUES(7654,103,'Cyber Security');
INSERT INTO assigned_to VALUES(7698,104,'Software Engineer');
INSERT INTO assigned_to VALUES(7900,105,'Software Engineer');
INSERT INTO assigned_to VALUES(7839,104,'General Manager');

select e.emp_no from Employee e, assigned_to a, project p where e.emp_no=a.emp_no and a.p_no=p.p_no and p.p_loc in ('Bengaluru','Hyderabad','Mysuru');

SELECT emp_no FROM Employee WHERE emp_no NOT IN (SELECT emp_no FROM Incentives);

select e.emp_no, e.ename, d.d_name, d.d_loc, a.job_role, p.p_loc from Employee e, dept d, assigned_to a, project p where e.dept_no=d.dept_no and e.emp_no=a.emp_no and a.p_no=p.p_no and d.d_loc=p.p_loc;







