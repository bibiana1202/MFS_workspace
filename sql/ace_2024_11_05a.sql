-- 계층형 쿼리
desc employees;


-- psuedo 컬럼
select last_name,rowid,rownum
from employees;

select last_name, level
from employees
start with manager_id is null
connect by manager_id = prior employee_id;

SELECT employee_id,
			 manager_id,
       LEVEL,
       CONNECT_BY_ROOT last_name AS 대표,
       CONNECT_BY_ISLEAF AS 막내,
       sys_connect_by_path(last_name,'/') AS PATH,
       lpad('',(LEVEL -1) * 3) || last_name AS last_name,
       PRIOR last_name
FROM employees
START WITH manager_id IS NULL
CONNECT BY manager_id = PRIOR employee_id
ORDER SIBLINGS BY employee_id ASC;

-- 계층형 쿼리
DESC employees;
SELECT last_name,LEVEL FROM employees;

select last_name,level from employees
connect by manager_id = prior employee_id;

select last_name,level from employees
start with manager_id is null
connect by manager_id = prior employee_id;


select first_name,level
from employees
start with manager_id is null
connect by prior employee_id = manager_id;

select  employee_id, manager_id, level,
        connect_by_root last_name as 대표,
        connect_by_isleaf as 막내,
        sys_connect_by_path(last_name,'/') as path,
        lpad('',(level-1)*3)||last_name as last_name,
        prior last_name
from employees
start with manager_id is null
connect by manager_id = prior employee_id
order siblings by employee_id asc
;
-- Multiple Column 서브쿼리
create table fruits(
name varchar2(20),
grade varchar2(1));

insert into fruits values('딸기', 'A');
insert into fruits values('딸기', 'B');
insert into fruits values('바나나', 'A');
insert into fruits values('바나나', 'B');
insert into fruits values('바나나', 'C');
COMMIT;

CREATE TABLE PURCHASES(
NAME VARCHAR2(20),
GRADE VARCHAR2(1));

insert into PURCHASES values('딸기', 'A');
insert into PURCHASES values('바나나', 'B');
COMMIT;

SELECT *
FROM fruits
WHERE NAME IN(SELECT NAME FROM purchases)
AND GRADE IN (SELECT GRADE FROM purchases); 

SELECT *
FROM fruits
WHERE (NAME ='딸기' OR NAME='바나나')
AND (GRADE='A' OR GRADE='B');

SELECT *
FROM fruits
WHERE (NAME,GRADE) IN (SELECT NAME,GRADE FROM purchases);

SELECT *
FROM fruits
WHERE (NAME,GRADE) NOT IN (SELECT NAME,GRADE FROM purchases);


DESC employees;

SELECT DEPARTMENT_ID, MIN(SALARY)
FROM employees
GROUP BY DEPARTMENT_ID;

SELECT FIRST_NAME,SALARY,DEPARTMENT_ID FROM EMPLOYEES
WHERE (DEPARTMENT_ID, SALARY) IN (SELECT DEPARTMENT_ID, MIN(SALARY) FROM EMPLOYEES GROUP BY DEPARTMENT_ID);

// with 절
with 
dept_cost as(
    select d.deptno,
    sum(e.sal) as dept_total
    from emp e, dept d
    where e.deptno= d.deptno
    group by d.deptno
)

,avg_cost as (
    select sum(dept_total) / count(*) as dept_avg
    from dept_costs
)

select * from dept_costs
where dept_total >(select dept_avg from avg_cost)
order by deptno
;

// cartesian product(Question)
select *
from emp;


--
-- Copyright (c) Oracle Corporation 1999. All Rights Reserved.
--
-- NAME
-- demobld.sql
--
-- DESCRIPTION
-- This script creates the SQL*Plus demonstration tables in the
-- current schema. It should be STARTed by each user wishing to
-- access the tables. To remove the tables use the demodrop.sql
-- script.
--
-- USAGE
-- SQL> START demobld.sql
--
-- 

alter session set nls_territory = 'AMERICA';
alter session set nls_language = 'AMERICAN';

SET TERMOUT ON
PROMPT Building demonstration tables. Please wait.
SET TERMOUT OFF

DROP TABLE EMP;
DROP TABLE DEPT;
DROP TABLE BONUS;
DROP TABLE SALGRADE;
DROP TABLE DUMMY;

CREATE TABLE EMP
(EMPNO NUMBER(4) NOT NULL,
ENAME VARCHAR2(10),
JOB VARCHAR2(9),
MGR NUMBER(4),
HIREDATE DATE,
SAL NUMBER(7, 2),
COMM NUMBER(7, 2),
DEPTNO NUMBER(2));

INSERT INTO EMP VALUES
(7369, 'SMITH', 'CLERK', 7902,
TO_DATE('17-DEC-1980', 'DD-MON-YYYY'), 800, NULL, 20);
INSERT INTO EMP VALUES
(7499, 'ALLEN', 'SALESMAN', 7698,
TO_DATE('20-FEB-1981', 'DD-MON-YYYY'), 1600, 300, 30);
INSERT INTO EMP VALUES
(7521, 'WARD', 'SALESMAN', 7698,
TO_DATE('22-FEB-1981', 'DD-MON-YYYY'), 1250, 500, 30);
INSERT INTO EMP VALUES
(7566, 'JONES', 'MANAGER', 7839,
TO_DATE('2-APR-1981', 'DD-MON-YYYY'), 2975, NULL, 20);
INSERT INTO EMP VALUES
(7654, 'MARTIN', 'SALESMAN', 7698,
TO_DATE('28-SEP-1981', 'DD-MON-YYYY'), 1250, 1400, 30);
INSERT INTO EMP VALUES
(7698, 'BLAKE', 'MANAGER', 7839,
TO_DATE('1-MAY-1981', 'DD-MON-YYYY'), 2850, NULL, 30);
INSERT INTO EMP VALUES
(7782, 'CLARK', 'MANAGER', 7839,
TO_DATE('9-JUN-1981', 'DD-MON-YYYY'), 2450, NULL, 10);
INSERT INTO EMP VALUES
(7788, 'SCOTT', 'ANALYST', 7566,
TO_DATE('09-DEC-1982', 'DD-MON-YYYY'), 3000, NULL, 20);
INSERT INTO EMP VALUES
(7839, 'KING', 'PRESIDENT', NULL,
TO_DATE('17-NOV-1981', 'DD-MON-YYYY'), 5000, NULL, 10);
INSERT INTO EMP VALUES
(7844, 'TURNER', 'SALESMAN', 7698,
TO_DATE('8-SEP-1981', 'DD-MON-YYYY'), 1500, 0, 30);
INSERT INTO EMP VALUES
(7876, 'ADAMS', 'CLERK', 7788,
TO_DATE('12-JAN-1983', 'DD-MON-YYYY'), 1100, NULL, 20);
INSERT INTO EMP VALUES
(7900, 'JAMES', 'CLERK', 7698,
TO_DATE('3-DEC-1981', 'DD-MON-YYYY'), 950, NULL, 30);
INSERT INTO EMP VALUES
(7902, 'FORD', 'ANALYST', 7566,
TO_DATE('3-DEC-1981', 'DD-MON-YYYY'), 3000, NULL, 20);
INSERT INTO EMP VALUES
(7934, 'MILLER', 'CLERK', 7782,
TO_DATE('23-JAN-1982', 'DD-MON-YYYY'), 1300, NULL, 10);

CREATE TABLE DEPT
(DEPTNO NUMBER(2),
DNAME VARCHAR2(14),
LOC VARCHAR2(13) );

INSERT INTO DEPT VALUES (10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO DEPT VALUES (20, 'RESEARCH', 'DALLAS');
INSERT INTO DEPT VALUES (30, 'SALES', 'CHICAGO');
INSERT INTO DEPT VALUES (40, 'OPERATIONS', 'BOSTON');

CREATE TABLE BONUS
(ENAME VARCHAR2(10),
JOB VARCHAR2(9),
SAL NUMBER,
COMM NUMBER);

CREATE TABLE SALGRADE
(GRADE NUMBER,
LOSAL NUMBER,
HISAL NUMBER);

INSERT INTO SALGRADE VALUES (1, 700, 1200);
INSERT INTO SALGRADE VALUES (2, 1201, 1400);
INSERT INTO SALGRADE VALUES (3, 1401, 2000);
INSERT INTO SALGRADE VALUES (4, 2001, 3000);
INSERT INTO SALGRADE VALUES (5, 3001, 9999);

CREATE TABLE DUMMY
(DUMMY NUMBER);

INSERT INTO DUMMY VALUES (0);

COMMIT;

SET TERMOUT ON
PROMPT Demonstration table build is complete.


;

select  
        decode(no,1,deptno,2,deptno),
        decode(no,1,job),
        sum(sum_sal)
from (select deptno,job,sum(sal) as sum_sal
        from emp
        group by deptno,job) cross join
        (select rownum as no 
        from emp 
        where rownum<=3)
group by decode(no,1,deptno,2,deptno),
        decode(no,1,job)
order by 1,2
;


select decode(no,1,deptid,2,deptid),
       decode(no,1,job_id),
       sum(sum_sal)
from
(
    select nvl(department_id,999) as deptid ,job_id,sum(salary) as sum_sal
    from employees
    group by department_id,job_id
) cross join
(
    select rownum as no
    from employees
    where rownum <=3
)
group by decode(no,1,deptid,2,deptid),
       decode(no,1,job_id)
       
order by 1,2;

-- 1. 부서별, 업무별, 급여 합계를 출력
select nvl(department_id,999) as department_id, job_id, sum(salary) as sumsal
from   employees
group  by department_id, job_id;

-- 2. 카르테시안 조인에 사용할 쿼리
select rownum as no from employees where rownum <= 3;

-- 3. 카르테시안 조인으로 데이터를 3배로 행(row) 복제
select  no, department_id, job_id, sumsal
from    (select nvl(department_id,999) as department_id, job_id, sum(salary) as sumsal
         from   employees
         group  by department_id, job_id)
         cross join (select rownum as no from employees where rownum <= 3);

-- 4. 집계를 위해 필드를 제거(decode, case~when)
select  no, 
        decode(no, 1, department_id, 2, department_id), 
        decode(no, 1, job_id), 
        sumsal
from    (select nvl(department_id,999) as department_id, job_id, sum(salary) as sumsal
         from   employees
         group  by department_id, job_id)
         cross join (select rownum as no from employees where rownum <= 3);   
-- 5. 부서별 집계, 전체 집계를 위한 group by 적용, 컬럼 alias부여, order by 적용
select   
        decode(no, 1, department_id, 2, department_id) as department_id, 
        decode(no, 1, job_id)                          as job_id, 
        sum(sumsal)                                    as sumsal
from    (select nvl(department_id,999) as department_id, job_id, sum(salary) as sumsal
         from   employees
         group  by department_id, job_id)
         cross join (select rownum as no from employees where rownum <= 3)
group by decode(no, 1, department_id, 2, department_id), 
         decode(no, 1, job_id)
order by 1, 2;


SELECT DEPTNO, JOB,SUM(SAL)
FROM EMP
GROUP BY ROLLUP(DEPTNO, JOB);


SELECT nvl(department_id,999) as department_id 
        , job_id 
        , sum(salary) as sum_sal
from employees
group by rollup(nvl(department_id,999) , job_id )
order by department_id,job_id;


select deptno , job , sum(sal)
from emp
group by cube(deptno,job)
order by deptno,job;

SELECT nvl(department_id,999) as department_id 
        , job_id 
        , sum(salary) as sum_sal
from employees
group by cube(nvl(department_id,999) , job_id )
order by department_id,job_id;


-- paging
create table board(
no          number       constraint board_no_pk primary key,
title       varchar2(100) not null,
re          number(3)     default 0,
regdate     date default sysdate);

create sequence seq_board
start with 1 increment by 1 nocache;


begin
    for i in 1..1000000 loop
        insert into board
        values(seq_board.nextval,
        '안녕하세요',
        trunc(dbms_random.value(0,100)),
        sysdate-((1000000-i)/24/6));
    end loop;
end;
/

commit;

select count(*) from board;

SELECT B.*
FROM (select rownum AS rnum ,A.*
        from (select no, title,re, 
                to_char(regdate,'YYYY-MM-DD hh24:mi:ss') as regdate
                    from board
                    order by no desc) A) B
where rnum between 21 and 30

