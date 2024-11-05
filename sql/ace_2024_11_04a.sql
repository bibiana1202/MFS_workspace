
-- 테이블 인스턴스 차트
CREATE TABLE t_dept (
    deptno NUMBER(2) PRIMARY KEY ,
    dname  VARCHAR2(30) NOT NULL ,
    loc    VARCHAR2(10)
);

CREATE TABLE t_emp(
    empno   NUMBER(4)       PRIMARY KEY,
    ename   VARCHAR2(30)    NOT NULL,
    hp      VARCHAR2(11)    UNIQUE,
    sal     NUMBER          CHECK(sal>=100),
    deptno  NUMBER(2)       REFERENCES t_dept (deptno)
--    CONSTRAINT fk_dept FOREIGN KEY (deptno) REFERENCES t_dept (deptno)
);
    

drop table t_emp purge;
drop table t_dept purge;

-- 제약 조건에 이름을 붙인 컬럼 레벨 제약 조건
CREATE TABLE t_dept(
    deptno NUMBER(2)   CONSTRAINT t_dept_deptno_pk PRIMARY KEY,
    dname  VARCHAR2(30)CONSTRAINT t_dept_dname_nn  CHECK(dname is NOT NULL),
    loc    VARCHAR2(10)
    );
    
CREATE TABLE t_emp(
empno  NUMBER(4)    CONSTRAINT t_emp_empmo_pk PRIMARY KEY,
ename  VARCHAR2(30) CONSTRAINT t_emp_ename_pk NOT NULL,
hp     VARCHAR2(11) CONSTRAINT t_emp_hp_uk UNIQUE,
sal    NUMBER       CONSTRAINT t_emp_sal_ck CHECK(sal >= 100),
deptno NUMBER(2)    CONSTRAINT t_emp_deptno_fk REFERENCES t_dept(deptno)
);

-- 테이블 레벨 제약 조건
CREATE TABLE t_dept (
    deptno NUMBER(2),
    dname VARCHAR2(30),
    loc VARCHAR2(10),
    CONSTRAINT t_dept_deptno_pk PRIMARY KEY(deptno),
    CHECK(dname IS NOT NULL)
);

CREATE TABLE t_emp (
    empno NUMBER(4),
    ename VARCHAR2(30),
    hp VARCHAR2(11),
    sal NUMBER,
    deptno NUMBER(2),
    CONSTRAINT t_emp_empno_pk PRIMARY KEY(empno),
    CONSTRAINT t_emp_ename_nn CHECK(ename IS NOT NULL),
    CONSTRAINT t_emp_hp_uk UNIQUE(hp),
    CONSTRAINT t_emp_sal_dc CHECK(sal >= 100),
    CONSTRAINT t_emp_deptno_fk FOREIGN KEY(deptno) REFERENCES t_dept(deptno)
);

--t_dept 테이블 생성
CREATE TABLE t_dept (
deptno NUMBER(2),
dname VARCHAR2(30),
loc VARCHAR2(10)
);

-- t_emp 테이블 생성 
CREATE TABLE t_emp (
    empno NUMBER(4),
    ename VARCHAR2(30),
    hp VARCHAR2(11),
    sal NUMBER,
    deptno NUMBER(2)
);

--PRIMARY KEY 추가 
ALTER TABLE t_dept
ADD CONSTRAINT t_dept_deptno_pk;

--NOT NULL 제약 조건 추가 
ALTER TABLE t_dept
ADD CONSTRAINT t_dept_dname CHECK(dname IS NOT NULL) ;

-- PRIMARY KEY 추가 
ALTER TABLE t_emp
ADD CONSTRAINT t_emp_empno_pk PRIMARY KEY (empno);

--NOT NULL 제약 조건 추가 
ALTER TABLE t_emp
MODIFY CONSTRAINT t_emp_ename_nn CHECK (ename is NOT NULL);

--UNIQUE 제약 조건 추가 
ALTER TABLE t_emp
ADD CONSTRAINT t_emp_hp_uk UNIQUE (hp);

-- CHECK 제약 조건 추가 (급여가 100 이상) 
ALTER TABLE t_emp
ADD CONSTRAINT t_emp_sal_ck CHECK (sal >= 100);

-- FOREIGN KEY 제약 조건 추가 (deptno는 t_dept 테이블의 deptno를 참조) 
ALTER TABLE t_emp
ADD CONSTRAINT t_emp_deptno_fk FOREIGN KEY (deptno)
REFERENCES t_dept (deptno);

alter table t_emp
add (
    jumin1 varchar2(6),
    jumin2 varchar2(7)
);

ALTER TABLE t_emp
MODIFY jumin1 CONSTRAINT t_emp_jumin1_nn NOT NULL;

ALTER TABLE t_emp
MODIFY jumin2 CONSTRAINT t_emp_jumin2_nn NOT NULL;


-- composite index
ALTER TABLE t_emp
ADD CONSTRAINT t_emp_jumin_uk UNIQUE(jumin1, jumin2);

select index_name , column_name, table_name
from all_ind_columns
where table_name = 'T_EMP';

create table emp_dept (
    emp_id  number,
    dept_id number,
    primary key(emp_id,dept_id)
);


// 사원 정보를 조회하는 sql 쿼리를 작성하세요
// employees, jobs, jobs_grade, departments,locations,countries,regios
// 테이블을 ANSI JOIN 방식으로 결합하여,
// 사원명, 사수명, 급여 ,등급, 부서명 정보를 출력할수 있도록 합니다.
select a.first_name      name
      ,b.first_name      name_admin
      ,a.salary          salary
      ,c.grade_level     grade_level
      ,d.department_name department_name
FROM employees a ,employees b , job_grades c, departments d
where 1=1
and a.manager_id = b.employee_id(+)
and a.salary between c.lowest_sal and c.highest_sal
and a.department_id = d.department_id(+) ;


select *
from employees
