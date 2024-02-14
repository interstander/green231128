-- 사용자 권한
--  터미널 작업(명령 프롬프트)
--   DBMS 접속 방법
--   >> SQLPLUS

--   계정 전환
--   >> CONN 계정명
--   >> 비밀번호;
--
--   현재 접속 계정 확인
--   >> SHOW user;
--------------------------------------------------------------------------------
--   [system 계정]
ALTER SESSION  SET "_ORACLE_SCRIPT"=TRUE; 

--  계정 생성
CREATE USER "TEST01" IDENTIFIED BY "1234";

-- 접속 오류 => CREATE SESSION 권한이 없기 때문에

-- 접속 권한 부여
GRANT CREATE SESSION TO "TEST01";

-- 권한이 없어서 테이블 생성 불가

-- 테이블 생성 권한을 부여
GRANT CREATE TABLE,CREATE VIEW TO "TEST01";

-- 계정에 테이블 스페이스 할당
ALTER USER "TEST01" QUOTA 200M ON USERS;
ALTER USER "TEST01" DEFAULT TABLESPACE USERS;

ALTER USER "TEST01" QUOTA UNLIMITED ON USERS;

-- 비밀번호 변경
ALTER USER "TEST01" IDENTIFIED BY "1234";

-- 계정 접속시 비밀번호가 틀리는 경우 일정회수가 틀리면 계정 잠긴다.
-- 잠긴 계정을 푸는 방법
ALTER USER "TEST01" ACCOUNT UNLOCK;

-- 이미 부여한 권한 제거
REVOKE CREATE SESSION FROM "TEST01";

--------------------------------------------------------------------------------
CREATE USER "TEST02" IDENTIFIED BY "1234";
CREATE USER "TEST03" IDENTIFIED BY "1234";

GRANT CREATE SESSION TO "TEST02";
GRANT CREATE SESSION TO "TEST03";

-- 권한 정보를 묶어서 처리하는 롤 권한
GRANT CONNECT,RESOURCE,DBA TO "TEST01";

-- 사용자도 직접 ROLE 권한을 생성해서 사용 가능
CREATE ROLE roleTest01;

-- 사용자 생성 롤에 필요한 권한을 부여한다.
GRANT CREATE SESSION, CREATE TABLE, SELECT ANY TABLE TO roleTest01;

GRANT roleTest01 TO "TEST01";

-- 롤에 대한 정보도 데이터사전
SELECT * FROM role_sys_privs
WHERE role LIKE '%TEST%';

--------------------------------------------------------------------------------
--   [GREEN 계정]
SELECT * FROM employee;
-- 다른 계정에게 조회 권한 부여하도록 합니다.
GRANT SELECT ON employee TO "TEST01";

-- 권한을 부여할 때 추가하는 옵션
--  WITH GRANT OPTION : 제3자에게 권한을 줄수있는 권한까지 부여
REVOKE SELECT ON employee FROM "TEST01";

-- 계정 TEST02, TEST03
-- TEST02 + WITH GRANT OPTION   =>  TEST01에게 권한 부여
-- TEST03 X                     =>  TEST01에게 권한 부여
GRANT SELECT ON employee TO "TEST02" WITH GRANT OPTION;
GRANT SELECT ON employee TO "TEST03";

-- PUBLIC : 같은 DBMS를 사용하는 모든 스키마에게 권한을 부여하는 것
GRANT SELECT ON department TO PUBLIC;

-- 특정 객체에 대한 권한도 사용자 정의 롤에 부여할 수 있다
GRANT INSERT ON department TO roleTest01;

-- 내 계정이 부여받은 롤 정보
SELECT * FROM user_role_privs;

--------------------------------------------------------------------------------
--   [TEST01 계정]
CREATE TABLE department(
    dno NUMBER,
    dname VARCHAR2(15)
);
-- 권한이 없으므로 에러 발생

-- 테이블 생성 권한부여후
CREATE TABLE department(
    dno NUMBER,
    dname VARCHAR2(15)
);

---  실제 데이터는 하드디스크에 저장되므로 
--   계정이 디스크 공간의 일부를 할당받아야 한다.
--          테이블 스페이스

---------------------------------------------------------------------------------
SELECT * FROM GREEN.employee;  -- 다른 스키마의 테이블은 기본적으로 조회 권한이 없다.
-- 테이블 가진 스키마로부터 조회 권한을 받으면 그때부터 조회 가능

-- 내 계정이 가지는 권한 확인방법
SELECT * FROM session_privs;

SELECT * FROM GREEN.department;

--------------------------------------------------------------------------------
--   [TEST02 계정]
SELECT * FROM GREEN.employee;

-- 
GRANT SELECT ON GREEN.employee TO "TEST01";

SELECT * FROM GREEN.department;

--------------------------------------------------------------------------------
--   [TEST03 계정]
SELECT * FROM GREEN.employee;

GRANT SELECT ON GREEN.employee TO "TEST01";

SELECT * FROM GREEN.department;