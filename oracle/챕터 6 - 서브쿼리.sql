-- 서브쿼리
--   서브(sub) : 보조적인 

-- 예 :  SCOTT 사원보다 급여가 많은 사원을 조회해 보자
SELECT ename,salary
FROM employee
WHERE salary >= SCOTT사원의 급여;
--  1. SCOTT사원의 급여 정보를 알기 위한 쿼리문   => 주쿼리를 보조하기 위해서 사용되는 쿼리 => 보조쿼리(서브쿼리)
SELECT salary
FROM employee
WHERE ename='SCOTT';
--  2. 첫번째에서 구한 급여정보를 통해서 해당 급여보다 많이 받는 사원을 조회하는 쿼리
SELECT ename,salary    --  => 궁극적으로 알고 싶은 정보 => 주 쿼리 (main 쿼리)
FROM employee
WHERE salary >= 3000;
-------------------------------------
-- 서브 쿼리의 사용 예
SELECT ename,salary   
FROM employee
WHERE salary >= (SELECT salary
                    FROM employee
                    WHERE ename='SCOTT');
--------------------------------------
-- 서브쿼리의 역할은 주 쿼리의 보조적인 역할이므로 주로 조건문(WHERE, HAVING)
-- 예제 :  각 부서별 최소 급여가 30번 부서의 최소급여보다 더 큰 부서의 부서번호와 해당 부서의 최소급여를 조회해 봅시다.
SELECT  dno, MIN(salary)
FROM employee
GROUP BY dno
HAVING MIN(salary) > (SELECT MIN(salary)
                        FROM employee
                        WHERE dno =30); 
--------------------------------------------------------------------------------
-- 서브 쿼리의 응용
--   서브쿼리도 하나의 쿼리문 => 결과가 여러개인 경우가 있을 수있다
--  - 단일행 서브쿼리 : 결과가 하나만 나오는 경우
--  - 다중행 서브쿼리 : 결과가 여러 레코드로 나오는 경우

--  단일행 서브쿼리 예 :  최소 급여를 받는 사원의 이름과 업무, 급여를 조회하세요.
SELECT ename, job, salary
FROM employee
WHERE salary = (SELECT MIN(salary)
                    FROM employee);
                    
-- 다중행 서브쿼리의 예시 :   급여가 SALESMAN보다 적은 급여를 받는 사원의 이름과 급여를 조회하세요.
SELECT ename, salary
FROM employee
WHERE salary < (SELECT salary
                FROM employee
                WHERE job = 'SALESMAN');  
-- 에러가 나는 이유 : 값이 여러개이므로 단순히 크다작다를 말할수 없기 때문에
-- 다중행 서브쿼리의 경우 전용 비교 연산을 따로 사용해야 함
--    ALL, IN,  ANY

--    ALL : 서브쿼리가 반환하는 모든 값에 대해서
--     < ALL (서브쿼리) : 서브쿼리가 반환하는 모든 값에 대해서 더 작을 경우
--                   => 서브쿼리의 가장 작은 값보다 더 작은 경우
--     > ALL (서브쿼리) : 서브쿼리가 반환하는 모든 값에 대해서 더 큰 경우
--                   => 서브쿼리의 가장 큰 값보다 더 큰 경우
SELECT ename, salary
FROM employee
WHERE salary < ALL (SELECT salary
                    FROM employee
                    WHERE job = 'SALESMAN'); 

--     ANY : 서브쿼리가 반환하는 어떤 값에 대해서 (하나라도 일치하는 경우)
--      < ANY (서브쿼리) :  서브쿼리가 반환하는 값 중에서 하나의 값보다 작은 경우
--                    => 서브쿼리의 가장 큰 값보다 더 작은 경우
--      > ANY (서브쿼리) :  서브쿼리가 반환하는 값 중에서 하나의 값보다 큰 경우
--                    => 서브쿼리의 가장 작은 값보다 더 큰 경우
--      = ANY (서브쿼리) :  서브쿼리가 반환하는 값 중에서 하나의 값과 일치하는 경우 => IN 연산자
SELECT ename, salary
FROM employee
WHERE salary = ANY (SELECT salary
                    FROM employee
                    WHERE job = 'SALESMAN'); 

--     IN : 서브쿼리의 결과와 반드시 1:1 대응을 요구하는 연산 IN 
























