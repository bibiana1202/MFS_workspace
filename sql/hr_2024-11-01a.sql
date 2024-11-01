테이블스페이스 만들기

새로운 프로젝트 시작하는 절차

1. H/W 구매
2. O/S 선택(Linux, Unix...)
3. DBMS 선택(ORACLE, MYSQL...)
4. CREATE TABLESPACE
5. CREATE USER
6. CREATE TABLE
7. INSERT DATA

C:\app\KOSA\product\21c\oradata\XE

권한 필요.

command창을 띄워서 sqlplus "/as sysdba"

--테이블스페이스를 만들 수 있는 권한을 hr에게 부여
SQL> grant create tablespace to hr;
sql> conn hr/hr;

create tablespace indx
datafile 'C:\app\KOSA\product\21c\oradata\XE\indx.dbf' size 100m;
---------------------------------------------------------------------------------
add constraints primary key dept_pk(deptno);


alter table department
modify ( dname constraint dname_nn not null);



alter table professor add constraints prof_pk primary key(profno);
alter table professor modify (name not null);


alter table professor add constraints prof_fk
foreign key(deptno) references department(deptno);

=================================================

SELECT constraint_name, constraint_type
FROM user_constraints
WHERE table_name IN ('SUBJECT','SUGANG','STUDENT');


alter table department
add constraint dept_pk primary key(deptno);

alter table department
modify ( dname constraint dname_nn not null);

---------------------------------------------------------------------------------

1. sesac라는 테이블 스페이스를 100m로 만드세요

conn /as sysdba

create tablespace sesac
datafile 'C:\app\irisj\product\21c\oradata\XE\indx.dbf' size 100m;

2. sesac/sesac123이라는 유저/패스를 생성하세요.
default tablespace는 sesac을 사용하고 temporary tablespace는 temp를 사용하도록 지정하세요.

conn /as sysdba

create user sesac identified by sesac123
default tablespace sesac
temporary tablespace temp;

alter user sesac quota unlimited on sesac;
3. 아래와 같이 employees 테이블을 생성하세요.

CREATE TABLE employees (
	employees_id	number(7),
	last_name		varchar2(25),
	first_name		varchar2(25),
	deptno		number(2),
	phone_number	varchar2(20)
);

4. 3에서 생성한 테이블에 아래와 같이 4건의 데이터를 입력하세요.
INSERT INTO employees VALUES (1, 'Biri', 'Ben', 10, '123-4566');
INSERT INTO employees VALUES (2, 'Dancs', 'Betty', 20, '123-7890');
INSERT INTO employees VALUES (3, 'Newman', 'Chad', 20, '123-8888');
INSERT INTO employees VALUES (3, 'New', 'haha', 20, '123-8888');

5. employees 테이블의 EMPLOYEE_ID열에 PRIMARY KEY 제약 조건을 추가하세요. 만약 제약조건이 걸리지 않는다면 이유를 말하시고, 수정후 제약조건을 추가해보세요.

기본키는 유일해야 하는데 이미 employee_id에 3이 중복되어 입력된 데이터가 존재하기 때문이다.
마지막 데이터를 삭제한 후 추가하면 된다.

DELETE FROM employees
WHERE last_name = 'New';

ALTER TABLE employees
ADD CONSTRAINT emp_id_pk PRIMARY KEY (employees_id);

6. 생성된 employees 테이블을 삭제해보세요.

DROP TABLE employees;


---------------------------------------------------------------------------------

-- 1.
create tablespace sesac
datafile '/opt/oracle/oradata/FREE/sesac.dbf' size 100m;

-- ALTER SESSION SET "_ORACLE_SCRIPT"=true; 잊지 말기

-- 2.
create user sesac identified by sesac123
default TABLESPACE sesac
temporary TABLESPACE temp;

-- 3.
CREATE TABLE employees
(EMPLOYEE_ID NUMBER(7),
LAST_NAME VARCHAR2(25),
FIRST_NAME VARCHAR2(25),
DEPTNO NUMBER(2),
PHONE_NUMBER VARCHAR2(20));

-- 4.
INSERT INTO employees
VALUES(1, 'Biri', 'Ben', 10, '123-4566');
INSERT INTO employees
VALUES(2, 'Dancs', 'Betty', 20, '123-7890');
INSERT INTO employees
VALUES(3, 'Newman', 'Chad', 20, '123-8888');
INSERT INTO employees
VALUES(3, 'New', 'haha', 20, '123-8888');

-- 5.
ALTER TABLE employees
ADD CONSTRAINT emp_id_pk PRIMARY KEY(employee_id);

-- 기본키 제약 조건을 추가할 수 없는 이유: 기본키로 지정하려는 employee_id 칼럼에 이미 값이 중복된 두 열이 존재함.
-- 해결 방법: employee_id 칼럼에 3 값을 갖는 열 중 LAST_NAME이 'New'인 열의 employee_id 값을 4로 변경하여 중복 제거

UPDATE employees
SET EMPLOYEE_ID = 4
WHERE LAST_NAME = 'New';

-- 위 쿼리를 실행한 후 위에 적어놓은 제약조건 추가 쿼리를 실행하면 정상적으로 제약조건이 추가됨.

-- 6.
DROP TABLE employees;












