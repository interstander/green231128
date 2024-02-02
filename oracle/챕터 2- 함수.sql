-- 함수 => 조회된 값을 어떤 기능으로 처리된 결과를 보여줄 때 사용하는 것 함수
-- 문자, 숫자, 날짜, 그외

--  1. 문자열에 관련된 함수
--  ASCII(문자)  => 문자를 아스키 코드값으로 변경해서 출력
--  CHR(코드값)  => 아스키코드에 해당하는 문자를 출력
SELECT ASCII('F'), CHR(75)
FROM dual;

-- ASCIISTR(문자) 문자를 16진수 유니코드에 해당하는 값으로 반환
-- UNISTR(코드값) 16진수 유니코드 값에 해당하는 문자로 출력
SELECT  ASCIISTR('정'), UNISTR('\C85F')
FROM dual;

-- LENGTH(문자열) 문자열의 길이
-- LENGTHB(문자열) 문자열을 바이트 단위로 길이를 표시하느 함수  ( 영어: 1글자당 1바이트, 한글 : 1글자당 3바이트)
SELECT LENGTH('럭키금성'), LENGTHB('럭키금성')
FROM dual;

SELECT LENGTH(ename),ename
FROM employee;

-- 문자열 변경 함수
--  LOWER(문자열) : 모든 문자를 소문자로 바꿔주는 함수
--  UPPER(문자열) : 모든 문자를 대문자로 바꿔주는 함수
--  INITCAP(문자열) : 모든 단어의 첫글자는 대문자, 나머지는 소문자로 바꿔주는 함수
--  CONCAT(문자열1,문자열2) : 문자열 두개를 결합해서 하나의 문자열로 만들어주는 함수
--       =>  문자열1||문자열2 : 문자열 두개를 결합해서 하나의 문자열로 만들어주는 함수
--  REPLACE(문자열,찾는 문자열, 바꿀 문자열) : 대상이 되는 문자열에서 찾는 문자열을 찾아서 바꿀문자열로 교체하는 함수

SELECT LOWER('aBcDeF'),UPPER('aBcDeF'),INITCAP('thIs iS aN aPplE')
FROM dual;
SELECT CONCAT('오라클',' 데이터베이스')
FROM dual;
SELECT '오라클'||' 데이터베이스'
FROM dual;
SELECT ename||':'||job
FROM employee;

SELECT REPLACE('이것은  Apple입니다','Apple','사과')
FROM dual;

SELECT REPLACE('이것은  사과이고, 이것은 바나나입니다','이것','그것')
FROM dual;

-- 문자열의 위치를 검색해서 알려주는 함수
-- INSTR(대상문자열,검색문자열) : 대상문자열 내부에 검색문자열이 몇번째 있는지 위치를 알려주는 함수
SELECT INSTR('이것은 사과입니다.','사과')  --  1부터 시작, 공백도 카운트에 포함
FROM dual;
-- INSTR(대상문자열,검색문자열,숫자) : 대상문자열 내부에 검색문자열이 몇번째 있는지 위치를 알려주는 함수(시작위치부터 검색 시작)
SELECT 
INSTR('이것은 사과이고, 이것은 바나나입니다','이것'),  -- 1
INSTR('이것은 사과이고, 이것은 바나나입니다','이것',5)   -- 11
FROM dual;

-- 문자열을 추출하기 위한 함수
--  SUBSTR(문자열, 시작위치, 길이) : 대상이 되는 문자열에서 시작위치부터 길이만큼 문자열을 추출해서 반환하는 함수
SELECT SUBSTR('이것이 사과이다.',5,2)  --사과
FROM dual;

-- 문자열 주변에 특정 문자열을 채우기 위한 함수
--  LPAD(문자열, 크기, 채울값) : 대상 문자열을 크기만큼 늘리고 왼쪽 빈칸을 채울값으로 채우는 함수
--  RPAD(문자열, 크기, 채울값) : 대상 문자열을 크기만큼 늘리고 오른쪽 빈칸을 채울값으로 채우는 함수
SELECT 
LPAD('apple',10,'*'), --  '*****apple'
RPAD('apple',10,'*')  --  'apple*****'
FROM dual;
SELECT   -- 한글을 2바이트 크기로 취급해서 동작
LPAD('애플',10,'*'), --  '******애플'
RPAD('애플',10,'*')  --  '애플******'
FROM dual;

-- 문자열 주변에 특정 문자열이나, 공백을 제거할 때 사용하는 함수
-- LTRIM(문자열) : 문자열에 왼쪽 공백 제거
-- RTRIM(문자열) : 문자열에 오른쪽 공백 제거
-- TRIM(문자열) : 문자열에 양쪽 공백 제거
SELECT LTRIM('    애플    '), RTRIM('    애플    '), TRIM('    애플    ')
FROM dual;
-- LTRIM(문자열, 특정값) : 문자열에 왼쪽 특정값 제거
-- RTRIM(문자열, 특정값) : 문자열에 오른쪽 특정값 제거
SELECT LTRIM('*****애플*****','*'), RTRIM('*****애플*****','*')
FROM dual;
-- TRIM(키워드 특정값 FROM 문자열) : 문자열에서 특정값을 제거한 다음 출력
--       => 키워드 : BOTH(양쪽 모두),  LEADING(앞쪽), TRAILING(뒤쪽))
SELECT 
TRIM(BOTH '*' FROM '*****애플*****'),
TRIM(LEADING '*' FROM '*****애플*****'),
TRIM(TRAILING '*' FROM '*****애플*****')
FROM dual;

-------------------------------------------------------------------------------------------------
-- 2. 숫자 관련 함수
--  삼각함수 : COS(), ACOS(), SIN(), ASIN(), TAN(), ATAN()...
--  지수로그 함수 : LN(), LOG()...

--  ABS() : 절대값 : 거리
SELECT ABS(10), ABS(-10)
FROM dual;

-- CEIL(숫자) : 소수점 첫째 자리에서 올림한 정수값
-- ROUND(숫자) : 소수점 첫째 자리에서 반올림한 정수값
-- FLOOR(숫자) : 소수점 첫째 자리에서 내림한 정수값

SELECT CEIL(3.14),ROUND(3.14),ROUND(3.74),FLOOR(3.74)
FROM dual;

-- ROUND(숫자,숫자) : 소수점 숫자 자리까지 반올림한 값
SELECT ROUND(3.143,2),ROUND(3.768,2)
FROM dual;

-- TRUNC(숫자, 자리수) : 숫자를 자리수까지만 표기하고 나머지는 절삭
SELECT TRUNC(1234.567687,3),TRUNC(1234.567687,-2)
FROM dual;

-- MOD(피제수, 제수) : 나머지, 피제수를 제수를 나눈 나머지
--- '가감승제'
SELECT MOD(9,2)
FROM dual;

-- SIGN(숫자) : 숫자가 양수면 1, 음수명 -1, 0이면 0을 반환하는 함수
SELECT SIGN(10),SIGN(-5),SIGN(0)
FROM dual;

---------------------------------------------------------------------------------------
-- 날짜,시간 관련 함수
-- sysdate : DBMS서버가 가진 현재 날짜를 사용하기 위한 함수
SELECT sysdate
FROM dual;
-- CURRENT_DATE : DBMS서버가 가진 현재 날짜를 사용하기 위한 함수
SELECT CURRENT_DATE
FROM dual;
-- CURRENT_TIMESTAMP : 현재 날짜와 시간을 표기하기 위한 함수
SELECT CURRENT_TIMESTAMP
FROM dual;

--(+,-) 날짜단위로 계산
SELECT sysdate,sysdate+5, sysdate-5
FROM dual;

-- 문자열을 날짜로 변환하는 함수(형변환함수)
-- TO_DATE(문자열)
SELECT TO_DATE('1999/10/08'),'1999/10/08'
FROM dual;

-- 날짜 계산시 월단위 계산
-- ADD_MONTHS(날짜, 숫자)  : 해당 날짜에서 숫자만큼 월을 더하거나 뺀 날짜를 출력하기 위한 함수
SELECT sysdate, ADD_MONTHS(sysdate,5),ADD_MONTHS(sysdate,-5)
FROM dual;

-- 주어진 날짜에 해당하는 달의 마지막 날짜를 출력하기 위한 함수
-- LAST_DAY(날짜)
SELECT LAST_DAY(sysdate), LAST_DAY(TO_DATE('1999/08/07'))
FROM dual;

--  NEXT_DAY(날짜,숫자) : 지정된 날짜 이후에 오는 요일에 해당하는 날짜를 출력하기 위한 함수
--                 -> 1:일,2:월,3:화,4:수,5:목,6:금.7:토
SELECT NEXT_DAY(sysdate,2),NEXT_DAY(TO_DATE('2022-02-09'),2)
FROM dual;

-- 날짜 기준 반올림 계산
-- ROUND(날짜, 형식) : 날짜를 주어진 형식에 맞도록 반올림해서 얻어지는 날짜를 출력하기 위한 함수
--               'YYYY'  년도를 기준으로 반올림(7월 1일 기준)
SELECT 
ROUND(TO_DATE('2024/03/30'),'YYYY'), -- 2024/01/01
ROUND(TO_DATE('2024/09/12'),'YYYY') -- 2025/01/01
FROM dual;

--                'MON'  월을 기준으로 반올림(16일을 기준)
SELECT 
ROUND(TO_DATE('2024/03/12'),'MON'), -- 2024/03/01
ROUND(TO_DATE('2024/03/24'),'MON') -- 2024/04/01
FROM dual;

--                 'Q'   분기를 기준으로 반올림 ( 두번째달 16일 기준)
SELECT 
ROUND(TO_DATE('2024/02/12'),'Q'), -- 2024/01/01
ROUND(TO_DATE('2024/08/24'),'Q') -- 2024/10/01
FROM dual;

--                  'DY'  일주일 기준으로 반올림(수요일 기준)
SELECT 
ROUND(TO_DATE('2024/02/06'),'DY'), -- 2024/02/04
ROUND(TO_DATE('2024/02/09'),'DY') -- 2024/02/11
FROM dual;

-- 숫자에 대응하는  날짜 계산 : 
-- NUMTOYMINTERVAL(숫자,표현식) : 숫자를 표현식으로 고칠때 년,월을 출력하는 함수(표현식: YEAR, MONTH)
SELECT NUMTOYMINTERVAL(1000,'MONTH'),NUMTOYMINTERVAL(2.24,'YEAR')
FROM dual;

-- NUMTODSINTERVAL(숫자,표현식) : 숫자를 표현식으로 고칠때 날짜와 시간을 출력하는 함수(표현식: HOUR, SECOND, MINUTE, DAY)
SELECT NUMTODSINTERVAL(9876,'HOUR'),NUMTODSINTERVAL(987654321,'SECOND'),
NUMTODSINTERVAL(987654321,'MINUTE'),NUMTODSINTERVAL(2.24,'DAY')
FROM dual;

----------------------------------------------------------------------------------------------------
-- 4. 그외 기타 함수
-- NULL 관련 함수
--  NVL(컬럼명,데체데이터) : 해당 컬럼의 데이터가 NULL인 경우 대체 데이터로 변경해서 출력하는 함수
--  NVL2(컬럼명,데이터1,데이터2) : 해당 컬럼의 데이탁 NULL이면 데이터2를 출력, NULL이 아니면 데이터1을 출력
SELECT NVL(commission,0)
FROM employee;

SELECT ename,salary, NVL2(commission,salary*12+commission,salary*12)
FROM employee;

-- COALESCE(컬럼1,컬럼2, 컬럼3....) : 여러컬럼의 값중 NULL아닌 첫번째 컬럼데이터를 출력하는 함수
-- NULLIF(식1,식2) : 식1과 식2가 같으면 NULL. 다르면 식1을 반환하는 함수
SELECT ename,salary,commission,COALESCE(commission, salary,0)
FROM employee;

SELECT NULLIF('A','A'),NULLIF('A','B')
FROM dual;

-- IF조건문과 비슷한 역할을 하는 함수
--CASE 
--    WHEN 조건식1 THEN 결과1
--    WHEN 조건식2 THEN 결과2
--    WHEN 조건식3 THEN 결과3
--    WHEN 조건식4 THEN 결과4
--    ELSE 결과 5
--END
--    조건식이 TRUE면 해당하는 결과를 출력하는 함수
SELECT ename,salary,
    CASE
        WHEN salary >=4000 THEN '고액 급여자'
        WHEN salary >=2000 THEN '중액 급여자'
        WHEN salary >=1000 THEN '소액 급여자'
        ELSE '초 소액 급여자'
    END AS "급여자"
FROM employee;

-- SWITCH문과 비슷한 역할을 하는 함수
--DECODE(컬럼명,값1,결과1,값2,결과2,값3,결과3,결과4)
--     컬럼의 데이터가 값1과 일치하면 결과1을 반환
--                   값2과 일치하면 결과2을 반환
--                   일치하는 것이 없으면 결과4를 반환
SELECT ename,job,
DECODE(job,'CLERK','점원'
          ,'SALESMAN','영업사원'
          ,'MANAGER','관리자'
          ,'ANALYST','분석가'
          ,'사장') AS "한글업무이름"
FROM employee;

----------------------------------------------------------------------------------


























