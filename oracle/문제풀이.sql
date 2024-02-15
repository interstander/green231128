-- 문제 풀이
--  [01] 데이터 조회
--  1. 덧셈 연산을 이용하여 모든 사원에 대하여 $300의 급여 인산을 계산한 후 사원의 이름,급여, 인상된 급여를 출력하세요.
SELECT ename, salary, salary+300
FROM GREEN.employee;

--2. 사원의 이름, 급여, 연간 총수입을 총수입이 많은 것 부터 작은 순으로 출력하세요.
--연간 총수입은 월급에*12를 한 후 $100의 상여금을 더해서 계산하세요.
SELECT ename, salary, salary*12+100 AS "연간 총수입"
FROM employee
ORDER BY "연간 총수입" DESC;

--3. 급여가 2000이 넘는 사원의 이름과 급여를 급여가 많은 것부터 작은 순으로 출력하세요
SELECT ename, salary
FROM employee
WHERE salary >= 2000
ORDER BY salary DESC;

--4. 사원 번호가 7788인 사원의 이름과 부서번호를 출력하세요
SELECT ename,dno
FROM employee
WHERE eno = 7788;

--5. 급여가 2000에서 3000사이에 포함되지 않는 사원의 이름과 급여를 출력하세요
SELECT ename,salary
FROM employee
WHERE salary < 2000 OR salary > 3000;

SELECT ename,salary
FROM employee
WHERE salary NOT BETWEEN 2000  AND 3000;


--6. 1981년2월20일 부터 1981년5월1일 사이에 입사한 사원의 이름, 담당업무, 입사일을출력하세요.
SELECT ename, job, hiredate
FROM employee
WHERE hiredate BETWEEN TO_DATE('1981/02/20') AND TO_DATE('1981/05/01');

SELECT ename, job, hiredate
FROM employee
WHERE hiredate >= '1981/02/20' AND hiredate <= TO_DATE('1981/05/01');

--숫자, 문자, 날짜
--문자 -> 날짜 : TO_DATE()
--날짜 -> 문자 : TO_CHAR()
--문자 -> 숫자 : TO_NUMBER()
--숫자 -> 문자 : TO_CHAR()


--7. 부서 번호가 20 및 30에 속하는 사원의 이름과 부서번호를 출력하되 이름을 내림차순으로 영문자순으로 출력하세요.
SELECT ename, dno
FROM employee
WHERE dno = 20 OR dno=30
ORDER BY ename DESC;

SELECT ename, dno
FROM employee
WHERE dno IN (20,30)
ORDER BY ename DESC;



--8. 사원 급여가 2000에서 3000사이에 포함되고 
-- 부서번호가 20 또는 30인 사원의 이름과 급여와 부서번호를 출력하되 
-- 이름을 오름차순으로 출력하세요
SELECT ename,salary, dno
FROM employee
WHERE (salary BETWEEN 2000 AND 3000) 
AND (dno=20 OR dno=30)
ORDER BY ename ASC;

SELECT ename,salary, dno
FROM employee
WHERE (salary >= 2000 AND salary <= 3000) 
AND (dno IN (20,30))
ORDER BY ename ASC;



--9. 1981년도에 입사한 사원의 이름과 입사일을 출력하세요(LIke연산자 와 와일드카드사용)
-- 메뉴[도구] -> 환경설정 -> 데이터베이스 ->NLS -> 날짜 형식 년도 RRRR  => '1981~~'
-- 메뉴[도구] -> 환경설정 -> 데이터베이스 ->NLS -> 날짜 형식 년도 RR  => '81~~'
SELECT ename, hiredate
FROM employee
WHERE hiredate LIKE '1981%';  --날짜 형식 년도 RRRR

SELECT ename, hiredate
FROM employee
WHERE hiredate LIKE '81%'; --날짜 형식 년도 RR

--10. 관리자가 없는 사원의 이름과 담당업무를 출력하세요
SELECT * FROM employee;

SELECT ename, job
FROM employee
WHERE manager is null;



--11. 커미션을 받을 수 있는 자격이 되는 사원의 이름, 급여, 커미션을 출력하되 급여 및 커미션을 기준으로 내림차순으로 정렬하여 출력하세요
SELECT ename, salary, commission
FROM employee
WHERE commission is not null
ORDER BY salary DESC, commission DESC;

--12. 이름의 세번째 문자가 R인 사원을 출력하세요
SELECT *
FROM employee
WHERE ename LIKE '__R%';


--13. 이름에 A 와 E를 모두 포함하는 사원이 이름을 출력하세요.
SELECT ename
FROM employee
WHERE ename LIKE '%A%'
AND ename LIKE '%E%';


--14. 담당업무가 사무원(CLERK) 또는 영업사원(SALESMAN)이면서 
-- 급여가 $1600, $950 또는 $1300이 아닌 사원의 이름 담당업무, 급여를 출력하세요
SELECT ename, job, salary
FROM employee
WHERE job IN ('CLERK','SALESMAN')
AND (salary <> 1600 AND salary <> 950 AND salary <> 1300);

SELECT ename, job, salary
FROM employee
WHERE (job = 'CLERK' OR job = 'SALESMAN')
AND (salary NOT IN (1600,950,1300));


--15. 커미션이 $500이상인 사원의 이름과 급여 및 커미션을 출력하세요.
SELECT ename, salary, commission
FROM employee
WHERE commission >=500;

---------------------------------------------------------------------------------------------------
-- [02] 함수
--
--1. SUBSTR 함수를 사용하여 사원들의 입사한 년도와 입사한 달만 출력하세요
SELECT ename, SUBSTR(hiredate,1,4) AS "입사년도" ,SUBSTR(hiredate,6,2) AS "입사월"   --   1981/02/03
FROM employee;


--2. SUBSTR 함수를 사용하여 4월에 입사한 사원을출력하세요
SELECT* 
FROM employee
WHERE SUBSTR(hiredate,6,2) = '04';


--3. MOD 함수를 사용하여 사원번호가 짝수인 사람만 출력하세요
SELECT * 
FROM employee
WHERE MOD(eno,2)=0;


--4. 입사일을연도는2자리(YY), 월은 숫자(MON)로표시하고요일은 약어(DY)로 지정하여출력하세요.
SELECT TO_CHAR(hiredate,'YY/MM/DD DY')
FROM employee;


--5. 올해 며칠이 지났는지출력하세요. 현재 날짜에서 올해1월1일을 뺀 결과를 출력하고 TO_DATE 함수를 사용하여 데이터 형을 일치시키시오.
SELECT NUMTODSINTERVAL(sysdate-TO_DATE('2024/01/01'),'DAY')
FROM dual;


--6. 사원들의 상관 사번을 출력하되 상관이 없는 사원에 대해서는 NULL 대신에0을 출력하세요.
SELECT eno,ename, NVL(manager,0) AS "상관번호"
FROM employee;

SELECT eno,ename, NVL2(manager,manager,0) AS "상관번호"
FROM employee;

--7. DECODE 함수로 직급에 따라 급여를 인상하도록 하세요. 
--직급이'ANAIYST'인 사원은200, 'SALESMAN'인 사원은180, 'MANAGER'인 사원은150,'CLERK'인 사원은100을 인상하세요
SELECT eno,ename,job,salary,
    DECODE(job,'ANALYST',salary+200
              ,'SALESMAN',salary+180
              ,'MANAGER',salary+150
              ,'CLERK',salary+100
              ,salary) AS "인상된 급여"
FROM employee;

--------------------------------------------------------------------------------
-- [챕터3 테이블 제어 문제]
--1. 다음 표에 명시된 대로 DEPT 테이블을 생성하세요
--    | 칼럼명  | 데이터타입  | 크기 |
--    | --- | --- | --- |
--    | dno  | number  | 2 |
--    | dname  | varchar2  | 14 |
--    | location | varchar2  | 13 |
--    |  |  |  |
CREATE TABLE dept(
    dno NUMBER(2),
    dname VARCHAR2(14),
    location VARCHAR2(13)
);
DESC dept;


--2. 다음 표에 명시된 대로 EMP 테이블을 생성하세요.
--    | 칼럼명  | 데이터타입  | 크기 |
--    | --- | --- | --- |
--    | eno  | number  | 4 |
--    | ename  | varchar2  | 10 |
--    | dno  | number  | 2 |
CREATE TABLE emp(
    eno NUMBER(4),
    ename VARCHAR2(10),
    dno NUMBER(2)
);
DESC emp;

--3. 긴 이름을 저장할 수 있도록 EMP 테이블을 수정하세요.
--    | 칼럼명  | 데이터타입  | 크기 |
--    | --- | --- | --- |
--    | eno  | number  | 4 |
--    | ename  | varchar2  | 25 |
--    | dno  | number  | 2 |
ALTER TABLE emp
    MODIFY ename VARCHAR2(25);
    
    
--4. EMPLOYEE 테이블을 복사해서 EMPLOYEE2란 이름의 테이블을 생성하되 
-- 사원번호, 이름, 급여, 부서번호 칼럼만 복사하고 
--새로 생성된 칼럼명을 각각 EMP_ID, NAME, SAL, DEPT_ID 로 지정하세요.
CREATE TABLE employee2
AS SELECT eno AS "emp_id",
          ename AS "name",
          salary AS "sal",
          dno AS "dept_id"
    FROM employee
DESC employee2;

--5. EMP 테이블을 삭제하세요
DROP TABLE emp;

--6. EMPLOYEE2 테이블의 이름을 EMP로 변경하세요
RENAME employee2 TO emp;
DESC employee2;
DESC emp;
--7. DEPT 테이블에서 DNAME 칼럼을 제거하세요
ALTER TABLE dept
    DROP COLUMN dname;
DESC dept;

--8. DEPT 테이블에서 LOC칼럼을 UNUSED로 표시하세요.
ALTER TABLE dept
    SET UNUSED(location);
DESC dept;

--9. UNUSED 칼럼을 모두 제거하세요
ALTER TABLE dept
    DROP UNUSED COLUMNS;
DESC dept;

---------------------------------------------------------------------------------
-- 그룹함수
-- 1. 모든 사원의 급여 최고액, 최저액, 총액 및 평균급여를 출력하세요. 
-- 칼럼의 명칭은 최고액(Maximun) 최저액(Minimun), 총액(Sum), 평균 급여(Average)로 지정하고 
-- 평균에 대해서는 정수로 반올림 하세요.
SELECT
    MAX(salary) AS "Maximun",
    MIN(salary) AS "Minimun",
    SUM(salary) AS "Sum",
    ROUND(AVG(salary)) AS "Average"
FROM employee;



-- 2. 각 담당업무 유형별로 급여 최고액, 최저액, 총액 및 평균액을 출력하세요. 
-- 칼럼의 명칭은 최고액(Maximun) 최저액(Minimun), 총액(Sum), 평균 급여(Average)로 지정하고 
-- 평균에 대해서는 정수로 반올림 하세요.
SELECT job AS "담당업무",
    MAX(salary) AS "Maximun",
    MIN(salary) AS "Minimun",
    SUM(salary) AS "Sum",
    ROUND(AVG(salary)) AS "Average"
FROM employee
GROUP BY job;

-- 3. Count(*)함수를 이용해서 담당업무가 동일한 사원의 수를 출력하세요
SELECT job, COUNT(*)
FROM employee
GROUP BY job;


-- 4. 관리자의수를 나열하세요. 칼럼의 별칭은 COUNT(MANAGER)로 출력하세요
SELECT COUNT(DISTINCT manager) AS "COUNT(MANAGER)"
FROM employee;


-- 5. 급여 최고액, 급여 최저액의 차액을 출력하세요.
SELECT MAX(salary)-MIN(salary) AS "최대 최소 차액"
FROM employee;



-- 6. 직급별 사원의 최저 급여를 출력하세요. 
-- 관리자를 알 수 없는 사원 및 최저 급여가 2000미만인 그룹은 제외시키고 
-- 급여에 대한 내림차순으로 정렬하여 출력하세요
SELECT job, MIN(salary)
FROM employee
WHERE manager IS NOT null
GROUP BY job
HAVING NOT (MIN(salary) < 2000)
ORDER BY MIN(salary) DESC;



-- 7. 각 부서에 대해 부서번호, 사원수, 부서내의 모든 사원의 평균급여를 출력하시오, 
-- 칼럼의 별칭은 부서번호(DNO), 사원수(Number of PeoPle), 평균급여(Salary)로 지정하고 
-- 평균 급여는 소수점2째자리에서 반올림 하세요.
SELECT dno, 
       COUNT(*) AS "Number of PeoPle", 
       ROUND(AVG(salary),1) AS "Salary"
FROM employee
GROUP BY dno;



-- 8. 각 부서에 대해 부서번호 부서이름, 지역명, 사원수, 부서내의 모든 사원의 평균 급여를 출력하시오. 
-- 칼럼의 별칭은 부서번호 이름(DName), 지역명(Location), 사원수(Number of PeoPle), 평균급여(Salary)로 지정하고 
-- 평균급여는 정수로 반올림하세요.
SELECT * FROM employee;
SELECT * FROM department;

SELECT dno,
       DECODE(dno,10,'ACCOUNTING',
                  20,'RESEARCH',
                  30,'SALES',
                  40,'OPERATIONS',
                  NULL) AS "DName",
        DECODE(dno,10,'NEW YORK',
                   20,'DALLAS',
                   30,'CHICAGO',
                   40,'BOSTON',
                   NULL) AS "Location",
        COUNT(*) AS "Number of PeoPle",
        ROUND(AVG(salary)) AS "Salary"
FROM employee
GROUP BY dno;


-- 9. 업무를 표시한 다음 해당 업무에 대해 부서번호별 급여 및 부서10,20,30의 급여 총액을 각각 출력하시오. 
-- 각 칼럼의 별칭은 각각 job, 부서10,부서20, 부서30, 총액으로 지정하세요.
SELECT dno,job,
        DECODE(dno,10,SUM(salary)) AS "부서10",
        DECODE(dno,20,SUM(salary)) AS "부서20",
        DECODE(dno,30,SUM(salary)) AS "부서30",
        SUM(salary) AS "급여 총액"
FROM employee
GROUP BY dno, job
ORDER BY dno, job;

---------------------------------------------------------------------------------
-- 데이터 조작
--1. Employee 테이블의 구조만 복사하여 EMP_INSERT란 빈 테이블을 만드세요.
CREATE TABLE emp_insert
AS SELECT * FROM employee WHERE 1=0;

DESC emp_insert;
SELECT * FROM emp_insert;

--2. 본인을 EMP_INSERT 테이블에 추가하되 SYSDATE를 이용해서 입사일을 오늘로 입력하세요
INSERT INTO emp_insert
VALUES(1,'홍길동','teacher',null,sysdate,1000,250,10);

SELECT * FROM emp_insert;

--3. EMP_INSERT 테이블에 옆사람을 추가하되 TO_DATE함수를 사용해서 입사일을 어제로 입력하세요
INSERT INTO emp_insert
VALUES(2,'박길동','Student',null,TO_DATE(sysdate-1,'YYYY/MM/DD'),800,100,10);

--4. Employee 테이블의 구조와 내용을 복사하여 EMP_COPY란 이름의 테이블을 만드세요.
CREATE TABLE emp_copy
AS SELECT * FROM employee;

DESC emp_copy;
SELECT * FROM emp_copy;

--5. 사원번호가 7788인 사원의 부서번호를 10으로 수정하세요.
UPDATE emp_copy 
SET dno = 10 
WHERE eno=7788; 

--6. 사원번호가 7788의 담당업무및 급여를 사원번호 7499의 담당 업무및 급여와 일치하도록 갱신하세요.(=> 서브 쿼리)

--7. 사원번호 7369와 업무가 동일한 모든 사원의 부서번호를 사원7369의 현재 부서번호로 갱신하세요.(=> 서브 쿼리)

--8. Department 테이블의 구조와 내용을 복사하여 DEPT_COPY란 이름의 테이블을 만드세요
CREATE TABLE dept_copy
AS SELECT * FROM department;

DESC dept_copy;
SELECT * FROM dept_copy;

--9. DEPT_COPY 테이블에서 부서명이 RESEARCH인 부서를 제거하세요.
DELETE FROM dept_copy WHERE dname='RESEARCH';

--10. DEPT_COPY 테이블에서 부서번호가 10이거나 40인 부서를 제거하세요
DELETE FROM dept_copy WHERE dno IN (10, 40);
DELETE FROM dept_copy WHERE dno=10 OR dno=40;


---------------------------------------------------------------------------------
-- [서브 쿼리]
-- 1. 사원 번호가 7788인 사원과 담당업무가 같은 사원을 표시(사원이름과 담당업무)하세요.
SELECT ename, job
FROM employee
WHERE job = (SELECT job 
                FROM employee
                WHERE eno = 7788);

-- 2. 사원번호가 7499인 사원보다 급여가 많은 사원을 표시(사원이름과 담당업무)하세요
SELECT ename, job
FROM employee
WHERE salary >= (SELECT salary
                    FROM employee
                    WHERE eno = 7499);


-- 3. 최소 급여를 받는 사원의 이름, 담당업무및 급여를 표시하세요(그룹함수)
SELECT ename, job, salary
FROM employee
WHERE salary = (SELECT MIN(salary)
                    FROM employee);


-- 4. 평균 급여가 가장 적은 업무를 찾아 직급과 평균 급여를 표시하세요
SELECT job, ROUND(AVG(salary))
FROM employee
GROUP BY job
HAVING ROUND(AVG(salary)) = (SELECT MIN(ROUND(AVG(salary)))
                                FROM employee
                                GROUP BY job);



-- 5. 각 부서의 최소급여를 받는 사원 이름, 급여, 부서번호를 표시하세요.
SELECT ename, salary, dno
FROM employee
WHERE salary = ANY (SELECT MIN(salary)
                    FROM employee
                    GROUP BY dno);

SELECT ename, salary, dno
FROM employee
WHERE salary IN (SELECT MIN(salary)
                    FROM employee
                    GROUP BY dno);
                    
-- 6. 담당업무가 분석가(ANALYST)인 사원보다 급여가 적으면서 
-- 업무가 분석가(ANALYST)아닌 사원(사원번호, 이름, 담당업무, 급여)들을 표시하세요.
SELECT eno, ename, job, salary
FROM employee
WHERE salary < (SELECT DISTINCT salary 
                    FROM employee
                    WHERE job = 'ANALYST')
AND job <> 'ANALYST';


-- 7. 매니저 없는 사원의 이름을 표시하세요.
SELECT ename
FROM employee
WHERE eno = (SELECT eno
                FROM employee
                WHERE manager is null);

SELECT ename
FROM employee
WHERE manager is null;
-- 8. 매니저 있는 사원의 이름을 표시하세요.
SELECT ename
FROM employee
WHERE manager IS NOT null;


-- 9. BLAKE와 동일한 부서에 속한 사원의 이름과 입사일을 표시하는 질의를 작성하세요.
--  (단 BLAKE는 제외)
SELECT ename hiredate
FROM employee
WHERE dno = (SELECT dno 
                FROM employee
                WHERE ename='BLAKE')
AND UPPER(ename) <> 'BLAKE';


-- 10. 급여가 평균보다 많은 사원들의 사원번호와 이름을 표시하되 
-- 결과를 급여에 대한 오름차순으로 정렬하세요.
SELECT eno, ename, salary
FROM employee
WHERE salary >= (SELECT AVG(salary)
                    FROm employee)
ORDER BY salary ASC;



-- 11. 이름에 K가 포함된 사원과 같은 부서에서 일하는 사원의 사원번호와 이름을 
-- 표시하는 질의를 작성하세요.
SELECT eno, ename
FROM employee
WHERE dno = ANY (SELECT dno
                FROM employee
                WHERE ename LIKE '%K%');

SELECT eno, ename
FROM employee
WHERE dno IN (SELECT dno
                FROM employee
                WHERE ename LIKE '%K%');
                
-- 12. 부서위치가 DALLAS인 사원의 이름과 부서번호 및 담당업무를 표시하세요.
SELECT ename, dno, job
FROM employee
WHERE dno =  (SELECT dno
                FROM department
                WHERE loc = 'DALLAS');

SELECT ename, e.dno, job
FROM employee e, department d
WHERE e.dno = d.dno
AND loc = 'DALLAS';


-- 13. KING에게 보고하는 사원의 이름과 급여를 표시하세요
SELECT ename, salary, job, dno
FROM employee
WHERE manager = (SELECT eno
                    FROM employee
                    WHERE ename = 'KING');


-- 14. RESEARCH 부서의 사원에 대한 부서번호, 사원번호 및 담당업무를 출력하세요
SELECT eno, ename, dno, job
FROM employee
WHERE dno =  (SELECT dno
                FROM department
                WHERE dname = 'RESEARCH');
                
SELECT eno, ename, e.dno, job
FROM employee e, department d
WHERE e.dno = d.dno
AND dname = 'RESEARCH';

-- 15. 평균 급여보다 많은 급여를 받고 (이름에서 M이 포함된 사원과 같은 부서에서) 근무하는 
-- 사원의 사원번호, 이름, 급여를 출력하세요.
SELECT eno, ename, salary
FROM employee
WHERE salary >= (SELECT AVG(salary)
                    FROM employee)
AND dno = ANY (SELECT dno
                FROM employee
                WHERE ename LIKE '%M%');


-- 16. 평균급여가 가장 적은 업무를 찾으세요
SELECT job, AVG(salary)
FROM employee
GROUP BY job
HAVING AVG(salary) = (SELECT MIN(AVG(salary))
                        FROM employee
                        GROUP BY job);

-- 17. 부하직원을 가진 사원의 사원번호와 이름을 출력하세요
SELECT eno, ename
FROM employee
WHERE eno = ANY (SELECT manager
                    FROM employee);

--------------------------------------------------------------------------------
-- [조인]
-- 1. Equi조인을 사용하여 SCOTT 사원의 부서번호와 부서 이름을 출력하세요.
SELECT d.dno, d.dname
FROM employee e, department d
WHERE e.dno = d.dno
AND e.ename = 'SCOTT';

SELECT dno, dname
FROM department
WHERE dno = (SELECT dno
                FROM employee
                WHERE ename = 'SCOTT');


-- 2. Inner 조인과 on연산자를 사용하여 사원이름과 함께 
-- 그 사원이 소속된 부서이름과 지역명을 출력하세요.
SELECT e.ename, d.dname, d.loc
FROM employee e INNER JOIN department d
ON e.dno = d.dno;


-- 3. INNER 조인 Using 연산자를 사용하여 10번 부서에 속하는 
-- 모든 담당업무의 고유 목록을 부서의 지역명을 포함하여 출력하세요.
SELECT job, dname
FROM employee INNER JOIN department
USING(dno)
WHERE dno = 10;

-- 4. Natural 조인을 사용하여 커미션을 받는 모든 사원의 이름, 부서이름, 지역명을 출력하세요.
SELECT ename, dname, loc
FROM employee NATURAL JOIN department
WHERE commission IS NOT null;


-- 5. Equal 조인과 Wild카드를 사용해서 이름에 A가 포함된 모든 사원의 이름과 부서명을 출력하세요.
SELECT ename, dname
FROM employee e, department d
WHERE e.dno = d.dno
AND ename LIKE '%A%'; 

-- 6. Natural 조인을 사용하여 NEW York에 근무하는 모든 사원의 이름, 업무 부서번호및 부서명을 출력하세요.
SELECT ename, job, dno, dname
FROM employee NATURAL JOIN department
WHERE loc = 'NEW YORK';


-- 7. Self Join을 사용하여 사원의 이름및 사원 번호를 관리자 이름 및 관리자 번호와 함께 출력하세요. 
-- 각 열의 별칭은 사원이름(Employee) 사원번호(emp#) 관리자이름(Manager) 관리자번호(Mgr#)로 출력하세요
SELECT emp.ename AS "Employee",
        emp.eno AS "emp#",
        manager.ename AS "Manager",
        manager.eno AS "Mgr#"
FROM employee emp, employee manager
WHERE emp.manager = manager.eno;


-- 8. Outter 조인 self 조인을 사용하여 관리자가 없는 사원을 포함하여 
-- 사원번호를 기준으로 내림차순 정렬하여 출력하세요 
-- 각 열의 별칭은 사원이름(Employee)사원번호(emp#) 관리자이름(Manager) 관리자번호(Mgr#)로 출력하세요
SELECT emp.ename AS "Employee",
        emp.eno AS "emp#",
        manager.ename AS "Manager",
        manager.eno AS "Mgr#"
FROM employee emp, employee manager
WHERE emp.manager = manager.eno(+)
ORDER BY emp.eno DESC;

-- 9. Self 조인을 사용하여 지정한 사원(SCOTT)과 같은 부서에서 근무하는 사원 정보(이름, 부서번호)를 출력하세요 
-- 각 열의 별칭은 이름, 부서번호, 동료로 지정하세요(X)
SELECT ename , dno
FROM employee
WHERE dno = (SELECT dno
                FROM employee
                WHERE ename = 'SCOTT');
                
SELECT me.ename AS "이름",
       me.dno AS "부서번호",
       other.ename AS "동료"
FROM employee me , employee other
WHERE me.dno = other.dno
AND me.ename = 'SCOTT'
AND other.ename <> 'SCOTT';


-- 10. Self 조인을 사용하여 WARD 사원보다 늦게 입사한 사원의 이름과 입사일을 출력하세요.
SELECT other.ename, other.hiredate
FROM employee me, employee other
WHERE me.hiredate < other.hiredate
AND me.ename = 'WARD';

-- 11. Self 조인을 사용하여 관리자보다 먼저 입사한 모든 사원의 이름 및 입사일을 
-- 관리자의 이름 및 입사입과 함께 출력하세요. 
-- 각 열의 별칭은 사원이름(Ename) 사원입사일(HIREDATE) 관리자 이름(Ename) 관리자 입사입(HIERDATE)로 출력하세요
SELECT emp.ename AS "EMPLOYEE",
        emp.hiredate AS "E_HIREDATE",
        manager.ename AS "MANAGER",
        manager.hiredate  AS "M_HIREDATE"
FROM employee emp , employee manager
WHERE emp.manager = manager.eno
AND emp.hiredate <= manager.hiredate;

--------------------------------------------------------------------------------
-- [무결성과 제약조건]
-- 1. Employee테이블의 구조를 복사하여 emp_sample란 이름의 테이블을 만드세요 
-- 사원테이블의 사원 번호칼럼에 테이블 레벨로 primary key 제약조건을 지정하되 
-- 제약조건 이름은 my_emp_pk로 지정하세요.
CREATE TABLE emp_sample
AS SELECT * FROM employee WHERE 0=1;

ALTER TABLE emp_sample
    ADD CONSTRAINT my_emp_pk PRIMARY KEY(eno);


-- 2. department 테이블의 구조를 복사하여 dept_sample이란 테이블을 만드세요. 
-- dept_sample의 부서번호 칼럼에 테이블 레벨로 primary key 제약조건을 지정하되 
-- 제약조건 이름은 my_dept_pk로 지정하세요.
CREATE TABLE dept_sample
AS SELECT * FROM department WHERE 0=1;

ALTER TABLE dept_sample
    ADD CONSTRAINT my_dept_pk PRIMARY KEY(dno);


-- 3. 사원 테이블의 부서번호 칼럼에 존재하지 않는 부서의 사원이 배정되지 않도록 
-- 외래키 제약조건을 지정하되 제약조건 이름은 my_emp_dept_fk로 지정하세요.
ALTER TABLE emp_sample
    ADD CONSTRAINT my_emp_dept_fk FOREIGN KEY(dno) REFERENCES dept_sample(dno);


-- 4. 사원 테이블의 커미션 컬럼에 0보다 큰 값만을 입력할 수 있도록 제약조건을 지정하세요
ALTER TABLE emp_sample
    ADD CONSTRAINT emp_comm_min CHECK(commission>0);
    
SELECT * FROM user_CONSTRAINTS;

--------------------------------------------------------------------------------
-- [시퀀스와 인덱스]

-- 1. 사원 테이블의 사원번호가 자동으로 생성되도록 시퀀스를 생성하시오. 
-- (시작값: 1, 증가값:1 최대값:100000)
CREATE SEQUENCE emp01_seq
START WITH 1
INCREMENT BY 1
MAXVALUE 100000
NOCACHE;
--테이블 생성 (emp01)
--| 컬럼명    | 자료형    | 크기 |
--| ---      | ---      | ---  |
--| empno    | number   | 4    |
--| ename    | varchar2 | 10   |
--| hiredate | date     |      |
CREATE TABLE emp01(
    empno NUMBER(4),
    ename VARCHAR2(10),
    hiredate DATE
);

-- 2. 사원번호를 시퀀스로부터 발급받아서 위쪽 테이블에 데이터를 입력하세요.
--    
--    1)사원 이름: Julia, 입사일: sysdate
--    2)사원 이름: Alice 입사입: 2020/12/31
INSERT INTO emp01
VALUES(emp01_seq.nextval,'Julia',sysdate);
INSERT INTO emp01
VALUES(emp01_seq.nextval,'Alice',TO_DATE('2020/12/31','YYYY/MM/DD'));

SELECT * FROM emp01;
--  1. EMP01 테이블의 이름 칼럼을 인덱스로 설정하되 
-- 인덱스 이름을 IDX_EMP01_EName로 지정하세요
CREATE INDEX  idx_emp01_ename
ON emp01(ename);

--------------------------------------------------------------------------------
-- [뷰 => 데이터 조회(SELECT)]
-- 1. 20번 부서에 소속된 사원의 사원번호와 이름, 부서번호를 출력하는 SELECT문을 하나의 뷰(v_em_dno) 로 정의하세요.
CREATE OR REPLACE VIEW v_em_dno
AS
SELECT eno, ename, dno
FROM employee
WHERE dno = 20;

SELECT * FROM v_em_dno;

-- 2. 이미 생성된 뷰(v_em_dno)에 대해서 급여와 담당업무 역시 출력할 수 있도록 수정하세요.
CREATE OR REPLACE VIEW v_em_dno
AS
SELECT eno, ename, dno, salary, job
FROM employee
WHERE dno = 20;

-- 3. 담당업무별로 최대급여, 최소급여, 급여 총액을 보여주는 뷰(EMP_group_job)를 생성한 다음 조회 해봅시다.
CREATE OR REPLACE VIEW emp_group_job
AS
SELECT job, MAX(salary) AS "최대급여", MIN(salary) AS "최소급여", SUM(salary) AS "급여 총액"
FROM employee
GROUP BY job;

SELECT * FROM emp_group_job;


-- 4. 이미 생성된 뷰(v_em_dno)를 통해서 접근가능한 데이터만 입력가능하도록 제약을 걸어 봅시다
CREATE OR REPLACE VIEW v_em_dno
AS
SELECT eno, ename, dno, salary, job
FROM employee
WHERE dno = 20 WITH CHECK OPTION;


-- 5. 다음 데이터를뷰(v_em_dno) 를 통해서 입력을 한뒤 뷰(EMP_group_job)를 통해서 조회 해본다
    
    
--    | eno   | ename   | dno | salary |  job     |
--    | ----- | ------- | --- | ------ | -------- |
--    | 5100  | belita  | 10  | 1500   | CLERK    |
--    | 5200  | erica   | 20  | 2300   | ANALYST  |
--    | 5300  | kali    | 30  | 1750   | SALESMAN |
--    | 5400  | mia     | 20  | 950    | ANALYST  |
--    | 5500  | zinna   | 10  | 1050   | CLERK    |
INSERT INTO v_em_dno
VALUES(5100,'belita',10,1500,'CLERK');
INSERT INTO v_em_dno
VALUES(5200,'erica',20,2300,'ANALYST');
INSERT INTO v_em_dno
VALUES(5300,'kali',30,1750,'SALESMAN');
INSERT INTO v_em_dno
VALUES(5400,'mia',20,950,'ANALYST');
INSERT INTO v_em_dno
VALUES(5500,'zinna',10,1050,'CLERK');
COMMIT;

SELECT * FROM v_em_dno;
SELECT * FROM emp_group_job;

-- 6. 이미 생성된 뷰(v_em_dno)에 대해서 읽기 전용 속성을 부여해봅시다.
CREATE OR REPLACE VIEW v_em_dno
AS
SELECT eno, ename, dno, salary, job
FROM employee
WHERE dno = 20 WITH READ ONLY;



-- 7. 사번, 사원이름, 부서번호와 부서 이름을 보여주는 뷰를(emp_dept)생성하세요.
CREATE OR REPLACE VIEW emp_dept
AS
SELECT eno, ename, dno, dname
FROM employee JOIN department
USING(dno);

SELECT * FROM emp_dept;


-- 8. 생성된 모든 뷰를 조회하세요.(데이터 사전을 조회하세요.)
SELECT * FROM user_views;

-- 9. 생성된 뷰(v_em_dno, emp_group_job, emp_dept)를 제거하세요
DROP VIEW v_em_dno;
DROP VIEW emp_group_job;
DROP VIEW emp_dept;
--------------------------------------------------------------------------------
--  [PL/SQL]
SET SERVEROUTPUT ON;
-- 1. IF문을 사용하여 KING사원의 부서번호를 얻어와서 부서 번호에 따른 부서명을출력하세요.
DECLARE
    v_dno employee.dno%type;
    v_dname department.dname%type;
BEGIN
    SELECT dno INTO v_dno
    FROM employee
    WHERE ename = 'KING';
    
    IF v_dno = 10 THEN
        v_dname := 'ACCOUNTING';
    ELSIF v_dno = 20 THEN
        v_dname := 'RESEARCH';
    ELSIF v_dno = 30 THEN
        v_dname := 'SALES';
    ELSIF v_dno = 40 THEN
        v_dname := 'OPERATIONS';
    END IF;
    dbms_output.put_line('KING이 소속된 부서명 : '||v_dname);
END;
SELECT * FROM department;


-- 2. BASIC LOOP문으로 1부터 10사이의 자연수의 합을 구하여 출력하세요
DECLARE
    n NUMBER := 1;
    total NUMBER := 0;
BEGIN
    LOOP
        total := total + n;
        n:= n+1;
        EXIT WHEN n>10;
    END LOOP;
    dbms_output.put_line('합계 : '||total);
END;

-- 3. FOR LOOP문으로 1부터 10사이의 자연수의 합을 구하여 출력하세요.
DECLARE
    total NUMBER := 0;
BEGIN
    FOR n IN 1..10 LOOP
        total := total + n;
    END LOOP;
    dbms_output.put_line('합계 : '||total);
END;



-- 4. WHILE LOOP문으로 1부터 10사이의 자연수의 합을 구하여 출력하세요.
DECLARE
    n NUMBER := 1;
    total NUMBER := 0;
BEGIN
    WHILE n<=10 LOOP
        total := total + n;
        n:= n+1;
    END LOOP;
    dbms_output.put_line('합계 : '||total);
END;




-- 5. 사원 테이블에서 커미션이 NULL아닌 상태의 사원번호, 이름, 급여를 
--     이름 기준으로 오름차순으로 정렬한 결과를 출력하세요
DECLARE
    v_emp employee%rowtype;
    CURSOR c_emp
    IS
    SELECT * FROM employee
    WHERE commission IS NOT NULL
    ORDER BY ename ASC;
BEGIN
    dbms_output.put_line('사원번호  이름  급여');
    dbms_output.put_line('-------------------------');
    OPEN c_emp;
    LOOP
        FETCH c_emp INTO  v_emp;
        EXIT WHEN c_emp%NOTFOUND;
        dbms_output.put_line(v_emp.eno||' '||v_emp.ename||' '||v_emp.salary);
    END LOOP;
    CLOSE c_emp;
END;


-- 6. 다음과 같은 테이블(Student)을 만들고 데이터를 입력한다.
--    
--    | 칼럼명  | 데이터타입    | 제약조건        |
--    | ------ | ------------ | ------------- |
--    | sid    | number       | primary key   |
--    | sname  | nvarchar2(5) | not null      |
--    | kscore |  number(3)   | check(0~100)  |
--    | escore |  number(3)   | check(0~100)  |
--    | mscore |  number(3)   | check(0~100)  |
--
--  학번은 시퀀스(seq_stu_id)로 저장한다.
--
--  [데이터]
--  학번   이름      국어   영어     수학
--  1    고길동      78     64       82
--  2    김길동      85     71       64
--  3    이길동      74     69       57
--  4    박길동      74     77       95
--  5    홍길동      68     95       84

CREATE TABLE Student(
    sid NUMBER PRIMARY KEY,
    sname NVARCHAR2(5) NOT NULL,
    kscore NUMBER(3) CHECK(0<= kscore AND kscore <= 100),
    escore NUMBER(3) CHECK(0<= escore AND escore <= 100),
    mscore NUMBER(3) CHECK(0<= mscore AND mscore <= 100)
);
CREATE SEQUENCE seq_stu_id
NOCACHE;
INSERT INTO Student
VALUES(seq_stu_id.nextval,'고길동',78,64,82);
INSERT INTO Student
VALUES(seq_stu_id.nextval,'김길동',85,71,64);
INSERT INTO Student
VALUES(seq_stu_id.nextval,'이길동',74,69,57);
INSERT INTO Student
VALUES(seq_stu_id.nextval,'박길동',74,77,95);
INSERT INTO Student
VALUES(seq_stu_id.nextval,'홍길동',68,95,84);

COMMIT;
SELECT * FROM Student;
--
--  6-1. 학생별 총점과 평균을 구하세요.
DECLARE
    v_stu Student%rowtype;
    v_total NUMBER := 0;
    v_avg NUMBER(5,3) :=0;
    CURSOR c_student
    IS
    SELECT * FROM Student;
BEGIN
    dbms_output.put_line('학생이름  총점   평균');
    dbms_output.put_line('----------------------------');
    FOR v_stu IN c_student LOOP
        v_total := v_stu.kscore + v_stu.escore + v_stu.mscore;
        v_avg := v_total/3;
        
        dbms_output.put_line(v_stu.sname||' '||v_total||' '||v_avg);
    END LOOP;
END;



--  6-2. 과목별 총점과 평균을 구하세요.
DECLARE
    v_stu Student%rowtype;
    v_ktotal NUMBER := 0;
    v_kavg NUMBER(5,3) :=0;
    v_etotal NUMBER := 0;
    v_eavg NUMBER(5,3) :=0;
    v_mtotal NUMBER := 0;
    v_mavg NUMBER(5,3) :=0;
    CURSOR c_student
    IS
    SELECT * FROM Student;
BEGIN
    dbms_output.put_line('과목  총점   평균');
    dbms_output.put_line('----------------------------');
    FOR v_stu IN c_student LOOP
        v_ktotal := v_ktotal + v_stu.kscore;
        v_etotal := v_etotal + v_stu.escore;
        v_mtotal := v_mtotal + v_stu.mscore;
    END LOOP;
    v_kavg := v_ktotal/5;
    v_eavg := v_etotal/5;
    v_mavg := v_mtotal/5;
    dbms_output.put_line('국어'||' '||v_ktotal||' '||v_kavg);
    dbms_output.put_line('영어'||' '||v_etotal||' '||v_eavg);
    dbms_output.put_line('수학'||' '||v_mtotal||' '||v_mavg);
END;
--------------------------------------------------------------------------------
-- [프로시저]
-- 1. 사원 테이블에서 커미션이NULL이 아닌 상태의 사원 번호와 이름, 급여를 출력하되
--    급여를 기준으로 오름차순 정렬한 결과를 나타내는 저장 프로시저를 생성하세요.
SELECT eno, ename, salary
FROM employee
WHERE commission IS NOT NULL
ORDER BY salary ASC;

CREATE OR REPLACE PROCEDURE sp_salary_comm
IS
    v_emp employee%rowtype;
    CURSOR c_emp
    IS
    SELECT *
    FROM employee
    WHERE commission IS NOT NULL
    ORDER BY salary ASC;
BEGIN
    dbms_output.put_line('사원번호  이름  급여');
    dbms_output.put_line('----------------------------');
    OPEN c_emp;
    LOOP
        FETCH c_emp INTO v_emp;
        EXIT WHEN c_emp%NOTFOUND;
        dbms_output.put_line(v_emp.eno||' '||v_emp.ename||' '||v_emp.salary);
    END LOOP;
    CLOSE c_emp;
END;

EXECUTE sp_salary_comm;

-- 2. 저장 프로시저를 수정하여 커미션 컬럼을 하나 더 출력하고 
--     이름을 기준로 내리차순으로 정렬하세요.
CREATE OR REPLACE PROCEDURE sp_salary_comm
IS
    v_emp employee%rowtype;
    CURSOR c_emp
    IS
    SELECT *
    FROM employee
    WHERE commission IS NOT NULL
    ORDER BY salary ASC;
BEGIN
    dbms_output.put_line('사원번호  이름  급여 커미션');
    dbms_output.put_line('--------------------------------');
    FOR v_emp IN c_emp LOOP
        dbms_output.put_line(v_emp.eno||' '||v_emp.ename||' '||v_emp.salary||' '||v_emp.commission);
    END LOOP;
END;

EXECUTE sp_salary_comm;
-- 3. 생성된 저장 프로시저를 제거하세요.
DROP PROCEDURE sp_salary_comm;





