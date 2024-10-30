// 일반 함수 NVL 확장 함수 : NULLIF 함수
SELECT  name, userid, LENGTHB(name),LENGTHB(userid),
        NULLIF(LENGTHB(substr(name,1,2)),LENGTHB(userid)) nullif_result
FROM    professor;

// 일반 함수 NVL 확장 함수 : COALESCE 함수 : 인수중 null 이 아닌 첫 번째 인수를 반환
SELECT name, comm, sal, COALESCE(comm,sal,0) CO_RESULT
FROM professor;


// 일반 함수 DECODE 함수
SELECT  name, deptno,
        DECODE(deptno,101,'컴퓨터공학과',102,'멀티미디어학과',201,'전자공학과','기계공학과') DNAME
FROM    professor;

// DECODE 문을 사용하여 101번 학과 학생만 'Computer Science' 로 출력하고 101번 아닌 학생들은 학과명을 "ETC" 로 출력
SELECT name,DECODE(deptno,101,'Computer Science','ETC') deptno
FROM   student;

// 일반 함수 CASE 함수
SELECT name, deptno , sal,
       CASE WHEN deptno = 101 THEN sal*0.1
            WHEN deptno = 102 THEN sal*0.2
            WHEN deptno = 201 THEN sal*0.3
            ELSE 0
        END bobus
FROM professor;

// CASE 문을 사용해서 학생의 주민등록번호에서 태어난 달이 몇사분기인지 출력해보세요.
SELECT  name                    "이름"
       ,birthdate
       ,substr(birthdate,4,2)   "태어난 달"
       ,CASE WHEN substr(birthdate,4,2) >= 1 AND substr(birthdate,4,2) <=3 THEN '1/4'
             WHEN substr(birthdate,4,2) >= 4 AND substr(birthdate,4,2) <=6 THEN '2/4'
             WHEN substr(birthdate,4,2) >= 7 AND substr(birthdate,4,2) <=9 THEN '3/4'
             WHEN substr(birthdate,4,2) >= 10 AND substr(birthdate,4,2) <=12 THEN '4/4'
             ELSE '0'
        END                     "몇사분기"
FROM student;

// COUNT 함수
SELECT COUNT(comm)
FROM   professor
WHERE  deptno=101;

SELECT  COUNT(*)
FROM    professor
WHERE   deptno=101 AND comm IS NOT NULL;

// 사원 테이블에서 JOB 의 갯수
SELECT  COUNT(JOB) "직업의 갯수"
FROM    emp;

SELECT  COUNT(DISTINCT JOB) "중복을 제외한 JOB의 갯수"
FROM    emp;

// AVG, SUM 함수
SELECT  AVG(weight), SUM(weight)
FROM    student
WHERE   deptno = 101;

// MIN, MAX 함수
SELECT  MAX(height), MIN(height)
FROM    student
WHERE   deptno = 102;

SELECT  studno,name,height,deptno
FROM    student
WHERE   deptno = 102
ORDER BY height;

// STDDEV , VARIANCE 함수
SELECT  STDDEV(sal), VARIANCE(sal)
FROM    professor;

// 모든 사원의 최대 급여 ,최저 급여 , 합계 그리고 평균 급여를 출력
// 열 레이블은 Maximum, Minimum, Sum 그리고 Average 입니다.
// 소수점 에서 결과를 반올림 하세요
SELECT  ROUND(MAX(sal))        "Maximum"
       ,ROUND(MIN(sal))        "Minimum"
       ,ROUND(SUM(sal))        "Sum"
       ,ROUND(AVG(sal))        "Average"
FROM    emp; 


// GROUP BY 절 과 SELECT 절
SELECT  deptno, position, AVG(sal)
FROM    professor
GROUP BY deptno,position;

SELECT  position, AVG(sal), SUM(sal)
FROM    professor
GROUP BY position;


// 단일 컬럼을 이용한 그룹핑
SELECT  deptno ,COUNT(*), COUNT(comm)
FROM    professor
GROUP BY deptno;

select * from professor;

// 다중 컬럼을 이용한 그룹핑
SELECT  deptno, AVG(sal), MIN(sal), MAX(sal)
FROM    professor
GROUP BY deptno;

SELECT  deptno, grade, COUNT(*), ROUND(AVG(weight))
FROM    student
GROUP BY deptno, grade;

// ROLLUP 연산자 --> 소계가 생김 = GROUP BY 절의 그룹 조건에 따라 전체 행을 그룹화 하고 각 그룹에 대해 부분합을 구하는 연산자
SELECT  deptno, SUM(sal)
FROM    professor
GROUP BY ROLLUP(deptno); 

SELECT  deptno, position, COUNT(*)
FROM    professor
GROUP BY ROLLUP(deptno,position);

// CUBE 연산자 = ROLLUP 에 의한 그룹 결과와 GROUP BY 절에 기술도니 조건에 따라 그룹 조합을 만드는 연산자
SELECT  deptno,position,COUNT(*)
FROM    professor
GROUP BY CUBE(deptno,position);

SELECT  deptno,position,COUNT(*)
FROM    professor
GROUP BY deptno,position;

// GROUPING 함수
SELECT  deptno,grade,COUNT(*)
       ,GROUPING(deptno)    grp_dno
       ,GROUPING(grade)     grp_grade
FROM    student
GROUP BY ROLLUP(deptno,grade);

// GROUPING SETS 함수
SELECT deptno,grade,NULL,COUNT(*)
FROM   student
GROUP BY deptno, grade
UNION ALL
select deptno,NULL, TO_CHAR(birthdate,'YYYY'),COUNT(*)
FROM   student
GROUP BY deptno,TO_CHAR(birthdate,'YYYY')
;

SELECT  deptno, grade, TO_CHAR(birthdate, 'YYYY') birthdate,COUNT(*)
FROM    student
GROUP BY GROUPING SETS((deptno,grade),(deptno,TO_CHAR(birthdate,'YYYY')));

// HAVING 절 = GROUP BY 절에 의해 생성된 그룹을 대상으로 조건을 적용
SELECT  grade,COUNT(*),ROUND(AVG(height)) avg_height,
        ROUND(AVG(weight)) avg_weight
FROM    student
GROUP BY grade
ORDER BY avg_height DESC
;

SELECT  grade,COUNT(*),ROUND(AVG(height)) avg_height,
        ROUND(AVG(weight)) avg_weight
FROM    student
GROUP BY grade
HAVING COUNT(*) > 4
ORDER BY avg_height DESC;

// 1000 이상의 급여를 받는 사원들에 대해서만
// 평균 급여가 2700 이상인 부서번호와 평균 급여를 출력하세요
select deptno,round(avg(sal))
from emp
where sal > 1000
having avg(sal) > 2700
group by deptno
;

// 함수의 중첩
SELECT  deptno, AVG(weight)
FROM    student
GROUP BY deptno ;

SELECT MAX(AVG(weight)) max_weight
FROM   student
GROUP BY deptno;


// 조인의 개념
SELECT  studno,name,deptno
FROM    student
WHERE   studno = 10101;

SELECT dname
FROM   department
WHERE  deptno = 101;


SELECT a.studno,a.name,b.deptno,b.dname
FROM   student a, department b
where 1=1
and a.deptno = b.deptno;

// 사원 테이블(emp)과 부서 테이블을 (dept) 조인하여 사원번호, 사원명, 부서번호, 부서위치를 출력
select a.empno,a.ename,a.deptno,b.dname,b.loc
from emp a, dept b
where 1=1
and a.deptno = b.deptno
;
select a.empno,a.ename,a.deptno,b.dname,b.loc
from emp a, dept b
where 1=1
and a.deptno = b.deptno
and b.loc ='DALLAS'
;
SELECT a.profno,a.name,b.dname,b.loc
FROM professor a , department b
where 1=1
and a.deptno = b.deptno
and a.name ='이만식'
;
// 4.학번 ,학생이름, 학년, 학과번호, 학과위치, 지도교수 직급, 지도교수 성함
select a.studno,   
       a.name,     
       a.grade,    
       a.deptno, 
       b.loc,
       c.position,
       c.name
from student a , department b, professor c
where 1=1
and a.deptno = b.deptno
and a.profno =  c.profno;


//5, 전인하, 지은경, 김진경 학생의 학번, 학생이름, 학년, 학과번호, 학과위치 ,지도교수직급, 지도교수 성함을 출력
select a.studno, 
       a.name, 
       a.grade, 
       a.deptno, 
       b.loc,
       c.position,
       c.name   
from student a , department b, professor c
where 1=1
and a.deptno = b.deptno
and a.profno =  c.profno
and a.name in('전인하','지은경','김진경');

// 카티션 곱
SELECT studno,
       name,
       s.deptno,
       d.deptno,
       dname
FROM   student s, department d
;
//EQUI JOIN
SELECT s.studno,s.name,s.deptno,d.dname,d.loc
FROM   student s , department d
WHERE  s.deptno = d.deptno;

//EQUI JOIN - NATURAL JOIN
SELECT s.studno, s.name, deptno, d.dname
FROM   student s
       NATURAL JOIN department d;
       
SELECT p.profno,p.name,deptno,d.dname
FROM   professor p
       NATURAL JOIN department d;
       
//EQUI JOIN - JOIN ~USING
SELECT  s.studno,s.name,deptno,d.dname,d.loc
FROM    student s JOIN department d
        USING (deptno);
        
SELECT  name,dname,loc
FROM    student s, department d
WHERE   s.deptno = d.deptno
AND     name like '김%';

SELECT  s.name, d.dname, d.loc
FROM    student s
        NATURAL JOIN department d
WHERE   name like '김%';

SELECT  name,dname,loc
FROM    student JOIN department
        USING(deptno)
WHERE   name like '김%';

SELECT  name,dname,loc
FROM    student s INNER JOIN department d
ON   s.deptno = d.deptno
AND     name like '김%';


// NON-EQUI JOIN
select  p.profno,p.name,p.sal,s.grade
from    professor p , salgrade s
where   p.sal between s.losal and s.hisal;

// outer join
// 학생 테이블과 교수 테이블을 조인하여 이름, 학년, 지도교수의 이름, 직급을 출력하세요
select a.name,a.grade,b.name,b.position
from student a
left join professor b 
on a.profno = b.profno;

select s.name,s.grade,p.name,p.position
from student s, professor p
where s.profno = p.profno(+)
union
select s.name,s.grade,p.name,p.position
from student s, professor p
where s.profno(+) = p.profno
;

// self join
select dept.dname || '의 소속은' || org.dname
from   department dept, department org
where  dept.college= org.deptno;

select dept.dname || '의 소속은 ' || org.dname
from   department dept JOIN department org
on     dept.college = org.deptno;

// 문제
select a.ename,a.empno,b.ename,b.empno
from emp a, emp b
where a.mgr = b.empno;

// 서브 쿼리의 개념
select name, position
from professor
where position = (
                    select position
                    from   professor
                    where  name='전은지'
                  )
order by name desc;


select a.name,a.position,b.dname,b.loc
from professor a , department b
where a.deptno = b.deptno
and a.position = (
                    select position
                    from   professor
                    where  name='전은지'
                  );
                  
// ace/ace
// 1.Marketing 부서에 근무하는 사원에 대해 이름, 직업 ,부서번호, 부서이름 을 이름 순서로 출력하세요.
select a.first_name, a.last_name, a.job_id,a.department_id,b.department_name 
from employees a ,departments b
where 1=1 
and a.department_id = b.department_id;

// ace/ace
// Toronto 에 근무하는 모든 사원의 정보를 출력하세요.
select a.last_name,a.job_id,a.department_id,b.department_name,c.city
from employees a, departments b , locations c
where 1=1
and a.department_id = b.department_id
and b.location_id = c.location_id
and c.city ='Toronto'
;

// hr/hr
// 관리자 번호가 7780 미만인 모든 사원에 대해 아래 질의 를 작성하세요.
// 관리자#, 관리자별 사원 급여 합계와 총 급여의 합을 출력하세요.
select mgr,sum(sal)
from emp
where mgr < 7788
group by rollup(mgr)
order by mgr;

// 추가하여 관리자#, 관리자별 사원의 job과 급여의 합계, 총 급여의 합을 출력하세요.
select mgr,job,sum(sal)
from emp
where mgr <7788
group by rollup(mgr,job)
order by mgr,job;

// 5. CUBE 연산자를 이용하여 관리자 번호가 7788 미만인 모든 사원에 대해
// 관리자# 및 같은 관리자별 사원 job 과 급여의 합, 관리자별 전체급여,
// 전체 job별 급여의 합을 출력
// CUBE 연산자 = ROLLUP 에 의한 그룹 결과와 GROUP BY 절에 기술도니 조건에 따라 그룹 조합을 만드는 연산자

select mgr,job,sum(sal)
from emp
where mgr <7788
group by CUBE(mgr,job)
