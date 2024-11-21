---------------------------
-- DCL and DDL
---------------------------
-- root 계정으로 수행

-- 사용자 생성
CREATE USER 'testuser'@'localhost' IDENTIFIED BY 'test';

-- 사용자 수정
ALTER USER 'testuser'@'localhost' IDENTIFIED BY 'abcd';

-- 사용자 삭제
DROP USER 'testuser'@'localhost';

-- 사용자 생성(다시)
CREATE USER 'testuser'@'localhost' IDENTIFIED BY 'test';

-- 접속 후 계정 정보 확인
SELECT CURRENT_USER;


------------------------
-- GRANT / REVOKE
------------------------
-- 권한 (Privilege)
-- 특정 작업을 수행할 수 있는 권리

-- 권한을 부여하는 작업을 GRANT
-- 권한을 회수하는 작업을 REVOKE 

SHOW GRANTS;	-- 권한의 확인
SHOW GRANTS FOR CURRENT_USER;	-- 현재 유저에게 부여된 권한들
SHOW GRANTS FOR 'testuser'@'localhost';	-- 특정 유저의 권한

-- testuser에게 hrdb 스키마의 모든 테이블 조회 권한
GRANT SELECT ON hrdb.* TO 'testuser'@'localhost';	-- 권한 부여
REVOKE SELECT ON hrdb.* FROM 'testuser'@'localhost';	-- 권한 회수


-------------------------
-- ROLE
-------------------------
-- ROLE을 활용하면 특정 권한의 묶음을 일괄적으로 적용, 회수할 수 있음
CREATE ROLE READER;	-- 역할의 생성
GRANT SELECT ON hrdb.* TO READER;	-- hr스키마의 모든 객체의 SELECT 권한을 READER에게 부여

CREATE ROLE AUTHOR;
GRANT SELECT, INSERT, UPDATE, DELETE ON hrdb.* TO AUTHOR;
-- SELECT, INSERT, UPDATE, DELETE는 모든 권한: ALL

CREATE ROLE EDITOR;
GRANT SELECT, UPDATE ON hrdb.* TO EDITOR;

-- ROLE에게 부여된 GRANT 확인
SHOW GRANTS FOR READER;
SHOW GRANTS FOR AUTHOR;
SHOW GRANTS FOR EDITOR;

-- 권한을 묶음으로 관리할 수 있어서 편하다
GRANT READER TO 'testuser'@'localhost';
REVOKE READER FROM 'testuser'@'localhost';
GRANT AUTHOR TO 'testuser'@'localhost';

-- ROLE에 의해 부여된 권한 확인
SHOW GRANTS FOR 'testuser'@'localhost' USING READER;
SHOW GRANTS FOR 'testuser'@'localhost' USING AUTHOR;

-- ROLE 삭제
DROP ROLE READER;
DROP ROLE AUTHOR;
DROP ROLE EDITOR;

-- CREATE: DB 객체 생성 키워드 
-- ALTER: DB 객체 수정 키워드 
-- DROP: DB 객체 삭제 키워드 


-------------------------
-- DDL
-------------------------
-- 데이터베이스(스키마 생성과 삭제)
CREATE DATABASE test_db;	-- 기본 생성법
DROP DATABASE test_db;		-- 데이터베이스 삭제

CREATE DATABASE test_db DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

-- 현재 선택된 데이터베이스 확인
SELECT DATABASE();

-- 데이터베이스 사용 
SELECT DATABASE();

-- 여기서부터는 testuser로 진행 
DROP USER 'testuser'@'localhost';
CREATE USER 'testuser'@'localhost' IDENTIFIED BY 'test';
GRANT ALL PRIVILEGES ON test_db.* TO 'testuser'@'localhost';
GRANT SELECT ON hrdb.* TO 'testuser'@'localhost';

-- 테이블 생성 CREATE TABLE
CREATE TABLE book (
	book_id INTEGER,
    title VARCHAR(50),
    author VARCHAR(20),
    pub_date DATETIME DEFAULT CURRENT_TIMESTAMP);
    
-- 테이블 구조 확인
DESCRIBE book;

-- 테이블 삭제 
DROP TABLE book;

-- 트렌잭션 활성화 
SELECT @@autocommit;	-- 1: 자동 커밋, 0: 자동 커밋 안함 
SET autocommit=0;	-- 자동 커밋 off, 트랜잭션 작동

-- Subquery를 이용한 테이블 생성
-- job_id가 FI_ACCOUNT인 모든 직원의 레코드를 새 테이블로 생성
CREATE TABLE account_employees AS (
	SELECT * FROM hrdb.employees
    WHERE job_id='FI_ACCOUNT'
);

DESC account_employees;
SELECT * FROM account_employees;

CREATE TABLE book (
	book_id INTEGER,
    title VARCHAR(50),
    author VARCHAR(20),
    pub_date DATETIME DEFAULT CURRENT_TIMESTAMP);
    
-- 테이블 변경 ALTER TABLE
-- 컬럼 추가 (ADD)
ALTER TABLE book ADD (pubs VARCHAR(50));
DESCRIBE book;

-- 컬럼 변경 (MODIFY)
ALTER TABLE book MODIFY title VARCHAR(100);
DESC book;

-- 컬럼 삭제 (DROP)
ALTER TABLE book DROP author;
DESC book;

-- 컬럼 코멘트 (주석)
ALTER TABLE book MODIFY title VARCHAR(100) COMMENT '도서 제목';
DESC book;
SHOW CREATE TABLE book;

-- RENAME
RENAME TABLE book TO article;
