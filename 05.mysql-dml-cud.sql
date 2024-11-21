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

 
 