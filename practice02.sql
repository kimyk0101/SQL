----------------------------
-- 연습문제(조인)
----------------------------
USE hrdb;


-- 문제1.
SELECT employee_id AS 사번, first_name AS 이름, last_name AS 성, department_name AS 부서명 FROM employees JOIN departments 
	USING (department_id) ORDER BY department_name, employee_id DESC;
    
SELECT e.employee_id AS 사번, e.first_name AS 이름, e.last_name AS 성, d.department_name AS 부서명 FROM employees e JOIN departments d
	ON  e.department_id = d.department_id ORDER BY d.department_name, e.employee_id DESC;


-- 문제2.
SELECT employee_id AS 사번, first_name AS 이름, salary AS 월급, department_name AS 부서명, job_title AS 업무명
	FROM employees e, departments d, jobs j
	WHERE e.department_id = d.department_id AND e.job_id = j.job_id ORDER BY employee_id;
    
SELECT e.employee_id AS 사번, e.first_name AS 이름, e.salary AS 월급, d.department_name AS 부서명, j.job_id AS 업무아이디, j.job_title AS 업무명
	FROM employees e INNER JOIN departments d ON  e.department_id = d.department_id
    INNER JOIN jobs j ON e.job_id = j.job_id ORDER BY e.employee_id;    

    
-- 문제2-1.
SELECT employee_id AS 사번, first_name AS 이름, salary AS 월급, department_name AS 부서명, job_title AS 업무명 
	FROM employees e LEFT OUTER JOIN departments d ON e.department_id = d.department_id, jobs j
	WHERE e.job_id = j.job_id ORDER BY employee_id;
    
SELECT e.employee_id AS 사번, e.first_name AS 이름, e.salary AS 월급, d.department_name AS 부서명, j.job_id AS 업무아이디, j.job_title AS 업무명
	FROM employees e LEFT JOIN departments d ON  e.department_id = d.department_id
    INNER JOIN jobs j ON e.job_id = j.job_id ORDER BY e.employee_id;    
 
 
-- 문제3.
SELECT l.location_id AS 도시아이디, city AS 도시명, department_name AS 부서명, department_id AS 부서아이디
	FROM locations l, departments d WHERE l.location_id = d.location_id
	ORDER BY l.location_id;
    
SELECT l.location_id AS 도시아이디, l.city AS 도시명, d.department_name AS 부서명, d.department_id AS 부서아이디
	FROM locations l INNER JOIN departments d ON l.location_id = d.location_id
	ORDER BY l.location_id;

    
-- 문제3-1.
SELECT l.location_id AS 도시아이디, l.city AS 도시명, d.department_name AS 부서명, d.department_id AS 부서아이디 
	FROM locations l LEFT JOIN departments d ON l.location_id = d.location_id
	ORDER BY l.location_id;
-- LEFT OUTER JOIN/RIGHT OUTER JOIN = LEFT JOIN/RIGHT JOIN

    
-- 문제4.
SELECT region_name AS 지역명, country_name AS 나라명 
	FROM regions r, countries c WHERE r.region_id = c.region_id 
    ORDER BY region_name, country_name DESC;
    
SELECT r.region_name AS 지역명, c.country_name AS 나라명 
	FROM regions r INNER JOIN countries c ON r.region_id = c.region_id 
    ORDER BY r.region_name, c.country_name DESC;

    
-- 문제5.
SELECT e.employee_id AS 사번, e.first_name AS 이름, e.hire_date AS 채용일, m.first_name AS 매니저이름, m.hire_date AS 매니저입사일
	FROM employees e JOIN employees m ON e.employee_id = m.manager_id WHERE m.hire_date > e.hire_date;

SELECT e.employee_id AS 사번, e.first_name AS 이름, e.hire_date AS 채용일, m.first_name AS 매니저이름, m.hire_date AS 매니저입사일
	FROM employees e INNER JOIN employees m ON e.manager_id = m.employee_id WHERE m.hire_date > e.hire_date;


-- 문제6. 
SELECT c.country_name AS 나라명, c.country_id AS 나라아이디, l.city AS 도시명, l.location_id AS 도시아이디, 
		d.department_name AS 부서명, d.department_id AS 부서아이디
	FROM countries c, locations l, departments d WHERE c.country_id = l.country_id AND l.location_id = d.location_id
    ORDER BY c.country_name;
    
 SELECT c.country_name AS 나라명, c.country_id AS 나라아이디, l.city AS 도시명, l.location_id AS 도시아이디, 
		d.department_name AS 부서명, d.department_id AS 부서아이디
	FROM countries c INNER JOIN locations l ON c.country_id = l.country_id 
						INNER JOIN departments d ON l.location_id = d.location_id ORDER BY c.country_name;   

    
-- 문제7. 
SELECT e.employee_id AS 사번, CONCAT(first_name, ' ', last_name) AS 이름, jh.job_id AS 업무아이디, start_date AS 시작일, end_date AS 종료일
	FROM employees e JOIN job_history jh ON e.employee_id = jh.employee_id WHERE jh.job_id = 'AC_ACCOUNT';


-- 문제8.
SELECT d.department_id AS 부서번호, d.department_name AS 부서명, 
	m.first_name AS 매니저이름, l.city AS 도시, c.country_name AS 나라명, r.region_name AS 지역명
	FROM departments d, employees e JOIN employees m ON e.employee_id = m.manager_id, locations l, countries c, regions r
    WHERE d.department_id = e.department_id AND d.location_id = l.location_id AND l.country_id = c.country_id AND c.region_id = r.region_id;
    
    SELECT d.department_id AS 부서번호, d.department_name AS 부서명,  
		m.first_name AS 매니저이름, l.city AS 도시, c.country_name AS 나라명, r.region_name AS 지역명
	FROM employees e INNER JOIN employees m ON e.employee_id = m.manager_id 
						INNER JOIN departments d ON d.department_id = e.department_id 
                        INNER JOIN locations l ON d.location_id = l.location_id
                        INNER JOIN countries c ON l.country_id = c.country_id
                        INNER JOIN regions r ON c.region_id = r.region_id;

 
-- 문제9.
SELECT e.employee_id AS 사번, e.first_name AS 이름, d.department_name AS 부서명, m.first_name AS 매니저이름
	FROM employees e LEFT JOIN employees m ON  e.manager_id = m.employee_id 
	LEFT JOIN departments d ON e.department_id = d.department_id;
    
    
-- 문제9-1.
SELECT e.employee_id AS 사번, e.first_name AS 이름, d.department_name AS 부서명, m.first_name AS 매니저이름
	FROM employees e INNER JOIN employees m ON  e.manager_id = m.employee_id 
	LEFT JOIN departments d ON e.department_id = d.department_id;
    

-- 문제9-2. 
SELECT e.employee_id AS 사번, e.first_name AS 이름, d.department_name AS 부서명, m.first_name AS 매니저이름
	FROM employees e INNER JOIN employees m ON  e.manager_id = m.employee_id 
	INNER JOIN departments d ON e.department_id = d.department_id;
    