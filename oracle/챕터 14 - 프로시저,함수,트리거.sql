-- 프로시저, 함수, 트리거
--  프로시저 : PL/SQL로 만들어진 기능의 덩어리

--  자주 사용하는 프로시저를 저장해서 사용해보자!
--   저장된 프로시저 (Stored Procedure)
--  일반 프로시저 => 이름을 붙이고 => 이름만 호출하면 프로시저가 동작되도록 하는 방법

--  스토어드 프로시저 문법
--  CREATE [OR REPLACE] PROCEDURE 프로시저이름(매개변수)
--  IS  {=DECLARE}
--     선언부
--  BEGIN
--     실행부
--  END;
SET SERVEROUTPUT ON;
-- 예시 : 이름이 SCOTT 인 사람의 이름과 급여를 출력하는 프로시저를 생성하세요.
CREATE OR REPLACE PROCEDURE scott_salary
IS
    v_ename employee.ename%type;
    v_salary employee.salary%type;
BEGIN
    SELECT ename,salary INTO v_ename, v_salary
    FROM employee
    WHERE ename = 'SCOTT';
    
    dbms_output.put_line(v_ename||'의 급여 : '||v_salary);
    
END;

-- 저장된 프로시저를 동작시키는 방법 : EXECUTE 프로시저 이름;
EXECUTE scott_salary;

-- 프로시저는 데이터 입출력기능을 가진다.
--   매개변수를 통해서 데이터를 입력, 출력
--      IN 입력, OUT 출력, INOUT 입출력
--  CREATE OR REPLACE PROCEDURE 프로시저 이름(변수이름 IN/OUT 타입)
--  IS

--  예시 :  사람 이름을 입력받아서 그 사람의 급여를 출력하는 프로시저를 만들어 봅시다.
CREATE OR REPLACE PROCEDURE sp_salary_ename(
    v_ename IN employee.ename%type
)
IS
    v_salary employee.salary%type;
BEGIN
    SELECT salary INTO v_salary
    FROM employee
    WHERE ename = v_ename;
    dbms_output.put_line(v_ename||'의 급여 : '||v_salary);
END;

EXECUTE sp_salary_ename('SCOTT');
EXECUTE sp_salary_ename('KING');

-- 
CREATE OR REPLACE PROCEDURE sp_salary_ename2(
    v_ename IN employee.ename%type,
    v_salary OUT employee.salary%type  -- 전역 변수를 바인딩해서 출력
)
IS
BEGIN
    SELECT salary INTO v_salary
    FROM employee
    WHERE ename = v_ename;
END;

-- 외부로 데이터를 저장할 전역 변수
VARIABLE v_salary NUMBER;
EXECUTE sp_salary_ename2('SCOTT',:v_salary);
PRINT v_salary;

--------------------------------------------------------------------------------
-- 함수 : 사용자 정의 함수
--   저장된 프로시저와 거의 유사(기능의 덩어리에 이름을 붙인 형태)
--   차이점 
--      프로시저는 기능을 '동작'
--      함수는 '결과'를 반환  => 단 하나의 결과만을 반환

-- 함수 문법
--  CREATE [OR REPLACE] FUNCTION 함수이름(매개변수)
--   반환타입
--  IS  {=DECLARE}
--     선언부
--  BEGIN
--     실행부
--  END;

-- 예시 : 사원 이름을 입력받아서 급여를 출력하는 함수를 만들어봅시다.
CREATE OR REPLACE FUNCTION fn_salary_ename(
    v_ename IN employee.ename%type
)
    RETURN number
IS
    v_salary employee.salary%type;
BEGIN
    SELECT salary INTO v_salary
    FROM employee
    WHERE ename = v_ename;
    
    RETURN v_salary;
END;

VARIABLE v_salary2 NUMBER;
EXECUTE :v_salary2 := fn_salary_ename('SCOTT');
PRINT v_salary2;

-- 진짜 함수의 용도
CREATE OR REPLACE FUNCTION fn_anisal(
    v_ename IN employee.ename%type
)
    RETURN NUMBER
IS
    v_salary employee.salary%type;
    v_commission employee.commission%type;
    v_anisal NUMBER;
BEGIN
    SELECT salary, commission INTO v_salary, v_commission
    FROM employee
    WHERE ename = v_ename;
    
    IF v_commission IS NULL THEN
        v_anisal := v_salary *12;
    ELSIF v_commission IS NOT NULL THEN
        v_anisal := v_salary *12 + v_commission;
    END IF;
    RETURN v_anisal;
END;

SELECT eno, ename, salary, commission, fn_anisal(ename) AS "연봉"
FROM employee;

--------------------------------------------------------------------------------
-- 트리거
--    프로시저와 유사하다.
--  차이점
--    프로시저는 EXECUTE 명령어를 통해서 동작
--    트리거는 이벤트(DML)가 발생했을 때 자동으로 동작되는 프로시저
-- 
--  트리거의 특징은 DML 구문에 붙여서 동작하도록 작성된 프로시저

--  트리거의 종류
--    동작 시점
--      BEFORE 트리거 :  이벤트 동작 직전에 작동하는 트리거
--      AFTER 트리거 :  이벤트가 동작된 직후에 작동하는 트리거

-- 실습용 테이블
CREATE TABLE dept_orgin
AS
SELECT * FROM department WHERE 0=1;
DROP TABLE dept_copy;
CREATE TABLE dept_copy
AS
SELECT * FROM department WHERE 0=1;

-- 트리거 예제 : origin 테이블에 DML에 동작하면 트리거가 동작하도록 만들어 봅시다.
CREATE OR REPLACE TRIGGER tr_dept_insert
    AFTER INSERT
    ON dept_orgin
    FOR EACH ROW  -- 각 행(레코드)마다 적용
BEGIN
    IF inserting THEN
        dbms_output.put_line('Insert 트리거 발생');
        INSERT INTO dept_copy
        VALUES(:new.dno,:new.dname,:new.loc);
    END IF;
END;

INSERT INTO dept_orgin
VALUES(10, 'ACCOUNTING','NEW YORK');

SELECT * FROM dept_orgin;
SELECT * FROM dept_copy;


-- copy 테이블에 기록을 남기는 컬럼 추가
ALTER TABLE dept_copy
 ADD modtype NCHAR(2);

-- 변경 삭제 트리거
CREATE OR REPLACE TRIGGER tri_dept_dml
    AFTER UPDATE OR DELETE
    ON dept_orgin
    FOR EACH ROW
DECLARE
    v_modType NCHAR(2);
BEGIN
    IF updating THEN
        dbms_output.put_line('Update 트리거 발생');
        v_modType := '수정'; 
    ELSIF deleting THEN
        dbms_output.put_line('Delete 트리거 발생');
        v_modType := '삭제';
    END IF;
    
    INSERT INTO dept_copy
    VALUES(:OLD.dno, :OLD.dname, :OLD.loc ,v_modType);
    
END;

UPDATE dept_orgin 
SET dno=30, dname='SALES', loc='CHICAGO'
WHERE dno = 10;

SELECT * FROM dept_orgin;
SELECT * FROM dept_copy;

DELETE dept_orgin
WHERE dno=30;

SELECT * FROM dept_orgin;
SELECT * FROM dept_copy;






















