----------------------------
-- 연습문제(집계)
----------------------------
USE hrdb;

-- 문제1. 
SELECT COUNT(employee_id) AS haveMngCnt FROM employees WHERE manager_id IS NOT NULL;

-- 의도가 명확하기 때문에 좀 더 좋은 쿼리임 
SELECT COUNT(*) AS haveMngCnt FROM employees WHERE manager_id IS NOT NULL;
-- 집계 함수는 NULL을 제외하고 집계
SELECT COUNT(manager_id) AS haveMngCnt FROM employees;


-- 문제2.
SELECT MAX(salary) AS 최고임금, MIN(salary) AS 최저임금, MAX(salary)-MIN(salary) AS 최고임금-최저임금 
	FROM employees;

-- 별칭에는 특수문자, 공백이 들어가면 안됨(특수문자나 공백 쓸 때는 ""로 문자열 표시)
SELECT MAX(salary) AS 최고임금, MIN(salary) AS 최저임금, MAX(salary)-MIN(salary) AS "최고임금-최저임금" 
	FROM employees;
    

-- 문제3. 
SELECT MAX(DATE_FORMAT(hire_date, "%Y년 %m월 %d일")) FROM employees;

SELECT DATE_FORMAT(MAX(hire_date), "%Y년 %m월 %d일") FROM employees;


-- 문제4. 
SELECT department_id AS 부서아이디, AVG(salary) AS 평균임금, MAX(salary) AS 최고임금, MIN(salary) AS 최저임금 
	FROM employees GROUP BY department_id ORDER BY department_id DESC;
 
 
-- 문제5. 
SELECT job_id AS 업무아이디, AVG(salary) AS 평균임금, MAX(salary) AS 최고임금, MIN(salary) AS 최저임금 
	FROM employees GROUP BY job_id ORDER BY MIN(salary) DESC, ROUND(AVG(salary));
 
 SELECT job_id AS 업무아이디, ROUND(AVG(salary),0) AS 평균임금, MAX(salary) AS 최고임금, MIN(salary) AS 최저임금 
	FROM employees GROUP BY job_id ORDER BY MIN(salary) DESC, AVG(salary);
    
 
 -- 문제6.
 SELECT MIN(DATE_FORMAT(hire_date, '%Y-%m-%d %W')) AS 입사일 FROM employees;
   
   
-- 문제7.
SELECT department_id, AVG(salary) AS 평균임금, MIN(salary) AS 최저임금, AVG(salary)-MIN(salary) AS "평균임금-최저임금" 
	FROM employees GROUP BY department_id HAVING AVG(salary)-MIN(salary) < 2000
    ORDER BY AVG(salary)-MIN(salary) DESC;
 
 
-- 문제8.
SELECT job_id, MAX(salary)-MIN(salary) AS "최고임금-최저임금" FROM employees 
	GROUP BY job_id ORDER BY MAX(salary)-MIN(salary) DESC;

-- job_title로도 해봄    
SELECT j.job_title, MAX(salary)-MIN(salary) AS diff_salary FROM employees e INNER JOIN jobs j ON e.job_id = j.job_id
	GROUP BY job_title ORDER BY diff_salary DESC;
 
 
-- 문제9.
SELECT manager_id, ROUND(AVG(salary),0) AS "avg", MAX(salary) AS "max", MIN(salary) AS "min" FROM employees
	WHERE hire_date > '2005-01-01' GROUP BY manager_id HAVING AVG(salary) >=5000 
    ORDER BY AVG(salary) DESC;


-- 문제10.
SELECT CONCAT(first_name, ' ', last_name) AS 이름, hire_date AS 입사일, 
	CASE	 -- CASE ~ WHEN ~ ELSE 문: optDate 컬럼 만들기 	
		WHEN hire_date < '2002-12-31' THEN '창립멤버'	
        WHEN hire_date BETWEEN '2003-01-01' AND '2003-12-31' THEN '03년 입사'
        WHEN hire_date BETWEEN '2004-01-01' AND '2004-12-31' THEN '04년 입사'
        ELSE '상장이후입사'
	END AS optDate	
FROM employees ORDER BY hire_date;

-- 문제11.
-- 환경변수: 소프트웨어가 실행될 때 로딩되는 실행을 위한 데이터
SHOW VARIABLES;	-- 환경변수 확인

-- lc_: Locale 정보(지역정보), lc_time_names: em_US 로 되어있음
SET lc_time_names = 'ko_KR';	-- 세션 환경변수	/	SET GLOBAL lc_time_names = 'ko_KR';		-- 글로벌 환경변수
SHOW VARIABLES LIKE 'lc_time_names';	-- 세견 환경변수 확인

SELECT DATE_FORMAT(MIN(hire_date), "%Y년 %m월 %d일 (%W)") AS "가장 오래 근속한 직원의 입사일" FROM employees;
/*
https://dev.mysql.com/doc/refman/8.4/en/date-and-time-functions.html#function_date-format
%Y: Year
%m: Month (00..12)
%d: Day of the Month (00..31)
%W : Weekday name (Sunday..Saturday)
*/

    