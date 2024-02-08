-- 시퀀스 : 번호 자동 발급 프로그램
--   기본키 : 
--      -- 하나의 레코드를 식별할수 있어야 하며, 실제 데이터와 연결성없어야 한다.
--     시퀀스로 발급받은 번호를 이용해서 기본키 데이터를 구성하는 것이 일반적

-- 시퀀스 만드는 방법
-- CREATE SEQUENCE seq_sample;

-- 시퀀스에 옵션
--  START WITH 숫자 : 시작번호   -> 기본값 1
--  INCREMENT BY 숫자 : 증가값   -> 기본값 1
--  MAXVALUE 숫자:시퀀스가 가지는 최대값
--  cycle / nocycle : 최대값까지 시퀀스가 증가 했을 때 다음 숫자 발급은 어떻게 할 것인가?
--     cycle :  시퀀스값이 처음부터 다시 발급
--     nocycle : 시퀀스가 더이상 번호를 발급하지 않고 종료 => 추가 발급 요청이 에러
--  cache / nocache : 
--   cache : 성능을 위해서 번호를 미리 뽑아두는 것
--   nocache : 번호를 미리 뽑지 않고 순차적으로 뽑는것

CREATE SEQUENCE seq_sample
START WITH 10
INCREMENT BY 2
MAXVALUE 20
NOCYCLE
NOCACHE;
--------------------------------------------------------------------------------
-- 만들어진 시퀀스를 어떻게 사용하는가??
--  두가지를 번호를 제공
--   시퀀스이름.currval : 마지막으로 뽑혔던 번호를 확인하는 기능
--        --> 한번도 시퀀스를 사용해서 번호를 뽑은 적이 없다면 에러발생
--   시퀀스이름.nextval : 새로운 번호를 뽑는 기능

 SELECT seq_sample.nextval FROM dual;
SELECT seq_sample.currval FROM dual;

--  시퀀스를 변경하고 싶다면
ALTER SEQUENCE seq_sample
MAXVALUE 100;
--  START WITH는 변경 불가 :이미 사용중인 시퀀스의 시작값을 변경할 수 없다.

DROP SEQUENCE seq_sample;

--------------------------------------------------------------------------------
-- 시퀀스의 실사용 예제
CREATE TABLE member8(
    userNo NUMBER PRIMARY KEY,
    userId VARCHAR2(20),
    userPwd VARCHAR2(20)
);
CREATE SEQUENCE seq_member8
NOCACHE;

INSERT INTO member8
VALUES(seq_member8.nextval,'hong','1234');
INSERT INTO member8
VALUES(seq_member8.nextval,'kim','1234');
INSERT INTO member8
VALUES(seq_member8.nextval,'lee','1234');
INSERT INTO member8
VALUES(seq_member8.nextval,'park','1234');
INSERT INTO member8
VALUES(seq_member8.nextval,'jang','1234');

SELECT * FROM member8;









