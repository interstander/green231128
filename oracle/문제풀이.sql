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














