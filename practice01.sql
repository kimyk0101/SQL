----------------------------
-- 연습문제(기본)
----------------------------
USE hrdb;

-- 문제1.
SELECT CONCAT(first_name, ' ', last_name) AS 이름, salary AS 월급, phone_number AS 전화번호, hire_date AS 입사일 
	FROM employees ORDER BY hire_date, CONCAT(first_name, ' ', last_name);

    
-- 문제2.
SELECT job_title, max_salary FROM jobs ORDER BY max_salary DESC;


-- 문제3.
SELECT CONCAT(first_name, ' ', last_name) AS 이름, manager_id, commission_pct, salary FROM employees 
	WHERE manager_id IS NOT NULL AND commission_pct IS NULL AND salary > 3000
	ORDER BY salary DESC;
 
 
-- 문제4.
SELECT job_title, max_salary FROM jobs WHERE max_salary >=10000 ORDER BY max_salary DESC;


-- 문제5.
SELECT first_name, salary, IFNULL(commission_pct, 0) FROM employees WHERE salary < 14000 AND salary >= 10000  ORDER BY salary DESC;


-- 문제6.
SELECT CONCAT(first_name, ' ', last_name) AS 이름, DATE_FORMAT(hire_date, '%Y-%m') AS hire_month, department_id AS 부서번호
	FROM employees WHERE department_id IN(10, 90, 100);
 
 
-- 문제7.
SELECT first_name, salary FROM employees WHERE LOWER(first_name) LIKE '%s%';
 
 
-- 문제8.
SELECT department_name FROM departments ORDER BY LENGTH(department_name) DESC;
SELECT *, LENGTH(department_name) FROM departments ORDER BY LENGTH(department_name) DESC;


-- 문제9.
SELECT UPPER(country_name) FROM countries ORDER BY UPPER(country_name);


-- 문제10.
SELECT first_name, salary, REPLACE(phone_number, ".", "-")As phone_number, hire_date FROM employees
WHERE hire_date < '2003-12-31';