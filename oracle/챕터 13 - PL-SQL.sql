-- PL/SQL
-- 오라클 SQL문법에 절차적 프로그래밍 기법을 도입한 언어 => 프로시저

--  DBMS 콘솔출력을 위해서는 워크시트당 단 한번 환경변수 SERVEROUTPUT를 ON을 셋팅
SET SERVEROUTPUT ON;

-- Hello World 출력
BEGIN
    dbms_output.put_line('Hello World!');
END;

--  변수 선언, 데이터를 저장할 목적
--  방법
--    [다른 언어]타입 변수이름 = 데이터;  => ' == '
--   변수이름 타입 [제약조건]:= 데이터

--  타입
--     1. 스칼라(기본) : 숫자,문자,날짜, BOOLEAN
--     2. 레퍼런스 : 이미 만들어진 테이블의 컬럼 데이터타입을 가져와서 사용할 때
--           - 테이블명.컬럼명%type : 테이블의 특정 컬럼의 타입을 가져오기
--           -  테이블명%rowtype : 테이블의 모든 타입을 가져오기

-- 예제 : 7788인 사원번호와 SCOTT 사원이름을 출력하는 프로시저를 작성해 봅시다.
DECLARE
    v_eno number(4);                -- 스칼라 타입
    v_ename employee.ename%type;    --레퍼런스 타입
BEGIN
    v_eno := 7788;
    v_ename := 'SCOTT';
    dbms_output.put_line('사원번호    사원이름');
    dbms_output.put_line('------------------------');
    dbms_output.put_line(v_eno||'   '||v_ename);
END;

-- 예제2 :  사원번호가 7788인 사원이 사원번호와 사원이름, 급여를 출력하는 프로시저를 작성해 봅시다.
DECLARE
    v_eno NUMBER(4);
    v_ename employee.ename%type;
    v_salary employee.salary%type;
    v_aniSal NUMBER;
BEGIN
    dbms_output.put_line('사원번호  사원이름    급여      연봉');
    dbms_output.put_line('------------------------------------------');
    
    SELECT eno, ename, salary INTO v_eno, v_ename, v_salary
    FROM employee
    WHERE eno = 7788;
    
    v_aniSal := v_salary*12;
    
    dbms_output.put_line(v_eno||'      '||v_ename||'     '||v_salary||'     '||v_aniSal);
END;

--------------------------------------------------------------------------------
-- 조건문 : IF 문
-- 기본 문법
--  IF 조건식 THEN
--      실행문; --조건식이 true면 실행
--  ELSIF 조건2 THEN
--      실행문2;   -- 조건2가 true면 실행
--  ELSE 
--      실행문9;  -- 모든 조건이 FALSE 인 경우 실행
--  END IF;

-- 예제 : 커미션을 받는 직원은 급여에 12를 곱한 후 커미션을 합산하여 연봉을 구하고, 
-- 커미션이 없는 직원은 급여에 12를 곱한 것으로 연봉을 구한다. 
--    => 이름이 SCOTT인 사원의 급여 정보를 출력하는 프로시저를 작성하세요.
DECLARE 
    anisal NUMBER := 0;
    v_salary employee.salary%type;
    v_commission employee.commission%type;
BEGIN
    SELECT salary, commission INTO v_salary, v_commission
    FROM employee
    WHERE ename = 'SCOTT';
    
    IF v_commission IS NULL THEN
        anisal := v_salary*12;
    ELSIF v_commission IS NOT NULL THEN
        anisal := v_salary*12+v_commission;
    END IF;
    
    dbms_output.put_line('SCOTT의 연봉 : '||anisal);
END;

-- 예제 : SCOTT사원의 사원번호와 사원이름 소속된 부서명을 출력한다. (department에서 조회하지 않는다.)
DECLARE
    v_eno employee.eno%type;
    v_ename employee.ename%type;
    v_dno employee.dno%type;
    v_dname VARCHAR2(20) := null;
BEGIN
    SELECT eno, ename, dno INTO v_eno, v_ename,v_dno
    FROM employee
    WHERE ename = 'SCOTT';
    
    IF v_dno = 10 THEN
        v_dname := 'ACCOUNTING'; 
    ELSIF v_dno = 20 THEN
        v_dname := 'RESEARCH'; 
    ELSIF v_dno = 30 THEN
        v_dname := 'SALES'; 
    ELSIF v_dno = 40 THEN
        v_dname := 'OPERATION'; 
    END IF;
    
    dbms_output.put_line('사원번호  사원이름  부서명');
    dbms_output.put_line('-----------------------------');
    dbms_output.put_line(v_eno||'  '||v_ename||'  '||v_dname);
END;
--------------------------------------------------------------------------------
-- 반복문 : LOOP문
--  1. 기본 LOOP문
--        LOOP
--            실행문1;
--            실행문2;
--            EXIT WHEN 조건;
--        END LOOP;

--  2. WHILE LOOP문
--    WHILE 조건   -- 조건이 true라면 반복
--    LOOP
--        실행문1;
--        실행문2;
--    END LOOP;

--  3.  FOR LOOP문
--    FOR 변수 IN [REVERSE] 시작값..끝값 
--    LOOP
--        실행문1;
--        실행문2;
--    END LOOP;  

-- 예제 구구단 3단을 출력하는 프로시저를 작성해 봅시다.
-- 1. 기본 LOOP문
DECLARE
    dan NUMBER := 3;
    i NUMBER := 1;
BEGIN
    dbms_output.put_line('*** '||dan||' 단 ***');
    LOOP
        dbms_output.put_line(dan||' X '||i||' = '||(dan*i));
        i := i+1;
        EXIT WHEN i>9;
--        IF i>9 THEN 
--            EXIT; --반복을 끝내라
--        END IF;
    END LOOP;
END;

-- 2. WHILE LOOP문
DECLARE
    dan NUMBER := 3;
    i NUMBER := 1;
BEGIN
    dbms_output.put_line('*** '||dan||' 단 ***');
    WHILE i<=9 LOOP
        dbms_output.put_line(dan||' X '||i||' = '||(dan*i));
        i := i+1;
    END LOOP;
END;

-- 3. FOR LOOP문
DECLARE
    dan NUMBER := 3;
BEGIN
    dbms_output.put_line('*** '||dan||' 단 ***');
    FOR i IN 1..9 LOOP
        dbms_output.put_line(dan||' X '||i||' = '||(dan*i));
    END LOOP;
END;

--------------------------------------------------------------------------------
--  커서 : SELELCT 의 결과가 여러 레코드로 나오는 경우 
--          각 레코드 단위로 처리하기 위한 도구

--  커서 사용법
--   1. 커서를 선언 [선언부] : SELECT문을 커서라는 변수에 담는다
--   2. 커서를 OPEN : 
--   3. 커서를 FETCH : 레코드 한 줄  읽어오기
--       레코드가 여러줄인경우 FETCH를 반복해서 읽어옴
--   4. 커서를 CLOSE

--  커서의 상태값
--    %NOTFOUND : 더이상 읽어올 레코드가 없는 경우 TRUE 반환

-- 예제 :  department 테이블의 모든 데이터를 출력하는 프로시저를 작성합니다.
SELECT * FROM department;

DECLARE
    v_dno department.dno%type;
    v_dname department.dname%type;
    v_loc department.loc%type;
    CURSOR c1
    IS
    SELECT * FROM department; --커서에서 INTO 구문은 사용하지 않는다.
BEGIN
    dbms_output.put_line('부서번호  부서명  지역명');
    dbms_output.put_line('----------------------------');
    OPEN c1;
    LOOP
        FETCH c1 INTO v_dno, v_dname, v_loc;
        EXIT WHEN c1%NOTFOUND;
        dbms_output.put_line(v_dno||' '||v_dname||' '||v_loc); 
    END LOOP;
    CLOSE c1;
END;

DECLARE
    v_dept department%rowtype;
    CURSOR c1
    IS
    SELECT * FROM department; --커서에서 INTO 구문은 사용하지 않는다.
BEGIN
    dbms_output.put_line('부서번호  부서명  지역명');
    dbms_output.put_line('----------------------------');
    OPEN c1;
    LOOP
        FETCH c1 INTO v_dept.dno , v_dept.dname, v_dept.loc;
        EXIT WHEN c1%NOTFOUND;
        dbms_output.put_line(v_dept.dno||' '||v_dept.dname||' '||v_dept.loc); 
    END LOOP;
    CLOSE c1;
END;

--  커서를 FOR LOOP 문을 이용해서 처리할 수 있다. => OPEN, FETCH, CLOSE 없이 처리
DECLARE
    v_dept department%rowtype;
    CURSOR c1
    IS
    SELECT * FROM department; --커서에서 INTO 구문은 사용하지 않는다.
BEGIN
    dbms_output.put_line('부서번호  부서명  지역명');
    dbms_output.put_line('----------------------------');
    FOR v_dept IN c1 LOOP
        dbms_output.put_line(v_dept.dno||' '||v_dept.dname||' '||v_dept.loc); 
    END LOOP;
END;









































































