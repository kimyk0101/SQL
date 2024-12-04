-- 수강생명: 김연경

-- 아래 요구 사항을 만족하는 SQL 쿼리를 작성하세요.

-- 0. 이미 만들어진 객체들을 지우는 쿼리를 추가하세요.
-- music_db를 삭제합니다.
DROP DATABASE music_db;

-- 'music_user'@'localhost' 사용자를 삭제합니다.
DROP USER 'music_user'@'localhost';

-- 1. 'music_db'라는 이름의 데이터베이스를 생성하세요.
CREATE DATABASE music_db;

-- 2. 'music_user'라는 이름의 사용자 계정을 생성하고 비밀번호는 '1234'로 설정하세요.
CREATE USER 'music_user'@'localhost' IDENTIFIED BY '1234';

-- 3. 'music_user'에게 'music_db' 데이터베이스에 대한 모든 권한을 부여하세요.
GRANT ALL PRIVILEGES ON music_db.* TO 'music_user'@'localhost';

-- 4. 'music_db' 데이터베이스를 사용하도록 설정하세요.
USE music_db;

-- 5. 'artists' 테이블과 'songs' 테이블을 생성하세요.
-- 'artists' 테이블에는 다음의 열이 포함되어야 합니다:
-- - artist_id (INT, PRIMARY KEY, AUTO_INCREMENT)
-- - artist_name (VARCHAR(100), NOT NULL)
-- - description (VARCHAR(255))
CREATE TABLE artists (
	artist_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    artist_name VARCHAR(100) NOT NULL,
    description VARCHAR(255));

-- 'songs' 테이블에는 다음의 열이 포함되어야 합니다:
-- - song_id (INT, PRIMARY KEY, AUTO_INCREMENT)
-- - song_title (VARCHAR(200), NOT NULL)
-- - artist_id (INT, 외래 키로 'artists' 테이블의 artist_id 참조)
-- - release_year (YEAR, NOT NULL)
CREATE TABLE songs (
	song_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    song_title VARCHAR(200) NOT NULL,
    artist_id INTEGER,
    FOREIGN KEY (artist_id) REFERENCES
		artists(artist_id) ON DELETE SET NULL,
    release_year YEAR NOT NULL);
    
drop table songs;
-- 6. 'artists' 테이블에 데이터를 삽입하세요. 예시:
-- - '김광석', '한국의 대표적인 포크 가수'
-- - '이문세', '한국 발라드 음악의 거장'
-- - '조용필', '한국 대중음악의 전설'
INSERT INTO artists
	VALUES(1, '김광석', '한국의 대표적인 포크 가수');
INSERT INTO artists
	VALUES(2, '이문세', '한국 발라드 음악의 거장');
INSERT INTO artists    
    VALUES(3, '조용필', '한국 대중음악의 전설');

-- 7. 'songs' 테이블에 데이터를 삽입하세요. 예시:
-- - '서른 즈음에', '김광석', 1994
-- - '옛사랑', '이문세', 1985
-- - '이등병의 편지', '김광석', 1993
-- - '붉은 노을', '이문세', 1988
-- - '돌아와요 부산항에', '조용필', 1982
INSERT INTO songs
	VALUES(1, '서른 즈음에', 1, 1994);
INSERT INTO songs
	VALUES(2, '옛사랑', 2, 1985);
INSERT INTO songs
	VALUES(3, '이등병의 편지', 1, 1993);
INSERT INTO songs
	VALUES(4, '붉은 노을', 2, 1998);	
INSERT INTO songs
	VALUES(5, '돌아와요 부산항에', 3, 1982);
 UPDATE songs SET release_year=1988 WHERE song_id=4;	-- 오타수정

-- 8. 두 테이블을 조인하여 출력하는 쿼리를 추가하세요.
SELECT * FROM artists;
SELECT * FROM songs;
SELECT s.song_id, s.song_title, s.release_year, s.artist_id, a.artist_id, a.artist_name
	FROM artists a JOIN songs s ON a.artist_id = s.artist_id;

-- 고생하셨습니다.
