// WHERE 절을 이용한 조건 검색
SELECT STUDNO,NAME,DEPTNO
FROM STUDENT
WHERE GRADE ='1';

//비교 연산자를 사용한 조건 검색
SELECT STUDNO , NAME, GRADE, DEPTNO, WEIGHT
FROM STUDENT
WHERE WEIGHT <= 70;

// 
SELECT NAME,POSITION,SAL,DEPTNO
FROM PROFESSOR
WHERE SAL >=430;

//
SELECT NAME,POSITION,SAL,DEPTNO
FROM PROFESSOR
WHERE NAME ='김도훈';

//
SELECT NAME         "교수의 이름"
      ,POSITION     "교수의 직급"
      ,SAL          "급여"
      ,DEPTNO       "학과 번호"
FROM PROFESSOR
WHERE NAME ='김도훈';

// AND 논리 연산자를 이용한 조건 검색
SELECT STUDNO, NAME, WEIGHT,DEPTNO
FROM STUDENT
WHERE GRADE = '1'
AND WEIGHT >=70;

// OR 논리 연산자를 이용한 조건 검색
SELECT STUDNO, NAME,WEIGHT,DEPTNO
FROM STUDENT
WHERE (GRADE ='1' OR WEIGHT >= 70);

// NOT 논리 연산자를 이용한 조건 검색
SELECT STUDNO, NAME, WEIGHT, DEPTNO
FROM STUDENT
WHERE NOT DEPTNO = 101;

// BETWEEN 연산자를 이용한 조건 검색
SELECT STUDNO , NAME , WEIGHT
FROM STUDENT
WHERE WEIGHT BETWEEN 50 AND 70;

SELECT NAME, BIRTHDATE
FROM STUDENT
WHERE 1=1
AND BIRTHDATE BETWEEN '81/01/01' AND '83/12/31'
AND NAME !='임유진';

// IN 연산자를 이용한 조건 검색
SELECT NAME, GRADE, DEPTNO
FROM STUDENT
WHERE DEPTNO IN (102,201);

// 1. 교수 테이블 에서 101번 이면서 급여가 420 이상이고 직급이 교수인 학과 교수의 이름, 급여 ,학과번호를 출력하세요
SELECT NAME,SAL,DEPTNO
FROM PROFESSOR
WHERE 1=1
AND DEPTNO='101'
AND SAL >= 420
AND POSITION ='교수';

//2. 사원 테이블에서 급여가 
SELECT ENAME,SAL,DEPTNO
FROM EMP
WHERE 1=1
AND SAL BETWEEN 1300 AND 4500;

// IN 연산자를 이용한 조건 검색
SELECT NAME, GRADE, DEPTNO
FROM STUDENT
WHERE DEPTNO IN (102,201);

// LIKE 연산자를 이용한 조건 검색
SELECT NAME, GRADE, DEPTNO
FROM STUDENT
WHERE 1=1
AND NAME LIKE '김%'
AND GRADE ='2';

//
SELECT NAME,GRADE,DEPTNO
FROM STUDENT
WHERE 1=1
AND NAME LIKE '%진'
AND DEPTNO ='101';

// LIKE연산자 를 이용한 조건 검색
SELECT NAME ,GRADE, DEPTNO
FROM STUDENT
WHERE NAME LIKE '김_영';

//
SELECT NAME, PROFNO
FROM PROFESSOR
WHERE 1=1
AND NAME LIKE '권__'
AND DEPTNO NOT IN (101,202);

// ESCAPE 옵션
INSERT INTO STUDENT(STUDNO,NAME)
VALUES(33333,'황보_정호');

SELECT NAME
FROM STUDENT
WHERE NAME LIKE '황보\_%' ESCAPE '\';

//
SELECT NAME
      ,SAL
      ,COMM
      ,SAL*COMM   "급여" 
FROM PROFESSOR;

SELECT *
FROM STUDENT;

// NULL 의 이해
SELECT EMPNO,SAL,COMM
FROM EMP;

SELECT EMPNO, SAL+COMM
FROM EMP;

//
SELECT NAME, POSITION, COMM
FROM PROFESSOR;

// NULL 연산자를 이용한 조건 검색
SELECT NAME , POSITION, COMM
FROM PROFESSOR
WHERE COMM IS NULL;

SELECT NAME , POSITION, COMM
FROM PROFESSOR
WHERE COMM IS NOT NULL;

// 지도 교수를 배정 받지 않은 학생의 이름, 학과번호, 지도교수번호를 출력하세요.
SELECT NAME,DEPTNO,PROFNO
FROM STUDENT
WHERE 1=1
AND PROFNO IS NULL;

// 지도 교수를 배정 받지 않은 201학과 학생의 이름, 학과번호, 지도교수번호를 출력하세요.
SELECT NAME,DEPTNO,PROFNO
FROM STUDENT
WHERE 1=1
AND PROFNO IS NULL
AND DEPTNO = 201;

// 산술식에서의 NULL 처리
SELECT NAME,SAL,COMM,SAL*COMM SAL_COM
FROM PROFESSOR;

// 연산자 우선순위
SELECT NAME, GRADE, DEPTNO
FROM STUDENT
WHERE DEPTNO =102
AND (GRADE ='1' OR GRADE ='4');

SELECT NAME, GRADE, DEPTNO
FROM STUDENT
WHERE DEPTNO = 102
AND GRADE ='4'
OR GRADE ='1';

// 사원 테이블에서 이름에 A를 포함하고 커미션을 받지 않는 사원의 사원번호, 이름, 급여, 커미션을 출력
SELECT EMPNO,ENAME,SAL,COMM
FROM EMP
WHERE 1=1
AND ENAME LIKE '%A%'
AND COMM IS NULL;

// 학생 테이블과 교수 테이블에 대해 UNION 연산을 수행하여 NAME,USERID,SAL 를 출력하세요 SAL 없으면 0 으로 출력 전체인원수 확인
SELECT NAME,USERID,0 SAL
FROM STUDENT
UNION 
SELECT NAME,USERID,SAL
FROM PROFESSOR;

SELECT COUNT(*)
FROM(
    SELECT NAME,USERID,0 SAL
    FROM STUDENT
    UNION 
    SELECT NAME,USERID,SAL
    FROM PROFESSOR
)
;

//
CREATE TABLE STUD_HEAVY
AS SELECT *
FROM STUDENT
WHERE WEIGHT>=70 AND GRADE ='1';

CREATE TABLE STUD_101
AS SELECT *
FROM STUDENT
WHERE DEPTNO=101 AND GRADE ='1';

// INTERSECT ??
SELECT NAME 
FROM STUD_HEAVY
INTERSECT
SELECT NAME
FROM STUD_101;

// MINUS 연산
SELECT STUDNO 학번, NAME 이름
FROM STUD_HEAVY
MINUS
SELECT STUDNO, NAME
FROM STUD_101;

SELECT STUDNO 학번 , NAME 이름
FROM STUD_101
MINUS
SELECT STUDNO,NAME
FROM STUD_HEAVY;

// 교수 테이블에서 전체 교수의 급여를 인상하기 위한 직원 명단을 출력하려고 한다. 단, 직급이 전임 강사인 사람들은 명단에서 제외하세요
SELECT NAME,POSITION
FROM PROFESSOR
MINUS
SELECT NAME,POSITION
FROM PROFESSOR
WHERE 1=1
AND POSITION ='전임강사';
;

SELECT *
FROM PROFESSOR
WHERE 1=1
AND POSITION != '전임강사';

// 단일 컬럼을 이용한 정렬 -오름차순
SELECT NAME, GRADE, TEL
FROM STUDENT
ORDER BY NAME;

// 단일 컬럼을 이용한 정렬 - 내림차순
SELECT NAME, GRADE, TEL
FROM STUDENT
ORDER BY GRADE DESC;

// ORDER BY 절 사용시 정렬 기준의 원칙
SELECT *
FROM EMP
ORDER BY SAL DESC;

// 다중 열에 의한 정렬
SELECT ENAME,JOB,DEPTNO,SAL
FROM EMP
ORDER BY DEPTNO ASC,SAL DESC;

// 실습
SELECT ENAME,DEPTNO
FROM EMP
WHERE 1=1
AND DEPTNO IN (10,30)
ORDER BY ENAME;

// 실습
SELECT ENAME,HIREDATE
FROM EMP
WHERE 1=1
--AND SUBSTR(HIREDATE,0,2) ='82'
--AND HIREDATE LIKE '82%';/
and to_char(hiredate,'YYYY') ='1982';
;

// 실습
SELECT ENAME,SAL,COMM
FROM EMP
ORDER BY SAL DESC,COMM DESC;

// 실습
SELECT ename,sal,comm
FROM emp
WHERE 1=1
AND comm >= sal * 0.2
AND deptno = 30
ORDER BY ename;


//
select initcap(ename) "Name"
     , length(ename)  "Length"
from emp
where 1=1
  and substr(upper(ename),1,1) in ('J','A','M')
order by ename
;

// 문자 조작 함수 INSTR 함수
SELECT INSTR('CORPORATE FLOOR','OR') FROM DUAL;
SELECT INSTR('CORPORATE FLOOR','OR',3,2) FROM DUAL;
SELECT INSTR('CORPORATE FLOOR','OR',-3,2) FROM DUAL;

select dname,instr(dname,'과')
from department;

select instr('Welcome to Oracle 10g','o') from dual;
select instr('Welcome to Oracle 10g','o',3,2) from dual;

// 문자조작 함수 lpad, rpad
SELECT position,
       LPAD(position,10,'*') lapd_position,
       userid,
       RPAD(userid,12,'+')   rpad_position
FROM   professor;

// 문자조작 함수 LTRIM,RTRIM
SELECT LTRIM('xyxXxyLAST WORD','xy') FROM DUAL;

SELECT RTRIM('TRUNERyxXxy','xy') FROM DUAL;

// 숫자 함수 ROUND 함수
SELECT   name,sal,sal/22
        ,ROUND(sal/22)      // 소수점 0째자리
        ,ROUND(sal/22,2)    // 소수점 2째자리
        ,ROUND(sal/22,-1)   // 정수   1째자리
FROM professor
WHERE deptno =101;

// 숫자 함수 TRUNC 함수
SELECT   name,sal,sal/22
        ,TRUNC(sal/22)      // 절삭 소수점 0째자리
        ,TRUNC(sal/22,2)    // 절삭 소수점 2째자리
        ,TRUNC(sal/22,-1)   // 절삭 정수   1째자리
FROM     professor
WHERE    deptno =101;

// 숫자 함수 MOD 함수
SELECT  name,sal,comm,MOD(sal,comm)
FROM    professor
WHERE   deptno =101;

// 숫자 함수 CEIL,FLOOR 함수
SELECT CEIL(19.7)       //무조건 올림 
     , FLOOR(12.345)    //무조건 내림
FROM DUAL;

// 날짜 함수
SELECT name, hiredate, hiredate+30, hiredate+60
FROM   professor
WHERE  profno =9908;

SELECT SYSDATE FROM DUAL;

// 날짜 함수 MONTHS_BETWEEN,ADD_MOMTHS
SELECT profno, hiredate,
       MONTHS_BETWEEN(SYSDATE,hiredate) TENURE,
       ADD_MONTHS(hiredate,6)           REVIEW
FROM   professor
WHERE  1=1
AND MONTHS_BETWEEN(SYSDATE,hiredate) <480;


// 날짜 함수 LAST_DAY, NEXT_DAY
SELECT SYSDATE, LAST_DAY(SYSDATE), NEXT_DAY(SYSDATE,'일') FROM DUAL;

SELECT SYSDATE, LAST_DAY(SYSDATE), NEXT_DAY(SYSDATE,1) FROM DUAL;

// 날짜 함수 ROUND, TRUNC 함수
SELECT TO_CHAR(SYSDATE, 'YY/MM/DD HH24:MI:SS')          NORMAL,
       TO_CHAR(TRUNC(SYSDATE), 'YY/MM/DD HH24:MI:SS')   TRUNC,      // 날짜를 절삭
       TO_CHAR(ROUND(SYSDATE), 'YY/MM/DD HH24:MI:SS')   ROUND       // 날짜를 반올림
FROM   DUAL;

SELECT TO_CHAR(hiredate, 'YY/MM/DD HH24:MI:SS')     hiredate,
       TO_CHAR(ROUND(hiredate, 'dd'), 'YY/MM/DD')   round_dd,
       TO_CHAR(ROUND(hiredate, 'mm'), 'YY/MM/DD')   round_mm,
       TO_CHAR(ROUND(hiredate, 'yy'), 'YY/MM/DD')   round_yy
FROM   professor
WHERE  deptno =101;


// 데이터 타입의 변환
DESC student;
SELECT * FROM student WHERE GRADE ='1'; --정답
SELECT * FROM student WHERE GRADE = 1;  --타입을 잘못줌
-- type varchar2 --> number 주면 묵시적으로 형변환이 일어남
-- 묵시적인 형변환에 의해 인덱스 사용이 불가능하여 처리 속도가 느려질수 있음


// TO_CHAR 함수
SELECT studno, TO_CHAR(birthdate,'YY-MM') birthdate
FROM   student
WHERE  name ='전인하';

SELECT name, grade, TO_CHAR(birthdate,'Day Month DD, YYYY') birthdate
FROM   student
WHERE  deptno=102;

// 문제
SELECT TRUNC(SYSDATE - TO_DATE('1991-05-20','YYYY-MM-DD')) "Lived day"
FROM DUAL;

SELECT ROUND(MONTHS_BETWEEN(SYSDATE,TO_DATE('1991-05-20','YYYY-MM-DD')))  "month"
FROM DUAL;


// 시간 표현 형식
SELECT  name, TO_CHAR(hiredate ,'MONTH DD , YYYY HH24:MI:SS PM') HIREDATE
FROM    professor
WHERE   deptno =101;

-- NLS_LANGUAGE 변경하는 방법
ALTER SESSION SET NLS_LANGUAGE = AMERICAN;
ALTER SESSION SET NLS_LANGUAGE = KOREAN;

// 기타 날짜 표현 형식
SELECT name, position,TO_CHAR(hiredate, 'MON "THE" DDTH "of" YYYY') HIREDATE
FROM   professor
WHERE  deptno = 101;

// 숫자를 문자 형식으로 변환
SELECT name,sal,comm,TO_CHAR((sal+comm)*12,'9,999') annual_sal
FROM   professor
WHERE  comm IS NOT NULL;

// TO_NUMBER 함수
SELECT TO_NUMBER('1') num
FROM   dual;

// TO_DATE 함수
SELECT  name, hiredate
FROM    professor
WHERE   hiredate = TO_DATE('6월 01,01','MONTH DD, YY');

// 중첩 함수
SELECT TO_CHAR(TO_DATE(SUBSTR(idnum,1,6),'YYMMDD'),'YY/MM/DD') BIRTHDATE
FROM    student;

// 일반 함수 NVL 변환 함수
SELECT    name, position, sal, comm, sal*comm
        , sal*NVL(COMM,0)   s1
        , NVL(sal*comm,sal) s2
FROM      professor
WHERE     deptno = 201;

// 사원 테이블 에서 사번, 이름, 급여 ,커미션, 급여 * 커미션 출력하세요. 만약 커미션이 없다면 급여면 출력하세요
SELECT empno,
       ename,
       sal,
       comm,
       NVL(sal*comm,sal),
       sal + NVL(comm,0)
FROM emp
WHERE comm IS NULL;

// 일반 함수 NVL 확장 함수
SELECT  name,position,sal,comm,
        NVL2(comm,sal*comm,sal) total
FROM    professor
WHERE   deptno = 102;

SELECT ename, sal,comm
        , sal+comm
        , NVL2(comm,sal+comm,sal)
        , sal+NVL(comm,0)
FROM emp;

// 교수 테이블에서 교수 이름과 보너스를 출력. 단, 보너스가 없을시 'No'을 출력하세요.
SELECT name,nvl(TO_CHAR(comm),'No') COMM
FROM professor;



// 일반 함수 NVL 확장 함수
SELECT  name,
        userid,
        LENGTHB(name),
        LENGTHB(userid),
        NULLIF(LENGTHB(name),LENGTHB(userid))        nullif_result
FROM    professor;