create database insurance_shrey_bf285;

create table person (driver_id varchar(15), Name varchar(15), Address varchar(15), primary key(driver_id));
create table CAR (reg_num varchar(15), Model varchar(10), Year int(5), primary key(reg_num));
create table ACCIDENT (report_num varchar(15), accident_date date, Location varchar(15), primary key(report_num));
create table OWNS (driver_id varchar(15), reg_num varchar(15), primary key(driver_id));
create table PARTCIPATED (driver_id varchar(15), reg_num varchar(15), report_num int(15), damage_amount int(15), primary key(report_num), foreign key(driver_id) references person(driver_id));