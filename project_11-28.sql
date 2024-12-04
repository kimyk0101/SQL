USE contactdb;
SELECT * FROM employees ORDER BY address;
DESC employees;
SELECT * FROM employees;
SELECT * FROM departments;	-- 14번까지
SELECT * FROM regions;
SELECT * FROM message_records;
SELECT * FROM call_records;
DELETE FROM call_records WHERE id=5;


-- 이메일은 da부터 시작
-- 전화번호는 중간번호 바꾸고 시작
-- 사원, 대리, 과장, 차장, 부장
-- anyang 22-00~22-05
-- busan 15-11~22-03,66-23, 85-23
-- daegu 22-00~23-11, 77-11
-- daejun 22-00~22-03
-- gwangju 22-00~22-03
-- incheon 77-11
-- seoul 11-11, 119-11, ~34-22, 77-11~77-13 
-- suwon 22-00~22-03

INSERT INTO employees VALUES(43, '김미래', 25, '010-2345-1111', 'da@naber.com', 'anyang-33-11', 7, '사원', 3000);
INSERT INTO employees VALUES(44, '김나라', 30, '010-2345-1122', 'dc@naber.com', 'anyang-33-22', 7, '사원', 3100);
INSERT INTO employees VALUES(45, '김지원', 32, '010-2345-1133', 'dn@naber.com', 'busan-33-11', 7, '대리', 3500);
INSERT INTO employees VALUES(46, '박지수', 30, '010-2345-1144', 'dg@naber.com', 'daegu-33-11', 7, '대리', 3600);
-- 44번 사원 나이 바꾸기 26:완료
INSERT INTO employees VALUES(47, '김건우', 26, '010-2345-1155', 'ea@naber.com', 'anyang-44-11', 8, '사원', 3000);
INSERT INTO employees VALUES(48, '김지우', 25, '010-2345-1166', 'eb@naber.com', 'busan-44-12', 8, '사원', 3100);
INSERT INTO employees VALUES(49, '박준수', 30, '010-2345-1177', 'ef@naber.com', 'daejun-33-11', 8, '대리', 3500);
INSERT INTO employees VALUES(50, '박천우', 32, '010-2345-1188', 'eg@naber.com', 'seoul-44-11', 8, '대리', 3700);
INSERT INTO employees VALUES(51, '황진우', 36, '010-2345-1199', 'eh@naber.com', 'seoul-44-22', 8, '과장', 4200);
INSERT INTO employees VALUES(52, '김준우', 37, '010-2345-2211', 'er@naber.com', 'anyang-44-22', 8, '과장', 4200);
INSERT INTO employees VALUES(53, '김자연', 40, '010-2345-2323', 'ej@naber.com', 'gwangju-33-11', 8, '차장', 4500);
INSERT INTO employees VALUES(54, '임주원', 40, '010-2345-2245', 'ek@naber.com', 'gwangju-33-22', 8, '차장', 4500);
INSERT INTO employees VALUES(55, '임지은', 45, '010-2345-2255', 'ep@naber.com', 'incheon-11-11', 8, '부장', 5100);
INSERT INTO employees VALUES(56, '김성운', 43, '010-2345-2266', 'es@naber.com', 'incheon-11-33', 8, '부장', 5000);

INSERT INTO employees VALUES(57, '이영우', 24, '010-2345-2277', 'fa@naber.com', 'suwon-33-11', 9, '사원', 3000);
INSERT INTO employees VALUES(58, '이지선', 25, '010-2345-2288', 'fc@naber.com', 'seoul-44-56', 9, '사원', 3000);
INSERT INTO employees VALUES(59, '박태우', 25, '010-2345-2298', 'fe@naber.com', 'gwangju-33-85', 9, '사원', 3100);
INSERT INTO employees VALUES(60, '김주연', 36, '010-2345-3301', 'fg@naber.com', 'seoul-44-78', 9, '사원', 3700);
INSERT INTO employees VALUES(61, '김지수', 30, '010-2345-3322', 'ff@naber.com', 'incheon-22-11', 9, '대리', 3500);
INSERT INTO employees VALUES(62, '박선우', 30, '010-2345-3334', 'fh@naber.com', 'daejun-44-11', 9, '대리', 3500);
INSERT INTO employees VALUES(63, '박찬원', 32, '010-2345-3359', 'fk@naber.com', 'daegu-33-11', 9, '대리', 3600);
INSERT INTO employees VALUES(64, '이정우', 35, '010-2345-3365', 'fl@naber.com', 'seoul-44-99', 9, '과장', 4100);
INSERT INTO employees VALUES(65, '김진선', 35, '010-2345-3374', 'fo@naber.com', 'incheon-22-32', 9, '과장', 4000);
INSERT INTO employees VALUES(66, '최전웅', 36, '010-2345-3385', 'fp@naber.com', 'anyang-44-11', 9, '과장', 4100);
INSERT INTO employees VALUES(67, '김선태', 40, '010-2345-3398', 'fu@naber.com', 'ulsan-11-11', 9, '차장', 4500);
INSERT INTO employees VALUES(68, '김경일', 41, '010-2345-4401', 'fq@naber.com', 'incheon-22-58', 9, '차장', 4600);
INSERT INTO employees VALUES(69, '최우진', 45, '010-2345-4408', 'fs@naber.com', 'ulsan-11-25', 9, '부장', 5000);
INSERT INTO employees VALUES(70, '홍수연', 36, '010-2345-4412', 'ft@naber.com', 'daegu-33-32', 9, '부장', 5000);
-- 60번 나이 바꾸기 31, 70번 나이 바꾸기 45 : 완료

INSERT INTO employees VALUES(71, '이주영', 24, '010-2345-4424', 'gc@naber.com', 'ulsan-11-36', 10, '사원', 3000);
INSERT INTO employees VALUES(72, '김아선', 25, '010-2345-4436', 'ge@naber.com', 'ulsan-11-45', 10, '사원', 3000);
INSERT INTO employees VALUES(73, '최사랑', 30, '010-2345-4448', 'gf@naber.com', 'gwangju-44-12', 10, '대리', 3500);
INSERT INTO employees VALUES(74, '김준석', 31, '010-2345-4458', 'gh@naber.com', 'seoul-55-15', 10, '대리', 3500);
INSERT INTO employees VALUES(75, '이상원', 35, '010-2345-4466', 'ga@naber.com', 'incheon-33-33', 10, '과장', 4000);
INSERT INTO employees VALUES(76, '박정원', 35, '010-2345-4475', 'gk@naber.com', 'daejun-44-23', 10, '과장', 4000);
INSERT INTO employees VALUES(77, '최승훈', 40, '010-2345-4487', 'gr@naber.com', 'anyang-44-28', 10, '차장', 4500);
INSERT INTO employees VALUES(78, '박수연', 40, '010-2345-4491', 'gl@naber.com', 'seoul-55-19', 10, '차장', 4500);
INSERT INTO employees VALUES(79, '박태수', 45, '010-2345-5500', 'go@naber.com', 'daegu-33-88', 10, '부장', 5000);
INSERT INTO employees VALUES(80, '진정웅', 44, '010-2345-5513', 'gv@naber.com', 'anyang-44-56', 10, '부장', 5000);

INSERT INTO employees VALUES(81, '김창선', 24, '010-2345-5524', 'ia@naber.com', 'suwon-33-23', 11, '사원', 3000);
INSERT INTO employees VALUES(82, '전태수', 25, '010-2345-5536', 'ib@naber.com', 'seoul-55-16', 11, '사원', 3100);
INSERT INTO employees VALUES(83, '이가람', 25, '010-2345-5548', 'ie@naber.com', 'gwangju-35-65', 11, '사원', 3100);
INSERT INTO employees VALUES(84, '김가람', 24, '010-2345-5554', 'ig@naber.com', 'seoul-55-38', 11, '사원', 3100);
INSERT INTO employees VALUES(85, '김가련', 30, '010-2345-5556', 'if@naber.com', 'incheon-22-56', 11, '대리', 3500);
INSERT INTO employees VALUES(86, '이병진', 30, '010-2345-5561', 'ih@naber.com', 'daejun-44-35', 11, '대리', 3500);
INSERT INTO employees VALUES(87, '이창범', 31, '010-2345-5570', 'ik@naber.com', 'daegu-33-57', 11, '대리', 3500);
INSERT INTO employees VALUES(88, '박창수', 35, '010-2345-5576', 'il@naber.com', 'seoul-55-42', 11, '과장', 4100);
INSERT INTO employees VALUES(89, '최창선', 35, '010-2345-5584', 'io@naber.com', 'incheon-22-68', 11, '과장', 4000);
INSERT INTO employees VALUES(90, '진진태', 36, '010-2345-5582', 'iu@naber.com', 'anyang-44-22', 11, '과장', 4000);
INSERT INTO employees VALUES(91, '정가희', 40, '010-2345-5591', 'iv@naber.com', 'ulsan-11-39', 11, '차장', 4500);
INSERT INTO employees VALUES(92, '이상후', 41, '010-2345-5598', 'iq@naber.com', 'incheon-22-95', 11, '차장', 4500);
INSERT INTO employees VALUES(93, '진태현', 45, '010-2345-6603', 'is@naber.com', 'ulsan-11-86', 11, '부장', 5100);
INSERT INTO employees VALUES(94, '지은희', 45, '010-2345-6608', 'it@naber.com', 'daegu-33-64', 11, '부장', 5100);

UPDATE employees SET age=26 WHERE id=44;
UPDATE employees SET age=31 WHERE id=60;
UPDATE employees SET age=45 WHERE id=70;
-- 70번사원 주소 daegu-33-27:완료
UPDATE employees SET address='daegu-33-27' WHERE id=70;

-- 12번 부서부터
INSERT INTO employees VALUES(95, '정가을', 24, '010-2345-6612', 'jc@naber.com', 'ulsan-22-16', 12, '사원', 3000);
INSERT INTO employees VALUES(96, '정다운', 25, '010-2345-6624', 'je@naber.com', 'anyang-55-45', 12, '사원', 3000);
INSERT INTO employees VALUES(97, '이기선', 30, '010-2345-6632', 'jf@naber.com', 'seoul-55-56', 12, '대리', 3500);
INSERT INTO employees VALUES(98, '이정연', 31, '010-2345-6644', 'jh@naber.com', 'gwangju-44-15', 12, '대리', 3500);
INSERT INTO employees VALUES(99, '김원우', 35, '010-2345-6654', 'ja@naber.com', 'busan-44-33', 12, '과장', 4000);
INSERT INTO employees VALUES(100, '이지윤', 35, '010-2345-6660', 'jk@naber.com', 'suwon-44-23', 12, '과장', 4000);
INSERT INTO employees VALUES(101, '허자윤', 40, '010-2345-6672', 'jr@naber.com', 'anyang-44-28', 12, '차장', 4500);
INSERT INTO employees VALUES(102, '허승태', 40, '010-2345-6683', 'jl@naber.com', 'seoul-55-77', 12, '차장', 4500);
INSERT INTO employees VALUES(103, '박승진', 46, '010-2345-6698', 'jo@naber.com', 'suwon-44-38', 12, '부장', 5000);
INSERT INTO employees VALUES(104, '김상선', 46, '010-2345-7715', 'jv@naber.com', 'daejun-44-56', 12, '부장', 5000);


INSERT INTO employees VALUES(105, '김조운', 24, '010-2345-7720', 'kc@naber.com', 'busan-44-36', 13, '사원', 3000);
INSERT INTO employees VALUES(106, '이려원', 25, '010-2345-7733', 'ke@naber.com', 'deagu-33-75', 13, '사원', 3000);
INSERT INTO employees VALUES(107, '진수원', 30, '010-2345-7742', 'kf@naber.com', 'gwangju-44-26', 13, '대리', 3500);
INSERT INTO employees VALUES(108, '김장수', 31, '010-2345-7749', 'kh@naber.com', 'ulsan-22-81', 13, '대리', 3500);
INSERT INTO employees VALUES(109, '이주연', 36, '010-2345-7752', 'ka@naber.com', 'incheon-44-33', 13, '과장', 4000);
INSERT INTO employees VALUES(110, '황나현', 36, '010-2345-7768', 'ki@naber.com', 'daejun-44-79', 13, '과장', 4000);
INSERT INTO employees VALUES(111, '박기훈', 41, '010-2345-7777', 'kd@naber.com', 'ulsan-33-28', 13, '차장', 4500);
INSERT INTO employees VALUES(112, '박기전', 41, '010-2345-7782', 'kl@naber.com', 'gwangju-44-52', 13, '차장', 4500);
INSERT INTO employees VALUES(113, '이수연', 45, '010-2345-7789', 'kb@naber.com', 'daegu-44-88', 13, '부장', 5000);
INSERT INTO employees VALUES(114, '최가연', 44, '010-2345-7799', 'ks@naber.com', 'anyang-55-76', 13, '부장', 5000);

INSERT INTO employees VALUES(115, '지우연', 24, '010-2345-8810', 'pe@naber.com', 'ulsan-33-36', 14, '사원', 3000);
INSERT INTO employees VALUES(116, '김상원', 25, '010-2345-8816', 'pr@naber.com', 'suwon-55-45', 14, '사원', 3000);
INSERT INTO employees VALUES(117, '김윤희', 26, '010-2345-8826', 'pf@naber.com', 'gwangju-44-64', 14, '사원', 3100);
INSERT INTO employees VALUES(118, '최원상', 31, '010-2345-8830', 'ph@naber.com', 'seoul-55-90', 14, '대리', 3500);
INSERT INTO employees VALUES(119, '이창수', 31, '010-2345-8834', 'pa@naber.com', 'incheon-44-41', 14, '대리', 3500);
INSERT INTO employees VALUES(120, '박소진', 35, '010-2345-8839', 'pq@naber.com', 'daejun-44-85', 14, '과장', 4000);
INSERT INTO employees VALUES(121, '김승훈', 36, '010-2345-8845', 'pz@naber.com', 'anyang-55-79', 14, '과장', 4000);
INSERT INTO employees VALUES(122, '황수연', 40, '010-2345-8869', 'pl@naber.com', 'seoul-55-91', 14, '차장', 4500);
INSERT INTO employees VALUES(123, '홍지윤', 41, '010-2345-8872', 'po@naber.com', 'busan-55-88', 14, '차장', 4500);
INSERT INTO employees VALUES(124, '진태성', 46, '010-2345-8881', 'pv@naber.com', 'busan-44-75', 14, '부장', 5000);
INSERT INTO employees VALUES(125, '김성필', 46, '010-2345-8889', 'py@naber.com', 'daegu-55-56', 14, '부장', 5000);


-- 47번 주소 anyang-44-58
UPDATE employees SET address='anyang-44-58' WHERE id=47;
-- 90번 주소 anyang-44-75
UPDATE employees SET address='anyang-44-75' WHERE id=90;
-- 101번 주소 anyang-66-15
UPDATE employees SET address='anyang-66-15' WHERE id=101;
-- 63번 주소 daegu-66-11
UPDATE employees SET address='daegu-66-11' WHERE id=63;
-- 106번 주소 daegu-66-59
UPDATE employees SET address='daegu-66-59' WHERE id=106;
-- 13번 주소 seoul-19-11
UPDATE employees SET address='seoul-19-11' WHERE id=13;
-- 완료

SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM regions;
DESC departments;
DESC regions;
SELECT * FROM regions;
SELECT * FROM message_records;


SELECT emp.id, emp.name, age, number, email, address, dpt.name, employee_rank, salary 
	FROM employees emp JOIN departments dpt ON emp.department_id = dpt.id
	WHERE department_id=1;

SELECT emp.id, emp.name, emp.number, dpt.name, emp.employee_rank, dpt.department_number, reg.name 
	FROM employees emp JOIN departments dpt ON emp.department_id = dpt.id 
    JOIN regions reg ON dpt.regions_id = reg.id
    WHERE reg.name='부산';
    
 UPDATE departments SET name='품질관리부'
	WHERE id=13; 

