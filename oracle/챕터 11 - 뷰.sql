--  뷰
--    테이블과 비슷하게 생겼지만 실제 데이터가 아닌 
--    테이블에서 조회된 데이터만 보여주는 '가상의 테이블' : 뷰

--  뷰를 사용하는 이유
--   1. 보안 : 사용자 권한을 제어해서 중요 데이터 일부를 차단
--   2. 쿼리를 보다 단순하게 사용하기 위해서.

-- 뷰의 특징
--    - 뷰를 사용하기 위해서 참조하는 테이블을 기본테이블
--    - 뷰는 읽기 전용 사용되지만 데이터를 수정하는 것도 일부 가능
--    - 뷰를 통해서 데이터 수정시 기본테이블에 데이터가 반영
--    - 기본 테이블의 데이터가 변경되어도 뷰에 반영이 된다.

-- 뷰를 생성하는 방법
--    CREATE VIEW 뷰이름
--    AS 서브쿼리;

--  실습을 위한 테이블
CREATE TABLE emp_second
AS
SELECT * FROM employee;

CREATE TABLE depart_secode
AS
SELECT * FROM department;

--  예 :  담당 업무가 SALESMAN인 사원들의 정보를 보여주는 뷰를 만들어 봅시다.
--      컬럼은 사원 번호, 사원이름, 부서번호, 담당업무로 제한
CREATE VIEW v_emp_job(사원번호,사원이름,부서번호,담당업무)
AS
SELECT eno, ename, dno, job
FROM emp_second
WHERE job='SALESMAN';

SELECT * FROM v_emp_job;

--  뷰의 종류
--   단순 뷰 : 하나의 기본 테이블로 생성된 뷰
--   복합 뷰 : 두개 이상의 테이블로 생성된 뷰
--       사용이 제한적이다.

-- 단순 뷰 예제
CREATE VIEW v_emp_job2
AS
SELECT eno, ename, dno, job  -- SELECT로 조회된 컬럼명이 뷰의 컬럼명으로 사용된다.
FROM emp_second
WHERE job='SALESMAN';

SELECT * FROM v_emp_job2;

--  복합 뷰 예제
CREATE VIEW v_emp_complex
AS
SELECT * FROM emp_second NATURAL JOIN depart_secode;

SELECT * FROM v_emp_complex;

--  뷰에 대한 정보 보기  => 데이터 사전
SELECT view_name, text
FROM user_views;

--   뷰가 처리되는 과정
--     1. 뷰가 저장된 데이터사전에서 뷰에 대한 정의 조회
--     2. 기본 테이블에 대한 뷰의 접근 권한을 살펴봄
--     3. 뷰에 대한 질의를 기본테이블에 대한 질의로 변경
--     4. 기본 테이블에 대한 질의를 통해 데이터 검색
--     5. 검색 결과 출력

--------------------------------------------------------------------------------
--  단순 뷰를 통해서 데이터를 삽입 변경 삭제를 할수 있다.
--     뷰를 통해서 DML쿼리를 동작 시키는 경우에는 기본테이블에 데이터가 반영된다.
SELECT * FROM v_emp_job2;

INSERT INTO v_emp_job2
VALUES(9000,'park',30,'SALESMAN');

SELECT * FROM emp_second;

--  뷰가 볼수 없는 컬럼에 제약조건이 NOT NULL인 경우는
-- 뷰를 통해서 INSERT 할수 없다.


-- 뷰를 더이상 사용하지 않는 경우 뷰를 삭제할 수 있다.
DROP VIEW v_emp_job;

--------------------------------------------------------------------------------
-- 다양한 뷰 생성  -> 함수 활용  => 함수의 경우 실제 있는 컬럼이 아니므로 별칭이 반드시 필요하다.
CREATE VIEW v_emp_salary
AS SELECT dno, SUM(salary) AS "sum_sal", AVG(salary)  AS "avg_sal"
FROM emp_second
GROUP BY dno;

SELECT * FROM v_emp_salary;

-- 그룹함수를 이용한 뷰의 경우에는 DML 사용이 불가능하다.
INSERT INTO v_emp_salary
VALUES(40,1000, 750);
--------------------------------------------------------------------------------
--  뷰에 대한 옵션
--  1. 뷰를 변경하기 위한 옵션 : OR REPLACE
-- 뷰를 변경할 때 => ALTER (X)
CREATE OR REPLACE VIEW  v_emp_job2
AS
SELECT eno, ename, dno, job
FROM emp_second
WHERE job = 'MANAGER';

--  2. 기본 테이블 유무와 상관없이 뷰를 만들기 위한 옵션 : FORCE
--      => 기본테이블이 없으면 뷰를 만들어서는 안되므로 기본값 : NOFORCE
CREATE OR REPLACE VIEW v_emp_notable  -- 에러 발생
AS
SELECT eno, ename, dno, job
FROM emp_notable
WHERE job ='MANAGER';

CREATE OR REPLACE FORCE VIEW v_emp_notable  
AS
SELECT eno, ename, dno, job
FROM emp_notable
WHERE job ='MANAGER';

SELECT * FROM v_emp_notable;

--  3.  뷰를 통해서 SELECT만 가능하고 INSERT,UPDATE,DELETE를 불가능 하기 만드는 옵션 : WITH READ ONLY
CREATE OR REPLACE VIEW v_emp_job_readonly
AS
SELECT eno,ename,dno,job
FROM emp_second
WHERE job = 'MANAGER'
WITH READ ONLY;

INSERT INTO v_emp_job_readonly
VALUES(9001,'LEE',30,'MANAGER'); -- 읽기 전용 뷰에는 DML불가

-- 4. DML은 뷰와 상관없이 실제 테이블에 반영된다. 
--      뷰를 통해서 볼수 있는 데이터만 DML을 적용하는 옵션 : WITH CHECK OPTION

CREATE OR REPLACE VIEW v_emp_job_nocheck
AS
SELECT eno, ename, dno, job
FROM emp_second
WHERE job = 'MANAGER';

SELECT * FROM v_emp_job_nocheck;

INSERT INTO v_emp_job_nocheck
VALUES(9200,'JANG',30,'SALESMAN');  
-- 기본 테이블에 정하는 데는 문제가 없지만
-- INSERT가 동작되어도 뷰를 통해서 확인하는 것이 불가능

CREATE OR REPLACE VIEW v_emp_job_check
AS
SELECT eno, ename, dno, job
FROM emp_second
WHERE job = 'MANAGER'
WITH CHECK OPTION;

INSERT INTO v_emp_job_check
VALUES(9300,'HWANG',30,'SALESMAN'); 
--  뷰를 통해서 확인할 수 없는 데이터는 삽입이나 변경이 불가능하다.
INSERT INTO v_emp_job_check
VALUES(9300,'HWANG',40,'MANAGER'); 

SELECT * FROM v_emp_job_check;
















