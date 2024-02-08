-- 무결성 : 결함이 없는 성질 => 각 컬럼의 데이터가 결점없이 저장되어야 한다.
--                                          중복, 누락
-- 무결성의 종류
--    개체무결성 : 하나 이상의 레코드를 식별할 수 있는 식별자가 있어야 한다.
--    참조무결성 : 참조관계의 테이블이 항상 일관된 값을 가져야 한다. 
--  도메인무결성 : 컬럼의 데이터는 지정된 범위의 값만 가져야 한다.

--  무결성을 지키기 위해서 어떻게 해야하나?
--    컬럼에 지정하는 '제약조건' : 각 컬럼에 적절한 데이터가 들어가도록 '제약'을 거는 것!

-- 오라클에서 지정하는 제약 조건
--  1) UNIQUE : 유일한 것(중복을 허용하지 않겠다) => NULL은 허용
--  2) NOT NULL : 빈칸을 허용하지 않겠다!
--  3) CHECK : 조건을 지정해서 조건에 맞는 데이터만 저장하도록 하는 제약조건
--  4) PRIMARY KEY : 기본키 : 중복을 허용하지 않는다 + 빈칸도 허용하지 않는다.
--         => 역할 : 테이블에서 레코드를 식별하기 위한 목적 
--             -> 반드시 테이블에는 기본키를 가진 컬럼이 존재해야 한다.
--             -> [설계] 기본키를 가지는 컬럼은 실제 데이터와 관련성이 없어야 한다.
--  5) FOREIGN KEY : 외래키 : 참조되는 테이블에 데이터가 있어야지만 저장 가능하다
--             -> 참조 데이터가 없으면 저장하지 마세요.
--             -> 테이블간에 관계 형성에 중요한 역할 가지는 제약조건
--             -> 참조되는 테이블(부모테이블) -> 참조되는 컬럼은 UNIQUE,PriMARY KEY여야만 한다.

--------------------------------------------------------------------------------
CREATE TABLE member1(
    memberId VARCHAR2(20),
    memberName VARCHAR2(20),
    memberPassword VARCHAR2(20),
    CONSTRAINT member1_id_uk UNIQUE(memberId) -- 원칙
);

CREATE TABLE member2(
    memberId VARCHAR2(20) CONSTRAINT member2_id_uk UNIQUE,  --변칙
    memberName VARCHAR2(20),
    memberPassword VARCHAR2(20)
);

CREATE TABLE member3(
    memberId VARCHAR2(20) UNIQUE,  --단순(제약조건의 이름이 임의의 이름이 붙는다.)
    memberName VARCHAR2(20),
    memberPassword VARCHAR2(20)
);

INSERT INTO member3
VALUES('asdf','hong','1234');

SELECT * FROM member3;

INSERT INTO member3
VALUES('asdf','park','1234');
INSERT INTO member3
VALUES(null,'park','1234');

---------------------------------------------------------------------------------
DROP TABLE member4;
CREATE TABLE member4(
    memberId VARCHAR2(20) CONSTRAINT member4_id_nn NOT NULL,
    memberName VARCHAR2(20) NOT NULL,
    memberPassword VARCHAR2(20) DEFAULT '1234' -- 입력하지 않으면 기본값으로 1234를 사용하세요.
);

INSERT INTO member4
VALUES(null,'hong','1234');
INSERT INTO member4
VALUES('asdf',null,'1234');
INSERT INTO member4 (memberId,memberName)
VALUES('asdf','hong');

SELECT * FROM member4;
---------------------------------------------------------------------------------
CREATE TABLE member5(
    memberId VARCHAR2(20),
    memberName VARCHAR2(20),
    memberPassword VARCHAR2(20),
    memberKorScore NUMBER(3), 
    memberEngScore NUMBER(3)CONSTRAINT member5_es_chk CHECK(0<=memberEngScore AND memberEngScore <= 100),
    memberMathScore NUMBER(3) CHECK(0<=memberMathScore AND memberMathScore <= 100),
    CONSTRAINT member5_ks_chk CHECK(0<=memberKorScore AND memberKorScore <= 100)
);
SELECT * FROM member5;
INSERT INTO member5 (memberKorScore)
VALUES(75);
INSERT INTO member5 (memberKorScore)
VALUES(175);
INSERT INTO member5 (memberKorScore)
VALUES(-75);

--------------------------------------------------------------------------------
CREATE TABLE board1(
    boardNum NUMBER,  -- 글번호는 글 내용하고 아무 상관이 없는 내용 -> 관리하기 위해 사용되는 컬럼
    title VARCHAR2(100),-- CONSTRAINT board1_boardNum_pk PRIMARY KEY,
    writer VARCHAR2(100),-- PRIMARY KEY,
    content CLOB,
    CONSTRAINT board1_boardNum_pk PRIMARY KEY(boardNum)
);

INSERT INTO board1
VALUES (1,'asdf','hong',null);
INSERT INTO board1
VALUES (1,'asdf','hong',null);  --  중복 에러
INSERT INTO board1
VALUES (null,'asdf','hong',null);--  공백 에러


SELECT * FROM user_constraints;

--------------------------------------------------------------------------
CREATE TABLE member6(
    memberId VARCHAR2(20) PRIMARY KEY,
    memberName VARCHAR2(20),
    memberPassword VARCHAR2(20)
);

CREATE TABLE board6(
    boardNum NUMBER,  
    title VARCHAR2(100),
    writer VARCHAR2(100),
    content CLOB,
    CONSTRAINT board6_writer_fk FOREIGN KEY(writer) REFERENCES member6(memberId)
);

INSERT INTO board6
VALUES(1,'1번글','asdf','1번글내용');

INSERT INTO member6
VALUES('asdf','hong','1234');
--  조인할 때 기준이 되는 것이 주로 외래키를 기준으로 조인하게 된다.
--------------------------------------------------------------------------------
-- 제약조건을 수정하는 경우
--  외래키의 경우는 다른 테이블을 참조하는 형식이므로 
--    외래키 테이블 생성후 추가하는 방식으로 작성

-- 제약조건은 컬럼의 데이터입력을 제한
--  ALTER 쿼리를 이용해서 제약조건을 수정,삭제
--ALTER TABLE 테이블명
--     ADD 제약조건 추가
--     MODIFY 제약조건 변경
--     DROP 제약조건 삭제
     
CREATE TABLE member7(
    memberId VARCHAR2(20),
    memberName VARCHAR2(20),
    memberPassword VARCHAR2(20)
);

CREATE TABLE board7(
    boardNum NUMBER,  
    title VARCHAR2(100),
    writer VARCHAR2(100),
    content CLOB
);
     
-- 외래키 추가  -> 기본키,유니크가 아니면 외래키 지정 불가
ALTER TABLE board7
    ADD CONSTRAINT board7_writer_fk FOREIGN KEY(writer) REFERENCES member7(memberId);

-- 기본키
ALTER TABLE board7
    ADD CONSTRAINT board7_num_pk PRIMARY KEY(boardNum);
ALTER TABLE member7
    ADD CONSTRAINT member7_id_pk PRIMARY KEY(memberId);
     
-- 제약조건 변경 -NOT NULL
ALTER TABLE member7
    MODIFY memberPassword CONSTRAINT member7_pwd_nn NOT NULL;
     
-- 제약조건을 확인하는 방법
--    데이터 사전 : 메타 데이터가 저장되는 공간
--        제약조건이 저장된 사전 : user_CONSTRAINTS

SELECT * FROM USER_CONSTRAINTS;

-- 제약조건 삭제
---  제약조건 이름으로 삭제
ALTER TABLE member7
    DROP CONSTRAINT member7_pwd_nn;

-- 예외
--    NOT NULL  => NULL을 허용하겠다.
ALTER TABLE member7
    MODIFY memberPassword NULL;  -- NULL 허용

--   PRIMARY KEY  
ALTER TABLE board7
    DROP CONSTRAINT board7_num_pk;
ALTER TABLE board7
    DROP PRIMARY KEY;
    
------------------------------------
ALTER TABLE member7
    DROP PRIMARY KEY;   --  Board7의 writer 컬럼이 외래키로 참조하고 있기 때문에 삭제불가

-- 기본키 삭제하기 위해서 외래키부터 삭제하고 기본키를 삭제해야 함.
--   기본키에 걸려있는 외래키가 엄청 많은 경우

ALTER TABLE member7
    DROP PRIMARY KEY CASCADE;  -- CASCADE 옵션은 연결된 외래키까지 모두 삭제하세요.














