create database insurance_shrey_bf285;

create table person (driver_id varchar(50), Name varchar(50), Address varchar(50), primary key(driver_id));
create table CAR (reg_num varchar(50), Model varchar(50), Year int(50), primary key(reg_num));
create table accident (report_num varchar(50), accident_date date, Location varchar(50), primary key(report_num));
create table owns (driver_id varchar(50), reg_num varchar(50), primary key(driver_id));
create table participated (driver_id varchar(50), reg_num varchar(50), report_num int(50), damage_amount int(50), primary key(report_num), foreign key(driver_id) references person(driver_id), foreign key(reg_num) references car(reg_num));

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

insert into PARTICIPATED values('A01','KA052250',11,10000);
insert into PARTICIPATED values('A02','KA053408',12,50000);
insert into PARTICIPATED values('A03','KA095477',13,25000);
insert into PARTICIPATED values('A04','KA031181',14,3000);
insert into PARTICIPATED values('A05','KA041702',15,5000);

SELECT * FROM PARTICIPATED ORDER BY DAMAGE_AMOUNT DESC;

SELECT AVG(DAMAGE_AMOUNT) FROM PARTICIPATED;

DELETE FROM PARTICIPATED
WHERE DAMAGE_AMOUNT < (
  SELECT avg_damage
  FROM (
    SELECT AVG(DAMAGE_AMOUNT) AS avg_damage
    FROM PARTICIPATED
  ) AS temp
);

SELECT NAME FROM PERSON A, PARTICIPATED P WHERE A.DRIVER_ID=P.DRIVER_ID AND DAMAGE_AMOUNT>(SELECT AVG(DAMAGE_AMOUNT) FROM PARTICIPATED);

SELECT MAX(DAMAGE_AMOUNT) FROM PARTICIPATED;


