-------------------------
-- CUD
-------------------------
USE test_db;
DESC author;

-- 테이블 비우기
TRUNCATE author;

-- INSERT: 테이블에 새 데이터를 추가 (CREATE)
-- 데이터를 넣을 컬럼을 지정하지 않으면 전체 데이터를 제공해야 함
INSERT INTO author
	VALUES(1, '박경리', '토지 작가');
    
SELECT * FROM author;

-- 특정 컬럼의 내용만 입력할 때는 컬럼 목록 지정 
-- author의 author_id는 PK AUTO_INCREMENT이기 때문에 직접 입력하지 안아도 된다
INSERT INTO author (author_id, author_name)
	VALUES(2, '김영하');
    
SELECT * FROM author;

INSERT INTO author
	VALUES(3, '무명씨', '그냥 작가');
    
-- UPDATE
UPDATE author SET author_desc='알쓸신잡 출연'
	WHERE author_id=2;
    
SELECT * FROM author;

-- 주의: UPDATE, DELETE는 WHERE절을 이용해서 변경조건을 부여해야 한다 

-- DELETE
DELETE FROM author WHERE author_id=3;

 SELECT * FROM author;
 
 UPDATE author SET author_name='박경리'
	WHERE author_id=1;
    
 UPDATE author SET author_name='김영하'
	WHERE author_id=2;   
    
SELECT * FROM author;



---------------------------
-- Transaction
---------------------------
-- Workbench 보호 장치 해제
-- Edit > Preferences > SQL Editor > Safe Update 해제 > Workbench 재시작

SELECT @@autocommit;	-- 1: AUTOCOMMIT ON, 0: AUTOCOMMIT OFF

SET autocommit=0;	-- AUTOCOMMIT OFF
SELECT @@autocommit;

CREATE TABLE trasactions (
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
    log VARCHAR(100),
    logdate DATETIME DEFAULT now()
);

START TRANSACTION;
RENAME TABLE trasactions TO transactios;
RENAME TABLE transactios TO transactions;
INSERT INTO transactions (log) VALUES ('1번째 INSERT');
SELECT * FROM transactions;

INSERT INTO transactions (log) VALUES ('2번째 INSERT');
SELECT * FROM transactions;

-- 세이브포인트 설정
SAVEPOINT x1;
SELECT * FROM transactions;

INSERT INTO transactions (log) VALUES ('3번째 INSERT');
SELECT * FROM transactions;

ROLLBACK TO x1;
SELECT * FROM transactions;

-- 트랜잭션 진행중

-- 변경사항 반영 (cmd에도 나타남)
COMMIT;
SELECT * FROM transactions;
 
START TRANSACTION;

DELETE FROM transactions;	-- cmd 아직 남아있는 상태
SELECT * FROM transactions; 

ROLLBACK;
SELECT * FROM transactions;	-- 다시 돌아옴

-- TRUNCATE 는 TRANSACTION의 대상이 아님
TRUNCATE TABLE transactions;
SELECT * FROM transactions;	-- 다 날아감, 되돌릴 수 없음 (속도가 빠르기 때문에 대량의 데이터를 지울 때 좋음)

-- Safe Update 원상 복구
