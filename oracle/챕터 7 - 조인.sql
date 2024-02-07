--  조인
--  데이터 조회 : 그래서 알고싶은 정보가 뭔데??  SELECT 
--  알고싶은 정보가 하나의 테이블에 모두 있다!

--    -> 알고싶은 정보가 여러 테이블에 나눠져 있는 경우가 있더라 -> 관계형 데이터베이스의 특징
--     => 조인 : 여러 테이블에서 정보를 알아오고 싶을 때 사용하는 기술

-- 예 : 특정 사원 번호(7788)를 가진 사원의 사원이름, 급여, 부서명, 근무지를 조회하세요
--      사원이름, 급여 : employee
--      부서명, 근무지 : department

--       특정 사원 번호(7788)를 가진 사원의 부서명, 근무지를 조회하세요  => 서브쿼리
DESC department;
SELECT dname, loc
FROM department
WHERE dno = (SELECT dno
                FROM employee
                WHERE eno = 7788);
--------------------------------------------------------------------------------
-- 조인의 가장 단순한 형태 : 카테시안 곱
SELECT * FROM employee;  --14
SELECT * FROM department; --4

SELECT *
FROM employee,department;
---------------------------------------
-- 서로 관련있는 레코드들 끼리 묶어서주는 기술을 조인
--   ANSI 표준화단체에서 제정한 조인 방식
--      : INNER조인(INNER, NATURAL,  JOIN USING~~) , OUTER 조인(LEFT OUTER, RIGHT OUTER, FULL OUTER )
--   ORACLE 전용 조인 방식 (비표준)
--      : EQUI(INNER) , NON EQUI
--------------------------------------------------------------------------------
--- 1. INNER조인 : 두 테이블의 결합기준 :  관계를 형성하는 컬럼을 기준으로 테이블을 결합시키는 방식
SELECT *
FROM employee INNER JOIN department
ON employee.dno = department.dno;

SELECT employee.ename,salary,employee.dno,department.dname,loc
FROM employee INNER JOIN department
ON employee.dno = department.dno
WHERE eno = 7788;

-- 조인시 테이블에 별칭
--    별칭은 30글자까지
--    FROM절에 테이블명 쓰고 공백후 별칭
--    별칭은 해당 쿼리문 내에서만 사용가능
--    별칭을 지정하면 테이블명과 별칭을 혼용할수 없고 무조건 별칭으로 테이블을 지시해야 한다.

SELECT e.ename,salary,e.dno,d.dname,loc
FROM employee e INNER JOIN department d
ON e.dno = d.dno
WHERE eno = 7788;

--  NATURAL 조인 : INNER조인과 같다 그러나 ON 조건을 사용하지 않고, 
--                 '자동적'으로 컬럼의 이름, 데이터유형들을 통해서 
--                 테이블간 관련있는 컬럼을 탐색하고 일치여부를 통해서 조인 시도
SELECT *
FROM employee NATURAL JOIN department;

--  JOIN USING 조인 : INNER조인과 같다
--                    조인의 조건이 되는 컬럼의 이름이 같다면 사용할 있는 방법
--                      USING(일치되는 컬럼명)
SELECT *
FROM employee JOIN department
USING(dno);

--   EQUI 조인 : 오라클 전용
--       INNER 조인과 똑같다. -> 문법이 간단해서 오라클에서 선호되는 조인 기법
SELECT * 
FROM employee e, department d
WHERE e.dno = d.dno
AND e.eno = 7788;

--  SELF 조인 : 개념상 같은 테이블을 두개이상 묶어서 처리해야 하는 경우 
--   사원번호, 사원이름, 상사번호, 상사이름을 조회하세요.
SELECT * FROM employee;
SELECT emp.eno AS "사원번호",
        emp.ename AS "사원 이름",
        emp.manager AS "상사 번호",
        manager.ename AS "상사 이름"
FROM employee emp INNER JOIN employee manager
ON emp.manager = manager.eno;

-- Non Equi 조인 : 오라클 전용  : 두 테이블의 관계되는 컬럼이 비교(<>)에 의해서 조인 결과 데이터를 활용하는 방식
SELECT * FROM salgrade;

--  예 : 사원 급여를 기준으로 사원이름, 급여, 급여등급을 조회합니다.
SELECT ename, salary, grade
FROM employee e, salgrade s
--WHERE e.salary BETWEEN s.losal AND s.hisal;
WHERE e.salary >= s.losal AND e.salary <= s.hisal;

--   다중조인 : 3개 이상 테이블을 조인해서 결과 데이터를 조회할 때 사용하는 조인
--             알고자 하는 정보가 3개 이상의 테이블이 나눠져 있는 경우 사용
-- 예 : 사원번호, 사원이름, 소속부서이름, 급여, 급여등급을 조회하는 쿼리문
-- EQUI, NonEqui 조인
SELECT e.eno, e.ename, d.dname, e.salary, s.grade
FROM employee e, department d, salgrade s
WHERE e.salary BETWEEN s.losal AND s.hisal
AND e.dno = d.dno ;

-- INNER 조인
SELECT e.eno, e.ename, d.dname, e.salary, s.grade
FROM employee e INNER JOIN department d
ON e.dno = d.dno 
INNER JOIN salgrade s
ON e.salary BETWEEN s.losal AND s.hisal;

--------------------------------------------------------------------------------
-- 두테이블의 결합시 한쪽에 데이터가 없는 경우 INNER 조인에서는 없는 데이터를 조회할수 없다.
--  예시 : 
SELECT * FROM department;

--  두 테이블의 결합시 데이터가 없는 경우에도 NULL처리해서 보여주기 위한 기법 Outer 조인
-- 사원 이름과 상관 이름을 출력해 봅시다. 상관이 없는 경우 NULL 표시
SELECT emp.ename AS "사원이름",
       manager.ename AS "상관이름"
FROM employee emp INNER JOIN employee manager
ON emp.manager = manager.eno;

SELECT emp.ename AS "사원이름",
       manager.ename AS "상관이름"
FROM employee emp LEFT OUTER JOIN employee manager --NULL
ON emp.manager = manager.eno;

SELECT d.dno, d.dname, e.ename
FROM department d LEFT OUTER JOIN employee e
ON d.dno = e.dno;

--------------------------------------------------------------------------------
--  OUTER 조인의 경우 오라클 비표준으로는 어떻게?
SELECT emp.ename AS "사원이름",
       manager.ename AS "상관이름"
FROM employee emp, employee manager
WHERE emp.manager = manager.eno;  --  INNER (EQUI)조인

--  NULL표시 되어야 하는 쪽 (+)를 붙인다.
SELECT emp.ename AS "사원이름",
       manager.ename AS "상관이름"
FROM employee emp, employee manager
WHERE emp.manager = manager.eno(+);   -- LEFT OUTER 조인
-- WHERE emp.manager(+) = manager.eno;   RIGHT OUTER  조인

-- 오라클에서도 FULL OUTER JOIN인 경우 그냥 사용
SELECT d.dno, d.dname, e.ename
FROM department d FULL OUTER JOIN employee e
ON d.dno = e.dno;

SELECT * FROM employee;

                