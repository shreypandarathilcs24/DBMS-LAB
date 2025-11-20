create database supplier_bf285;
use supplier_bf285;
create table Suppliers (sid integer(5) primary key, sname varchar(20), city varchar(20));
create table Parts (pid integer(5) primary key, pname varchar(20), color varchar(10));
create table catalog (sid_no integer(5), pid_no integer(5), foreign key (sid_no) references Suppliers(sid), cost float(6), primary key(sid_no,pid_no));
insert into Suppliers (sid, sname, city) VALUES (10001,'Acme Widegt','Banglore'), (10002,'Johns','Kolkata'), (10003,'Vimal','Mumbai'), (10004,'Reliance','Delhi'),(10005,'Mahindra','Mumbai');
insert into Parts (pid,pname,color) VALUES (20001,'Book','Red'), (20002,'Pen','Red'), (20003,'Pencil','Green'), (20004,'Mobile','Green'), (20005,'Charger','Black');
insert into catalog (sid_no, pid_no, cost) VALUES (10001,20001,10), (10001,20002,10), (10001,20003,30), (10001,20004,10), (10001,20005,10), (10002,20001,10), (10002,20002,20), (10003,20003,30), (10004,20003,40);
select * from catalog;

select distinct p.pname from parts p, catalog c where p.pid=c.pid_no;

SELECT DISTINCT C.sid_no FROM Catalog C WHERE C.cost>( SELECT AVG (C1.cost) FROM Catalog C1 WHERE C1.pid_no = C.pid_no );

SELECT P.pid, S.sname FROM Parts P, Suppliers S, Catalog C WHERE C.pid_no = P.pid AND C.sid_no = S.sid AND C.cost = (SELECT MAX (C1.cost) FROM Catalog C1 WHERE C1.pid_no = P.pid);

select p.pname from suppliers s, parts p, catalog c where c.pid_no=p.pid AND c.sid_no=s.sid AND s.sname='Acme Widegt';

SELECT P.pid, S.sname
FROM Parts P, Suppliers S, Catalog C
WHERE C.pid_no = P.pid
  AND C.sid_no = S.sid
  AND C.cost = (
        SELECT MAX(C1.cost)
        FROM Catalog C1
        WHERE C1.pid_no = P.pid
  );

