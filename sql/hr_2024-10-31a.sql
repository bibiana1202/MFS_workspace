// CHICAHO 에 근무하는 사원들의 사원, 이름, 급여, 부서이름, 위치 출력

SELECT a.empno,a.ename,a.sal,b.dname,b.loc
FROM emp a , dept b
where 1=1
and a.deptno= b.deptno
and b.loc ='CHICAGO'
;

SELECT a.empno,a.ename,a.sal,b.dname,b.loc
FROM emp a
inner join dept b
on 1=1
and a.deptno= b.deptno
and b.loc ='CHICAGO'
;

// = 연산자를 이용한 단일행 서브쿼리
select a.studno , a.name, a.grade ,b.dname
from   student a ,department b 
where  a.grade = (select grade
                from  student
                where userid ='jun123')
and a.deptno = b.deptno;
                
                
// < 연산자를 이용한 단일행 서브쿼리
select  name, deptno, weight
from    student
where   weight < (select  avg(weight)
                  from    student
                  where   deptno = 101)
order by deptno;
                
// 단일행 서브쿼리
select  name,grade,height
from    student
where   grade = (select grade
                 from   student
                 where  studno=20101)
and      height > (select height
                    from  student
                    where studno =20101);
                    
// in 연산자를 이용한 다중 행 서브쿼리
select  name, grade, deptno
from    student
where   deptno in (select deptno
                    from  department
                    where college = 100);
                    
// any 연산자를 이용한 다중 행 서브쿼리
select  studno, name, height
from    student
where   height > any( select height
                      from   student
                      where  grade ='4');
                      
// all 연산자를 이용한 다중 행 서브쿼리
select  studno, name, height
from    student
where   height > all( select height
                      from   student
                      where  grade ='4');
                      
// exists 연산자를 이용한 다중 행 서브쿼리
select  profno, name, sal, comm, sal*nvl(comm,0)
from    professor
where   exists(select  profno
                 from  professor
                where  comm is not null);
                
// not exists 연산자를 이용한 다중 행 서브쿼리
select 1 userud_exist
from dual
where not exists (select userid
                    from student
                   where userid='goodstudent')
;
// pairwise 다중 컬럼 서브 쿼리
select  name,grade,weight
from    student
where   (grade,weight) in (select grade , min(weight)
                             from  student
                             group by grade);
                             
// unpairwise 다중 컬럼 서브쿼리
select  name,grade,weight
from    student
where   grade in (select grade
                    from student
                    group by grade)
and     weight in(select min(weight)
                    from student
                    group by grade);
                    
// 학과별 학생수가 최대인 학과번호와 학생수를출력하세요
select deptno, count(*)
from student
group by deptno;

// 그룹 함수의 조건 HAVING!!
select deptno ,  count(studno)
from student
group by deptno
having count(studno) = (select  max(count(*))
        from student
        group by deptno);
        
// 학과별 학생수가 최대인 학과 번호와 학과 이름, 학과별, 학생수 출력
select a.deptno ,b.dname,count(a.studno)
from student a , department b
where 1=1
and a.deptno = b.deptno
group by a.deptno,b.dname
having count(studno) = (select  max(count(*))
        from student
        group by deptno);
    
    
// 상호 연관 서브 쿼리
select  name, deptno, height
from    student s1
where   height > (select  avg(height)
                    from  student s2
                    where s2.deptno = s1.deptno)
order by deptno;


// 실습
select ename, deptno, sal
from   emp
where (deptno, sal) in ( select deptno,sal
                            from emp
                            where comm is not null);
                            
// 단일 행 입력
insert into student
values(10110,'홍길동','hong','1','8501011143098',sysdate,'041)630-3114',170,70,101,9903);

insert into student
values(10111,'홍길순','hong','1','8501011143098',sysdate,'041)630-3114',170,70,101,9903);

select studno, name
from student
where studno = 10111;

commit;

// 묵시적으로 null 을 입력
desc department;
insert into department(deptno, dname)
values(300,'생명공학부');
select * from department;
commit;

// 명시적으로 null 입력
insert into department
values(301,'환경보건학과','','');
commit;

// 날짜 형식 입력
insert into professor(profno, name, position, hiredate, deptno)
values (9920, '최윤식','조교수',to_date('2006/01/01','YYYY/MM/DD'),102)
;
COMMIT ;
select *
from professor
where profno = 9920;

// SYSDATE 함수를 이용한 현재날짜
insert into professor
values(9910,'백미선','white','전임강사',200,sysdate,10,101);
commit;
select *
from professor
where profno = 9910;

// 단일 테이블에 다중행 입력
create table t_student
as select * from student
where 1=0;

desc t_student;

insert into t_student
select * from student;

select *
from t_student;

commit;


// 다중 행 입력
create table height_info(
studno  number(5),
name    varchar2(10),
height  number(5,2));

create table weight_info(
studno  number(5),
name    varchar2(10),
weight  number(5,2));

insert all
into height_info values (studno,name,height)
into weight_info values (studno,name,weight)
select studno, name, height, weight
from student
where grade >= '2';

commit;


select * from height_info;
select * from weight_info;

delete from height_info;
delete from weight_info;
commit;
rollback;

// 다중 행 입력 - Conditional INSERT ALL 
insert all
when height >170 then
    into height_info values(studno,name,height)
when weight > 70 then
    into weight_info values(studno,name,weight)
select studno, name, height, weight
from student
where grade >= '2';

select * from height_info;
select * from weight_info;

// 다중 행 입력 - conditional first insert
insert first
when height >170 then
    into height_info values(studno,name,height)
when weight > 70 then
    into weight_info values(studno,name,weight)
select studno, name, height, weight
from student
where grade >= '2';

select * from height_info;
select * from weight_info;

// 데이터 수정
select profno, name, position
from   professor
where profno = 9903;

update professor
set position ='부교수'
where profno = 9903;

commit;

// 서브쿼리를 이용한 데이터 수정
select studno, grade, deptno
from   student
where studno = 10201;
select studno, grade, deptno
from   student
where studno = 10203;

update student
set (grade,deptno) = (select grade, deptno
                        from student
                        where studno = 10103)
where studno = 10201;
select studno, grade, deptno
from   student
where studno = 10201;

-- 교수 테이블에서 성연희 교수의 직급과 동일 직급을 가진 교수들 중
-- 현재 급여가 410 이 안되는 교수들의 급여를 12% 인상하세요.

update professor
set sal = sal *1.12
where 1=1
and position =(
                select position
                from professor
                where name ='성연희')
and sal < 410
;

select *
from professor
where 1=1
and position =(
                select position
                from professor
                where name ='성연희')
                
;
commit;

// 단일 행 삭제
delete
from student
where studno = 20103;

commit;

select *
from student
where studno =20103;

// 서브 쿼리를 이용한 데이터 삭제
delete from student
where deptno = (select deptno
                from   department
                where dname='컴퓨터공학과');
                
select *
from student
where deptno = (select deptno
                from   department
                where dname ='컴퓨터공학과');
                
// dallas 에 근무하는 사원들이 몇명인지 홗인
select COUNT(*)
from emp a ,dept b
where a.deptno = b.deptno
and b.loc ='DALLAS';
// 사원 테이블 에서 DALLAS 에 근무하는 사원들을 모두 삭제하세요 (EMP,DEPT)
delete from emp
where deptno =( select deptno
                from   dept
                where  loc ='DALLAS'
                )
;
select COUNT(*)
from emp a ,dept b
where a.deptno = b.deptno
and b.loc ='DALLAS';


// merge 사용
create table professor_temp as
select *
from   professor
where  position ='교수';

select * from professor_temp;

update professor_temp
set position ='명예교수'
where position ='교수';

insert into professor_temp
values(9999,'김도경','arom21','전임강사',200,sysdate,10,101);

merge into professor p 
using professor_temp f
on(p.profno = f.profno)
when matched then
update set p.position = f.position
when not matched then
insert values(f.profno,f.name,f.userid,f.position,f.sal,f.hiredate,f.comm,f.deptno);

select * from professor;


// 시퀀스 생성
create sequence s_seq
increment by 1
start with 1
maxvalue 100;

select min_value, max_value, increment_by, last_number
from   user_sequences
where  sequence_name ='S_SEQ';

alter sequence s_seq maxvalue 20001;

insert into emp
values(s_seq.nextval,'CATHY1','SALESMAX',7698,to_date('17-12-1980','dd-mm-yyyy'),800,NULL,20);

select * from emp;

select s_seq.currval
from dual;

select s_seq.nextval
from dual;

drop sequence s_seq;

// 테이블 생성 방법
create table address
(id number(3),
name varchar2(50),
addr varchar2(100),
phone varchar2(30),
email varchar2(100));

select * from tab;

desc address;

// 서브 쿼리를 이용한 테이블 생성
insert into address
values(1,'HGDONG','SEOUL','123-4567','wew1202@naver.com');
commit;
select * from address;

create table addr_second(id,name,addr,phone,e_mail)
as select * from address;

desc addr_second;

select * from professor3;

create table addr_fourth
as select id, name from address
where 1=2;

desc addr_fourth;

select * from addr_fourth;

// 교수테이블과 동일한 구조와 데이터를 가지는 professor2라는 테이블을 생성해보세요.
create table professor2
as select * from professor;

select * from professor2;

// professor 테이블와 구조가 동일한 professor3 테이블을 생성해보세요. 
create table professor3
as select * from professor
where 1=2;

//  서브 쿼리를 이용한 테이블 생성
create table addr_third
as select id,name from address;

select * from addr_third;

// 테이블에 칼럼 추가
alter table address
add (birth date);

alter table address
add(comments varchar2(200) default 'No Comment');

desc address;

//테이블 칼럼 삭제
alter table address drop column COMMENTS;

desc address;

// 테이블 칼럼 변경
alter table address
modify phone varchar2(50);

alter table address
modify phone varchar2(5);

desc address;

// 테이블 이름 변경
rename addr_second to client_address;

desc dept;

// 테이블 삭제
select * from tab;

drop table addr_third;

select * from tab
where tname='ADDR_THIRD';

// TRUNCATE 명령문
select *
from client_address;

truncate table client_address;
rollback;

// 주석 추가
comment on table address is '고객 주소록을 관리하기 위한 테이블';
comment on column address.name is '고객 이름';

//주석확인하는 방법
select comments
from user_tab_comments
where table_name ='ADDRESS';


//컬럼주석 확인하는 방법
select * from user_col_comments
where table_name='ADDRESS';


COMMENT ON TABLE ADDRESS IS ''; //테이블 주석 삭제

COMMENT ON COLUMN ADDRESS.NAME IS ''; //컬럼 주석 삭제

// User_ 데이터 사전 뷰
select table_name from user_tables;

// ALL_ 데이터 사전 뷰
select owner, table_name from all_tables;

// DBA_데이터 사전뷰
select owner, table_name from dba_tables; // sys로 가야함.

//1. 학생 테이블에서 학번이 20000에서 25000번에 해당하는 학생들을 삭제하세요.
delete
from student
where 1=1
and studno between 20000 and 25000;

select * from student;

//2. STUDNO, NAME, USERID, GRADE 그리고 DEPTNO 열만을 포함하는 STUDENT 테이블의 구조를
//기초로 STUDENT2 테이블을 생성하세요.
create table STUDENT2
as select STUDNO, NAME, USERID, GRADE,DEPTNO from STUDENT
where 1=2;

select * from student2;

//3. STUDNO_SEQ라는 이름의 시퀀스를 생성하세요.
//3-1) 시퀀스는 1에서 시작해야 하고 최대값은 50000, 10씩 증가하는 시퀀스를 가집니다.
create sequence STUDNO_SEQ
increment by 10
start with 1
maxvalue 50000;
//3-2) 생성한 STUDNO_SEQ를 이용하여 STUDENT2 테이블에 데이터를 2개 입력하세요.
select * from emp ;
insert into emp
values(STUDNO_SEQ.nextval,'CATHY2','SALESMAX',7698,to_date('17-12-1980','dd-mm-yyyy'),800,NULL,20);

//4. 교수 테이블에서 백미선 교수의 아이디를 black로 변경해 보세요.
update professor
set userid ='black'
where name ='백미선';
select * from professor;

// 5. 사원 테이블을 조회하여 각 부서별로 최대 급여를 받는 사원들의 부서번호, 이름 ,급여를 출력하세요
select deptno,max(sal)
from emp
group by deptno;

select * from emp;

select deptno,ename,sal
from emp
where (deptno,sal) in ( select deptno,max(sal)
                        from emp
                        group by deptno
)
;
// 6. 각학과별로 입사일이 오래된 교수의 교수번호와 이름, 입사일, 학과명을 출력하세요.(입사일순으로 정렬하세요)
select a.profno,a.name,a.hiredate,b.dname
from professor a , department b
where 1=1
and (a.deptno,a.hiredate) in (
                            select deptno,min(hiredate)
                            from professor
                            group by deptno
                          )
and a.deptno = b.deptno
order by a.hiredate;

select deptno,min(hiredate)
from professor
group by deptno;


//롤 생성
create role hr_clerk;
create role hr_mgr
identified by manager;

grant select, insert, delete on hr.student to hr_clerk;

grant create session to hr_mgr;

