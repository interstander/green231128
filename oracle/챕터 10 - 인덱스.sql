-- 인덱스
--   주로 데이터를 빠르게 검색할 때 도움을 주는 도구
--   주로 컬럼에 붙여서 컬럼 데이터를 통해 검색할 때 사용

--   인덱스를 사용할 때 장단점
--     장점 : 빠른 검색에 도움, 시스템 부하 감소로 성능 향상
--     단점 : 활용 공간 감소(10%), 
--         처음 인덱스를 만들거나 데이터가 자주 추가,변경되는 상황에는
--         새로운 인덱싱 작업이 필요하므로 성능저하

--   기본키 : 특정 레코드를 식별해주는 역할
--      => 자동적으로 인덱스가 생성된다!

--  실제 인덱스 생성 방법
--   인덱스 정보를 확인
SELECT index_name, table_name, column_name
FROM user_ind_columns
WHERE table_name IN ('EMPLOYEE','DEPARTMENT');

--  EMPLOYEE 테이블에 ename 컬럼에 인덱스를 추가해 봅시다.
CREATE INDEX idx_employee_ename
ON employee(ename);

--  인덱스를 삭제하기
DROP INDEX idx_employee_ename;

----------------------------------------
CREATE TABLE emp_idx
AS SELECT  eno, ename FROM employee;

SELECT ROWID,eno, ename FROM employee ORDER BY eno ASC;

ALTER TABLE emp_idx
ADD CONSTRAINT emp_eno_pk PRIMARY KEY(eno);

SELECT eno, ename 
FROM employee 
WHERE eno = 7788
ORDER BY eno ASC;
--------------------------------------------------------------------------------
