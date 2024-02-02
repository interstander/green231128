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



