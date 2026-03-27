CREATE LOGIN dba WITH PASSWORD = '123'; ---Chay lenh nay o master
USE QLBV
CREATE USER dba FOR LOGIN dba;
ALTER ROLE db_owner ADD MEMBER dba;
