SHOW DATABASES;
USE MYSQL;
CREATE DATABASE INSU_bf285;
create table person (driver_id varchar(15), Name varchar(15), Address varchar(15))
create table CAR (reg_num varchar(15), Model varchar(10), Year int(5), primary key(reg_num));
create table ACCIDENT (report_num varchar(15), accident_date date, Location varchar(15), primary key(report_num));
create table OWNS (driver_id varchar(15), reg_num varchar(15), primary key(driver_id));
create table PARTCIPATED (driver_id varchar(15), reg_num varchar(15), report_num int(15), damage_amount int(15), primary key(report_num));

alter table person add primary key(driver_id);
alter table partcipated add foreign key(driver_id) references person(driver_id);
desc person;
alter table partcipated add foreign key(reg_num) references car(reg_num);

insert into person values('A01','Richard','Srinivas Nagar');
insert into person values('A02','Pradeep','Rajaji Nagar');
insert into person values('A03','Smith','Ashok Nagar');
insert into person values('A04','Venu','N R Colony');
insert into person values('A05','Jhon','Hanumanth Nagar');

insert into CAR values('KA052250','Indica',1990);
insert into CAR values('KA031181','Lancer',1957);
insert into CAR values('KA095477','Toyota',1998);
insert into CAR values('KA053408','Honda',2008);
insert into CAR values('KA041702','Audi',2005);

insert into OWNS values('A01','KA052250');
insert into OWNS values('A02','KA053408');
insert into OWNS values('A03','KA031181');
insert into OWNS values('A04','KA095477');
insert into OWNS values('A05','KA041702');

insert into ACCIDENT values(11,'2003-01-01','Mysore Road');
insert into ACCIDENT values(12,'2004-02-02','Arizona');
insert into ACCIDENT values(13,'2003-01-21','Miami');
insert into ACCIDENT values(14,'2008-02-17','Ohio');
insert into ACCIDENT values(15,'2005-03-04','Chicago');

insert into PARTCIPATED values('A01','KA052250',11,10000);
insert into PARTCIPATED values('A02','KA053408',12,50000);
insert into PARTCIPATED values('A03','KA095477',13,25000);
insert into PARTCIPATED values('A04','KA031181',14,3000);
insert into PARTCIPATED values('A05','KA041702',15,5000);

select database();
show databases;
use insurance_bf285;
select * from participated;


   
    
create database insurance_shrey_bf285;

create table person (driver_id varchar(15), Name varchar(15), Address varchar(15), primary key(driver_id));
create table CAR (reg_num varchar(15), Model varchar(10), Year int(5), primary key(reg_num));
create table accident (report_num varchar(15), accident_date date, Location varchar(15), primary key(report_num));
create table owns (driver_id varchar(15), reg_num varchar(15), primary key(driver_id));
create table participated (driver_id varchar(15), reg_num varchar(15), report_num int(15), damage_amount int(15), primary key(report_num), foreign key(driver_id) references person(driver_id), foreign key(reg_num) references car(reg_num));

