-- 01 데이터 조회하기 => SELECT

-- "어떤 테이블에서 데이터를 조회하세요.!" => "'어떤' 테이블에서 '어떤' 데이터를 조회하세요.!"
--                                        테이블이름        컬럼이름
--   :  SELECT FROM 테이블명;
DESC employee;
--  employee 테이블에 ename이라는 데이터를 조회하세요.
SELECT ename FROM employee;

--  employee 테이블에 ename,salary 이라는 데이터를 조회하세요.
SELECT ename,salary FROM employee;

--  employee 테이블에 ename,salary,job,HIREDATE  이라는 데이터를 조회하세요.
SELECT ename,salary,job,hiredate FROM employee;

-- employee 테이블에 모든 컬럼의 데이터를 조회하세요.
SELECT * FROM employee;

-- 컬럼의 데이터가 숫자라면 사칙연산의 결과를 조회할수 있다.
--  employee테이블에서 사원이름,급여정보, 연봉정보를 조회하세요.
SELECT ename,salary,salary*12 FROM employee;

-- 컬럼의데이터가 숫자가 아니라면??
SELECT ename,ename+12,salary,salary*12 FROM employee;
--   계산 불가로 에러 발생

-- 연봉을 계산할때 상여금을 추가해서 계산하세요.
SELECT ename,salary,salary*12+commission FROM employee;
--           null은 빈칸을 의미하고 빈칸에 숫자를 더하면 그냥 빈칸으로 출력

SELECT ename AS "사원이름",salary AS "급여" ,salary*12+NVL(commission,0) AS "연 봉" FROM employee;

-- 검색 컬럼뒤에 AS붙이고 별칭을 지어줄수 있다
-- 별칭은 ""안에 작성해야 하지만 생략도 가능
--                             띄어쓰기나 특수문자가 들어가는 경우 ""생략불가

SELECT  ename AS "사원이름",
        salary AS "급여" ,
        salary*12+NVL(commission,0) AS "연 봉" 
FROM employee;

-- 조회된 데이터의 중복을 제거해서 표시 distinct
-- 모든 사원이 소속된 부서번호를 조회하세요.
SELECT dno FROM employee;

-- 모든 사원이 소속된 부서번호를 중복없이 조회하세요.,
SELECT DISTINCT dno FROM employee;

---------------------------------------------------------------
-- 컬럼의 데이터를 조회할 때 반드시 모든 데이터를 조회할 필요는 없다!
--                             => 적절한 조건의 데이터를 추려서 조회할 수 있어야 한다.
--                                      WHERE  조건절 -> T/F  => 비교연산

-- 급여가 1500인 사람의 이름과 급여 그리고 하는 일을 조회하세요. 
SELECT ename,salary, job FROM employee WHERE salary <= 1500;

-- 비교 :  >, >=, <, <=, =, !=, <> 
SELECT ename,salary, job FROM employee WHERE ename >= 'SCOTT';

SELECT * FROM employee WHERE hiredate >= '1981/05/13';
--                              1981/05/13일 보다 날짜가 더 뒤에 입사한 사람

-- 논리연산 : AND, OR, NOT
-- 부서번호가 20번이고 급여가 1500이상인 사원의 정보를 조회하세요.
SELECT * FROM employee WHERE dno=20 AND salary >= 1500;

-- 부서번호가 20번이거나 급여가 1500이상인 사원의 정보를 조회하세요.
SELECT * FROM employee WHERE dno=20 OR salary >= 1500;

-- 부서번호가 20번이거나 급여가 1500이상이 아닌 사원의 정보를 조회하세요.
SELECT * FROM employee WHERE NOT(dno=20 OR salary >= 1500);
SELECT * FROM employee WHERE (NOT dno=20) OR salary >= 1500;
SELECT * FROM employee WHERE dno=20 OR NOT salary >= 1500;

-- 미니과제
-- 1. 급여가 1000에서 1500 사이인 사원을 조회하세요.
SELECT * FROM employee
WHERE salary >= 1000 AND salary <= 1500;
-- 2. 급여가 1000미만이거나 1500초과인 사원을 조회하세요.
SELECT * FROM employee
WHERE salary < 1000 OR salary > 1500;
-- 3. 커미션이 300이거나, 500 이거나 1400인 사원을 조회하세요.
SELECT * FROM employee
WHERE commission = 300 OR commission = 500 OR commission = 1400;

-- 특정 범위의 값을 조회할 때 사용하는 연산 : BETWEEN A AND B : A부터 B까지 사이의 모든 데이터
-- 급여가 1000에서 1500 사이인 사원을 조회하세요.
SELECT * FROM employee
WHERE salary BETWEEN 1000 AND 1500;

SELECT * FROM employee
WHERE salary NOT BETWEEN 1000 AND 1500;  -- 1000과 1500 사이에 있지 않는 사람들
    -- 1000미만 이거나 1500초과인 사람들

-- 미니과제 : 1981년도에 입사한 사원을 조회하세요.
SELECT * FROM employee
WHERE hiredate BETWEEN '81/01/01' AND '81/12/31';


-- IN(값1,값2,값3...) : 정확하게 일치하는 것들(불연속적인 값 하나하나를 조회할 때 사용하는 연산
-- 급여가 800,950, 3000에 일치하는 사원을 조회하세요.
SELECT * FROM employee
WHERE salary=800 OR salary=950 OR salary=3000;

SELECT * FROM employee
WHERE salary IN(800,950,3000);

-- 급여가 800,950, 3000에 일치하지 않는 사원을 조회하세요.
SELECT * FROM employee
WHERE salary NOT IN(800,950,3000);


-- null : 빈칸 => 비교등에서 사용될수 없다. 
--    빈칸인지 아닌지를 판단하기 위해서는 전용 연산 : is
-- 커미션이 null인 사원을 조회하세요.
SELECT * FROM employee
WHERE commission = null;  -- X

SELECT * FROM employee
WHERE commission is null;

SELECT * FROM employee
WHERE commission is not null;

-------------------------------------
-- 이름이 KING 인 사람을 조회하세요.
SELECT * FROM employee
WHERE ename = 'KING';

-- 문자열의 일부만 조회하는 경우 : LIKE
-- LIKE + 와일드카드(_,%)와 함께 사용
--      _ : 한글자, 뭔지 모를 한글자
--          예 : 홍XX => 이름 LIKE '홍__'; / 이름 LIKE '__형'; 
--      % : 문자가 없거나 여러글자인 경우
--          예 : 이름 LIKE '홍%'

-- 이름이 A로 시작하는 사원 정보
SELECT * FROM employee
WHERE ename LIKE 'A%';

-- 이름이 S로 끝나는 사원 정보
SELECT * FROM employee
WHERE ename LIKE '%S';

-- 이름 중간에 E가 들어가는 사원 정보
SELECT * FROM employee
WHERE ename LIKE '%E%';

-- 이름의 두번째 글자가 O인 사원 정보
SELECT * FROM employee
WHERE ename LIKE '_O%';

-- 이름의 세번째 글자가 R이 아닌 사원 정보
SELECT * FROM employee
WHERE ename NOT LIKE '__R%';

-- 미니과제
-- 1. 커미션이 300 이거나 500이거나 1400인 사원을 조회
SELECT * FROM employee
WHERE commission=300 OR commission=500 OR commission=1400;
SELECT * FROM employee
WHERE commission IN (300,500,1400);
-- 2. 커미션이 300,500,1400이 모두 아닌 사원을 조회
SELECT * FROM employee
WHERE commission NOT IN (300,500,1400);
-- 3. 사원의 이름이 F로 시작하는 모든 사원 조회
SELECT * FROM employee
WHERE ename LIKE 'F%';
-- 4. 사원이름에 M이 포함되어있는 모든 사원 조회하기
SELECT * FROM employee
WHERE ename LIKE '%M%';
-- 5. 사원 이름이 N으로 끝나는 모든 사원 조회하기
SELECT * FROM employee
WHERE ename LIKE '%N';
-- 6. 이름의 두번째 글자가 A인 사원을 조회하기
SELECT * FROM employee
WHERE ename LIKE '_A%';
-- 7. 이름의 세번째 글자가 A인 사원 조회하기
SELECT * FROM employee
WHERE ename LIKE '__A%';
-- 8. 이름에 A가 들어가지 않은 사원 조회하기
SELECT * FROM employee
WHERE ename NOT LIKE '%A%';

--------------------------------------------------------------------------------
-- 정렬 
--  기본적인 데이터 출력 순서 : 입력된 순서
--   데이터 출력순서를 정렬해서 확인할 때 ORDER BY
--    ORDER BY 컬럼명 정렬방식(ASC:오름차순, DESC:내림차순)

-- 이름, 업무, 급여를 이름순서대로 정렬해서 출력하세요.
SELECT ename, job, salary FROM employee
ORDER BY ename ASC;
-- 이름, 업무, 급여를 급여의 내림차순 정렬해서 출력하세요.
SELECT ename, job, salary FROM employee
ORDER BY salary DESC;

-- 이름, 업무, 급여를 업무 순서대로 정렬해서 출력하세요.
SELECT ename, job, salary FROM employee
ORDER BY job;
-- 두개 이상 정렬기준 :  우선 첫번째 정렬기준대로 정렬되고, 동일한 내용이 있다면 두번째 정렬기준으로 추가 정렬
-- 이름, 업무, 급여를 업무 순서대로 정렬해서 조회하되 업무가 같은 경우 급여 기준으로 내림차순 정렬하세요.
SELECT ename, job, salary FROM employee
ORDER BY job ASC, salary DESC;

--- 정렬은 모든 조회가 끝난후 진행이 된다.
SELECT * FROM employee
WHERE salary >= 1000
ORDER BY ename;

SELECT  ename,
        salary,
        salary*12+NVL(commission,0)
FROM employee
ORDER BY salary*12+NVL(commission,0) ;  -- 컬럼이름이 복잡한 경우에도 사용 가능

SELECT  ename AS "사원이름",
        salary AS "급여" ,
        salary*12+NVL(commission,0) AS "연 봉" 
FROM employee
ORDER BY "연 봉" DESC;  --별칭을 기준으로 정렬 가능






































