select * from professor;
select * from department;
select * from student;
select * from salgrade;


// 테이블 이름 확인
select * from tab;

// 테이블 구조 확인
DESC table_name;
select * from all_tables;
DESC PROFESSOR;

SELECT * FROM PROFESSOR;

// SQL 명령문의 기초


// 테이블의 모든 데이터를 검색
select deptno, dname,college, loc
from department;

select *
from department;

//테이블의 특정 컬럼을 선택
select dname, deptno
from department;

// 교수테이블 에서 교수이름, 지급, 급여를 출력
select name,position,sal
from professor;

// 학생 테이블 에서 학생이름,학과번호.학년.학생번호 출력 
select name,deptno,grade,studno 
from student;



// 중복행 출력 금지 - 단일 컬럼
select distinct deptno
from student;
// 학생 테이블에서 학과 번호를 출력
select distinct deptno
from student;

// 교수 테이블에서 중복을 제외한 학과번호 출력
select distinct deptno
from professor
;

// 중복행 출력 금지 - 복수 컬럼
select distinct deptno,grade
from student;

// 학생 테이블에서 학과 번호를 출력
select distinct deptno,grade
from student
order by deptno,grade;

// 컬럼 별명 부여 예
SELECT DNAME DEPT_NAME, DEPTNO AS DN
FROM DEPARTMENT;

SELECT DNAME "DEPARTMENT NAME"
     , DEPTNO "부서번호#"
FROM DEPARTMENT;

//
SELECT STUDNO "학번"
     , NAME   "학생의 이름"
     , GRADE  "학년"
FROM STUDENT;

// 합성 연산자 사용
SELECT STUDNO || ' ' || NAME "STUDENT"
FROM STUDENT;

// 산술 연산자 사용
SELECT NAME, WEIGHT, WEIGHT*2.2 AS WEIGHT_POUND
FROM STUDENT;

// 1. VARCHAR2(30)
DESC DEPARTMENT;

//2.
SELECT NAME,POSITION,SAL,DEPTNO
FROM PROFESSOR;

//3.
SELECT STUDNO,NAME,USERID
FROM STUDENT;

//4.
SELECT DISTINCT POSITION
FROM PROFESSOR;

//5.
SELECT PROFNO   "교수 NO"
      ,NAME     "이름"
      ,POSITION "직급"
      ,DEPTNO   "학과 번호"
FROM PROFESSOR;

// 6.
SELECT ENAME|| ','|| JOB "Employee and Title"
FROM EMP;

//7.
SELECT PROFNO       "교수 번호"
      ,NAME         "이름"
      ,POSITION     "직급"
      ,SAL          "급여"
      ,SAL*1.33     "New Salary"
FROM PROFESSOR;


// 문자형 데이터 타입과 문자 상수 비교 방법
SELECT * FROM STUDENT
WHERE GRADE ='1';

SELECT * FROM STUDENT
WHERE GRADE =1; // 데이터 타입이 틀림 ==> '1'

DESC STUDENT;

// 상수값, CHAR, VARCHAR2 비교
CREATE TABLE EX_TYPE(C CHAR(10)
                    ,V VARCHAR2(10));
INSERT INTO EX_TYPE
VALUES('SQL','SQL');

SELECT *
FROM EX_TYPE
WHERE C='SQL';

SELECT *
FROM EX_TYPE
WHERE V='SQL';


SELECT *
FROM EX_TYPE
WHERE C=V;  //char 와 varchar2의 길이가 다르므로 비교결과가 거짓

// date 데이터 타입
SELECT SYSDATE FROM DUAL;

//ROWID 데이터 타입
SELECT ROWID,PROFNO,NAME,POSITION,SAL // 모든 데이터에는 ROWID를 가지고 있다.
FROM PROFESSOR;

SELECT ROWID,NAME,GRADE
FROM STUDENT;

SELECT ROWID,ENAME,JOB
FROM EMP
WHERE ROWID ='AAAStHAAHAAAAFtAAA';

// ROWNUM
SELECT ROWNUM, ROWID, ENAME, JOB
FROM EMP;

// TIMESTAMP
CREATE TABLE EX_TIME
(ID     NUMBER(2),
BASICTIME       TIMESTAMP,
STANDARDTIME    TIMESTAMP WITH TIME ZONE,
LOCALTIME       TIMESTAMP WITH LOCAL TIME ZONE);

INSERT INTO EX_TIME
VALUES(1,SYSDATE,SYSDATE,SYSDATE);

SET LINESIZE 100
SELECT * FROM EX_TIME;

// DUAL
DESC SYS.DUAL;
SELECT DUMMY FROM DUAL;

SELECT 20*30
FROM DUAL;
//DUAL TABLE  
//오라클이 생성될 때 데이터딕셔너리에 자동 생성, 모든 사용자들의 접근 허용 
//sys가 소유한 테이블 데이터가 있는 테이블에서 유래하지 않는 
//상수값, 의사열, 표현식 등의 값을 단 한번만 돌리거나
//현재 날짜, 시각을 알고자 할때 일시적 산술, 날짜 연산 등에 주로 사용

SELECT SYSDATE -1   "YESTERDAY"
     , SYSDATE      "TODAY"
     , SYSDATE +1   "TOMORROW"
FROM DUAL;

//대소문자 변환 함수 INITCAT 함수
SELECT NAME, USERID, INITCAP(USERID)
FROM STUDENT
WHERE NAME='김영균';

// 대소문자 변환 함수 LOWER, UPPER 함수
SELECT USERID,LOWER(USERID),UPPER(USERID)
FROM STUDENT
WHERE STUDNO =20101;

// 문제
SELECT EMPNO,ENAME,SAL
FROM EMP
WHERE 1=1
AND ENAME = UPPER('Scott');

SELECT EMPNO,ENAME,SAL
FROM EMP
WHERE 1=1
AND INITCAP(ENAME) = 'Scott';

SELECT *
FROM EMP
WHERE LOWER(JOB) ='manager';

// 문자열 길이 반환 함수 LENGTH, LENGHTHB 함수
SELECT DNAME,LENGTH(DNAME), LENGTHB(DNAME)
FROM DEPARTMENT;


//오라클에서 캐릭터 셋이 AL32UTF8 인경우 한글을 한자당 3바이트씩 인식한다

//#현재 캐릭터셋 확인
SELECT *
FROM  nls_database_parameters
WHERE parameter = 'NLS_CHARACTERSET';


// 문자조작 함수 CONCAT 함수
SELECT CONCAT(CONCAT(NAME,' 의 직책은 '),POSITION)
FROM PROFESSOR;

// 문자조작 함수 SUBSTR 함수
SELECT NAME, 
       IDNUM, 
       SUBSTR(IDNUM,1,6) BIRTH_DATE,
       SUBSTR(IDNUM,3,2) BIRTH_MON,
       SUBSTR(IDNUM,5,2) BIRTH_DAY
FROM   STUDENT
WHERE  1=1
  AND  GRADE ='1'
  AND  SUBSTR(IDNUM,7,1) ='1';

// 문제

// 1
SELECT DISTINCT JOB
FROM EMP;

// 2
SELECT ENAME    "Name"
      ,SAL*12   "Annual Salary"
FROM EMP;

//3
SELECT ENAME || ': 1 Month salary = '||SAL  "MONTHLY"
FROM EMP;

//4
SELECT EMPNO
      ,ENAME
      ,SAL
      ,SAL*1.25 "New Salary"
FROM EMP;

// 5
SELECT EMPNO
      ,ENAME
      ,SAL
      ,SAL*1.25       "New Salary"
      ,SAL*1.25 - SAL "Increase"
FROM EMP;

// 6
SELECT *
FROM EMP
WHERE 1=1
AND   SUBSTR(HIREDATE,4,2)='02';

//7
SELECT INITCAP(ENAME)   "Name"
      ,LENGTH(ENAME)    "Length"
FROM EMP;