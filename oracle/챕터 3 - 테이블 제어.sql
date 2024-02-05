-- [06] 테이블 제어(DDL)
--   객체에 관련된 쿼리문
--     테이블, 뷰, 인덱스...

-- (생성)  :  CREATE 객체종류 이름(~~~);
--   테이블을 생성할 때 필요한 정보
--     1) 테이블 이름
--          - 문자로 시작해야 하며 30자이내 작성을 권장
--          - 이름 중간에 숫자나 특수문자($,_#)이 들어갈 수 있다.
--          - 스키마에 테이블명이 중복 사용될 수 없다.
--          - 대소문자를 구분하지 않는다(가급적 소문자로 작성하는 것을 권장)
--     2) 테이블을 구성하는 컬럼의 이름, 컬럼의 데이터 타입
--     3) 각 컬럼에 적용할 무결성 제약조건

CREATE TABLE 테이블이름(
    컬럼이름 데이터타입,
    컬럼이름 데이터타입,
    컬럼이름 데이터타입
);

--  데이터 타입은 어떤 종류가 있는가?
--  오라클에서 지원하는 데이터 형식 : 숫자, 문자열, 날짜(시간), 이진
--  1) 숫자 타입
--        number : 자리수 38자리까지의 숫자를 나타낼수 있다. - 22바이트 가변길이로 저장
--        number(n) : 자리수 n자리까지의 숫자를 지정할 수 있다 n=4 : 0000 : 고정길이 성능↑
--        number(n,m) : 자리수 n자리까지의 숫자를 지정, 소수점 이하 m자리까지 표기 가능
--                         ->  소수점 자리까지 포함
--         number(3,2)   123.45 (X) 
--         number(5,2)   123.45 (O)

--   2) 문자열 타입
--       char(n) :  고정길이 문자열 n글자만큼 저장(1~2000) :  영문기준
--         char(10) : 한글(3바이트) => 3글자
--       varchar2(n) : 가변길이 문자열 n글자만큼 저장(1~4000) :  영문기준
--       nchar(n) : 고정길이 유니코드 문자열 n글자만큼 저장(1~2000)
--         nchar(10) : 한글(3바이트) => 10글자
--       nvarchar2(n) : 가변길이 유니코드 문자열 n글자만큼 저장 (1~

--   3) 대용량 데이터 타입 :   LOB
--      CLOB : 대용량 텍스트 데이터를 저장할수 있는 공간(128TB)
--      NCLOB : 대용량 유니코드 텍스트 데이터를 저장할 수 있는 공간
--      BLOB : 대용량 이진 데이터를 저장할수 있는 공간 (128TB)

--   4) 날짜와 시간
--      date : 날짜를 연,월,일, 시, 분, 초 단위로 저장하는 데이터 타입
--      timestamp : date하고 유사 + 초를 밀리초까지 저장 가능

--   5) 기타 데이터
--      RAWID : 데이터 저장시 자동으로 부여되는 번호를 저장하기 위한 타입
--------------------------------------------------------------------------------
-- 테이블 생성
--   테이블명 : memberTbl
--                    컬럼명            : 타입        : 크기
--   컬럼1 : 아이디  : memberId          : char       : 13
--   컬럼2 : 비밀번호 : memberPassword   : varchar2    : 50
--   컬럼3 : 이름     : memberName       : nvarchar2  : 10
--   컬럼4 : 나이     : memberAge        : number     :  3
--   컬럼5 : 생일     : memberBirth      : date       : 

CREATE TABLE memberTbl(
    memberId CHAR(13),
    memberPassword VARCHAR2(50),
    memberName NVARCHAR2(10),
    memberAge NUMBER(3),
    memberBirth DATE
);
-- 테이블 구조를 확인할 때 DESC
DESC memberTbl;

--------------------------------------------------------------------------------
--  (변경) : ALTER 객체종류 객체이름~~;
--     테이블의 구조
--             컬럼 형태를 변경 (컬럼를 추가, 컬럼의 내용, 이름을 변경, 컬럼를 삭제)
--     1) 컬럼 추가 : ADD
ALTER TABLE memberTbl
    ADD (korScore NUMBER(3));

--     2) 컬럼 변경(이름, 타입, 제약조건)
--          이름 변경 : RENAME COLUMN 기존컬럼명 TO 바꿀 컬럼명
ALTER TABLE memberTbl
    RENAME COLUMN korScore TO engScore;
--          타입(제약조건) 변경 : MODIFY  컬럼명 바꿀타입
ALTER TABLE memberTbl
    MODIFY memberId VARCHAR2(15);

--     3) 컬럼의 삭제
--           DROP COLUMN 컬럼명;  => 삭제시 일반적인 방법으로는 복구가 안되므로 신중할 필요가 있다.
--                => 컬럼에 포함된 데이터가 많은 경우 과도한 부하를 생성해서 DB 환경에 악영향을 줄수 있다.
ALTER TABLE memberTbl
    DROP COLUMN engScore;
--           부하 방지 방법 : 컬럼을 사용하지 않음으로 지정 => 나중에 삭제
--                컬럼 미사용 : SET UNUSED (컬럼명)
--                사용하지 않는 컬럼 삭제 : DROP UNUSED COLUMNS;
ALTER TABLE memberTbl
    SET UNUSED(memberAge);
ALTER TABLE memberTbl
    DROP UNUSED COLUMNS;

--  (이름변경) 테이블 이름 자체를 변경
--       RENAME  테이블명 TO  바꿀 테이블명
RENAME memberTbl TO memberTbl2;

DESC memberTbl;
DESC memberTbl2;

--   (삭제) 테이블 삭제 
--      DROP 객체종류 이름;  => 언제 사용?   -=> 데이터가 많으면 삭제시 과부하가 발생
DROP TABLE memberTbl2;

--      보다 빠르게 삭제하는 방법 : TRUNCATE TABLE 테이블 명
--          테이블 구조만 남기고 데이터를 잘라내는 방법
TRUNCATE TABLE memberTbl;

--------------------------------------------------------------------------------
--  테이블 생성하고 변경하는 작업은 프로젝트 초반에 코딩 들어가기 전에 마무리
--     자바에서 CREATE, ALTER, DROP명령을 사용할 일이 없다!
--------------------------------------------------------------------------------
-- SELECT문의 결과 => 테이블 형태로 데이터를 출력한다.!
SELECT ename, salary, job
FROM employee;

--  SELECT문의 조회 결과를 테이블로 생성 가능
CREATE TABLE emp10
AS SELECT ename, salary, job     --  뷰
    FROM employee;

SELECT * FROM emp10;

--  SELECT문의 조회되는 컬럼명 그대로 새로운 테이블의 컬럼명으로 사용이 가능하다.
DESC emp10;

--  별칭을 지어주는 경우 새로운 테이블의 컬럼명으로 사용가능
CREATE TABLE emp20
AS SELECT ename AS "사원명",
          salary AS "급여",
          job AS "담당업무"
    FROM employee;

DESC emp20;

--  SELECT문으로 조회하는 데이터가 함수나 수식이라면 반드시 별칭을 만들어주어야 한다.
CREATE TABLE emp30
AS SELECT ename, salary, job, salary*12 AS "연봉"
    FROM employee;

DESC emp30;

SELECT * FROM emp30;

--  테이블 구조만 복사하고 데이터를 복사하지 않는 방법
CREATE TABLE emp40
AS SELECT * 
    FROM employee
    WHERE 0=1;  -- 무조건 거짓이 나오도록만 조건을 만들면 된다.

SELECT * FROM emp40;

































