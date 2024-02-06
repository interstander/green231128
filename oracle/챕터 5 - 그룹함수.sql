-- CH05 그룹함수 - SELECT
--  함수 : 데이터를 처리하는 기능
--  - 그룹함수 : 데이터를 그룹지어서 처리하는 함수
--              다수의 데이터를 처리

--  그룹함수의 예시 : 
--     - SUM(컬럼명) : 모든 컬럼의 데이터 총합을 구하는 함수
---    - AVG(컬럼명) : 모든 컬럼의 데이터 평균을 구하는 함수
--     - MAX(컬럼명) : 모든 컬럼의 데이터 최대값을 구하는 함수
--     - MIN(컬럼명) : 모든 컬럼의 데이터 최소값을 구하는 함수
--     - COUNT(컬럼명) : 컬럼의 데이터 개수를 구하는 함수
--          -> COUNT(*) : 모든 레코드의 개수를 구하는 함수

SELECT SUM(salary) AS "급여총합",
       AVG(salary) AS "급여평균",
       MAX(salary) AS "최고급여",
       MIN(salary) AS "최저급여",
       COUNT(salary) AS "급여받는 사원수",  -- NULL값을 카운트 하지 않는다.
       COUNT(*) AS "모든 사원 수"
FROM employee;

-- 개수를 셀때 DISTINCT 를 사용하면 중복된 데이터를 제거하고 개수를 센다.
-- 모든 사원의 업무 종류
SELECT job FROM employee;
-- 업무를 가진 모든 사원의 인원수
SELECT COUNT(job) FROM employee;
-- 모든 사원의 업무 종류의 개수
SELECT COUNT(DISTINCT job) FROM employee;

--------------------------------------------------------------------------------
-- 그룹함수의 결과는 반드시 1개이므로 일반컬럼과 같이 출력할수 없다.
SELECT ename, MAX(salary)
FROM employee;

-- 기존 그룹함수는 하나의 컬럼에 하나의 결과만을 구하는 용도로 사용된다.
--    -> 컬럼의 데이터를 그룹을 지어서 그룹당 결과를 출력하는 용도로 사용될수 있다.

SELECT SUM(salary)
FROM employee;
-- 각 업무별 급여의 합계를 구하고 싶다.
--> 컬럼을 그룹짓는 방법 : GROUP BY 컬럼명
SELECT job,SUM(salary)
FROM employee
GROUP BY job;


SELECT ename,job,SUM(salary)  --GROUP BY가 있더라고 일반 컬럼과 같이 사용불가
FROM employee
GROUP BY job;

-- 다수의 컬럼을 그룹지어서 사용도 가능
SELECT dno,job,SUM(salary)
FROM employee
GROUP BY dno,job  -- 먼저나온 컬럼을 기준으로 그룹화를 진행하고 그후에 나오는 컬럼으로 2차 그룹을 분류
ORDER BY dno,job;

-- 중간 연산 결과가 필요한 경우 ROLLUP 
SELECT job, SUM(salary)
FROM employee
GROUP BY ROLLUP(job);


SELECT dno,job,SUM(salary)
FROM employee
GROUP BY ROLLUP(dno,job) 
ORDER BY dno,job;

---------------------------------------------------------------------------------
-- 그룹함수에 조건걸기
--  예제 : 업무별 급여 총액을 출력
SELECT job, SUM(salary)
FROM employee
GROUP BY job;
--  예제 : 업무별 평균 급여가 2000이상인 업무의 급여 총액을 출력
SELECT job, SUM(salary)
FROM employee
WHERE  AVG(salary)>= 2000  --  WHERE 조건은 각 레코드에 거는 조건을 의미
GROUP BY job;

---  각 그룹에 조건을 걸어야 하는 상황이라면 HAVING 조건절을 사용해야 한다.
SELECT job, SUM(salary),AVG(salary)
FROM employee 
GROUP BY job
HAVING AVG(salary)>= 2000;

-- 최종 SELECT 문법
-- SELECT 조회하고싶은 데이터
-- FROM 테이블명
-- WHERE 조회하고 싶은 레코드 선별 조건
-- GROUP BY 그룹지으려는 컬럼
-- HAVING 그룹를 선별하기 위한 조건
-- ORDER BY 정렬 기준

-- 예제 1 : 부서별 최고 급여가 3000 이상인 부서의 부서번호, 해당 부서의 최고 급여 구하기
SELECT dno, MAX(salary)
FROM employee
GROUP BY dno
HAVING MAX(salary) >= 3000;


-- 예제 2 : 부서별 평균 급여중에서 최고 평균 급여를 조회하기
SELECT MAX(AVG(salary))
FROM employee
GROUP BY dno;


-- 예제 3 : 업무가 매니저인 사람을 제외하고 급여 총액이 5000 이상인 담당 업무별 급여 총액과 해당 인원을 급여 총액이 많은 업무 순으로 조회
SELECT job,SUM(salary), COUNT(*)
FROM employee
WHERE job <> 'MANAGER'
GROUP BY job
HAVING SUM(salary) >= 5000
ORDER BY SUM(salary) DESC;












