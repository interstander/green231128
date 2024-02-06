-- Cp4 데이터 조작어 : DML
-- 데이터 삽입, 수정, 삭제

--  데이터(레코드) 삽입
--    기본 문법 : INSERT INTO 테이블명(컬럼명1,컬럼명2....) 
--                            VALUES(데이터1,데이터2...);

--    응용 문법 : INSERT INTO 테이블명
--                            VALUES(데이터1,데이터2...);
DESC employee;
INSERT INTO employee(job,eno,dno,commission,manager,ename,hiredate,salary)
              VALUES('CLERK',8121,10,100,7788,'ALICE',sysdate,1200);
              
INSERT INTO employee
              VALUES(8231,'KATHERINE','SALESMAN',7698,sysdate,1750,800,30);

COMMIT;
SELECT * FROM employee;

--  데이터 삽입시 값을 모르거나 입력받지 않은 경우 :  null
INSERT INTO employee(eno)
              VALUES(8500);  -- eno이외의 컬럼에는 데이터를 넣지 않겠다. => null
INSERT INTO employee(eno,ename)
              VALUES(8600,'');             
INSERT INTO employee(eno,ename)
              VALUES(8700,null);         
-- 제약조건 : 컬럼데이터에 이런 데이터를 저장하지 마세요!!
--         NOT NULL => null 값을 저장하지 마세요!
              
--  데이터 : 숫자, 문자, 날짜
--  날짜 데이터를 저장하는 방법 : 날짜 변환 함수 : TO_DATE(문자열, 형식)
INSERT INTO employee(eno,ename,hiredate)
              VALUES(8800,'',TO_DATE('2023-07-12','YYYY-MM-DD'));
INSERT INTO employee(eno,ename,hiredate)  -- 날짜 자동 형변환 형식 : YYYY/MM/DD
              VALUES(8900,'','2023/07/12');
INSERT INTO employee(eno,ename,hiredate)  -- 현재 날짜와 시간 : sysdate
              VALUES(8950,'',sysdate);    --  DBMS가 설치된 운영체제가 제공하는 현재시간

-- 서브쿼리를 이용해서 데이터 삽입하는 방법
CREATE TABLE emp2
AS SELECT * FROM employee WHERE 10=14;

COMMIT;
SELECT * FROM emp2;

INSERT INTO emp2
SELECT * FROM employee ;   -- 다중행 입력 기능이 존재한다.

TRUNCATE TABLE emp2;

INSERT INTO emp2(eno,ename,salary)
          SELECT eno,ename,salary FROM employee WHERE salary >= 1000;
          --     컬럼 정보를 작성하면 컬럼에 맞게 데이터가 삽입된다.
          
--------------------------------------------------------------------------------
-- 데이터 수정
--   기본 문법 : UPDATE 테이블명 SET 컬럼명1=수정데이터1, 컬럼명2=수정데이터2... WHERE 조건;
--      => 조건에 해당하는 레코드들의 컬럼데이터를 수정하세요!
--      => 조건이 없다면 모든 레코드 전체 수정

CREATE TABLE emp3
AS SELECT * FROM employee;

COMMIT;
SELECT * FROM emp3;

UPDATE emp3 SET ename='RUNA', job='MANAGER'
WHERE eno=8500;

UPDATE emp3 SET commission=500;

--------------------------------------------------------------------------------
--  데이터(레코드) 삭제
--    기본 문법 : DELETE FROM 테이블명 WHERE 조건;
--       조건에 해당하는 레코드를 삭제하세요.
--       => 조건이 없다면 모든 레코드를 삭제하세요.
CREATE TABLE emp4
AS SELECT * FROM employee;

COMMIT;
SELECT * FROM emp4;

DELETE FROM emp4 WHERE ename='ALICE';
DELETE FROM emp4; 

--------------------------------------------------------------------------------
-- 트랜젝션 : 논리적인 작업의 단위를 묶어주는 기능
--             => 데이터의 일관성을 추구한다.
--    DDL, DCL은 트랜젝션 X
--    DML : 물리적인 작업의 단위
--      -> DML하나 이상의 명령으로 트랜젝션이 구성
--
--     => DBMS는 데이터 일관성을 유지하기 위해 ALL-or-Nothing 방식으로 처리
--             => 물리적 작업이 하나만 잘못되어도 모든 물리적작업을 취소시키는 방식

-- 트랜젝션을 관리하는 쿼리문
--   COMMIT; : 모든 작업을 정상 완료하고 처리과정을 확정하는 명령
--        -- 모든 처리 결과에 대해서 데이터베이스에 실제 반영되고 영구 저장처리
--        -- 하나의 트랜젝션 완료

--   ROLLBACK; : 작업중 문제가 발생한 경우 트랜젝션 시작 이전 상태로 되돌리기
--        -- 트랜젝션 취소

CREATE TABLE emp5
AS SELECT * FROM employee;

SELECT * FROM emp5 ORDER BY dno;
-- 가상의 상황 dno가 10번이 부서를 삭제하고자 한다.
DELETE FROM emp5;  --> 전체 데이터 삭제
WHERE dno=10;

ROLLBACK;-- > 마지막 커밋 시점으로 복귀

DELETE FROM emp5
WHERE dno=10;

COMMIT;
DESC department;










