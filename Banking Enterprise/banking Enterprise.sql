create database BankingEnt_bf285;
use BankingEnt_bf285;
create table branch(branch_name varchar (50), branch_city varchar (50), assets real, primary key(branch_name));
desc branch;
create table BankAccount(acc_no int, branch_name varchar (50), balance real, primary key (acc_no), foreign key(branch_name) references branch(branch_name));
desc BankAccount;
create table Bank_Customer(Customer_name varchar (50), Customer_Street varchar (50), Customer_City varchar (50), primary key(Customer_name));
desc Bank_Customer;
create table Depositor(Customer_name varchar (50), Acc_no int, primary key(Customer_name, Acc_no), foreign key(Customer_name) references Bank_Customer(Customer_name), foreign key(Acc_no) references BankAccount(Acc_no));
desc Depositor;
create table Loan (Loan_Number int, Branch_Name varchar (50), Amount real, primary key (Loan_Number), foreign key (Branch_Name) references Branch(Branch_Name));
desc Loan;

alter table branch rename to Branch;
alter table BankAccount rename to Bank_Account;

insert into Branch (branch_name, branch_city, assets) values ('SBI_Chamrajpet', 'Bangalore', 50000), ('SBI_ResidencyRoad', 'Bangalore', 10000), ('SBI_ShivajiRoad', 'Bombay', 20000), ('SBI_ParliamentRoad','Delhi',10000),('SBI_Jantarmantar','Delhi',20000);
insert into Bank_Account (acc_no, branch_name, balance) values (1,'SBI_Chamrajpet',2000),(2,'SBI_ResidencyRoad',5000), (3,'SBI_ShivajiRoad',6000), (4,'SBI_ParliamentRoad',9000), (5,'SBI_Jantarmantar',8000), (6,'SBI_ShivajiRoad', 4000), (8,'SBI_ResidencyRoad',4000), (9,'SBI_ParliamentRoad',3000), (10, 'SBI_ResidencyRoad', 5000), (11,'SBI_Jantarmantar',2000);
select * from Branch;
select * from Bank_Account;
insert into Bank_Customer (Customer_Name, Customer_Street, Customer_City) values ('Avinash', 'Bull_Temple_Road', 'Bangalore'), ('Dinesh','Bannerghatta_Road','Bangalore'), ('Mohan','National_College_Road','Bangalore'), ('Nikhil','Akbar_Road','Delhi'), ('Ravi','Prithviraj_Road','Delhi');
select * from Bank_Customer;
insert into Depositor (Customer_name, Acc_no) values ('Avinash',1), ('Dinesh',2), ('Nikhil',4), ('Ravi',5), ('Avinash',8), ('Nikhil',9), ('Dinesh',10), ('Nikhil',11);
select * from Depositor;
insert into Loan (Loan_Number, Branch_Name, Amount) values (1,'SBI_Chamrajpet',1000), (2,'SBI_ResidencyRoad',2000), (3,'SBI_ShivajiRoad',3000), (4,'SBI_ParliamentRoad',4000), (5,'SBI_Jantarmantar',5000);
select * from Loan;

SELECT * FROM LOAN ORDER BY AMOUNT DESC;

select branch_name, (assets/100000) as 'assets in lakhs' from branch;
(SELECT Customer_name FROM Depositor) UNION (SELECT CUSTOMER_NAME FROM Loan); /not done

update Bank_Account set balance = balance+(balance*0.05);
select * from Bank_Account;

 






