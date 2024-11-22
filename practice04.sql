----------------------------
-- 연습문제(서브쿼리)
----------------------------
USE hrdb;


-- 문제 1.
-- 평균 월급
SELECT AVG(salary) FROM employees;
-- 평균 월급보다 적게 받는 직원 
SELECT COUNT(salary) FROM employees WHERE salary < 6462;
-- 합치기
SELECT COUNT(salary) FROM employees WHERE salary < (SELECT AVG(salary) FROM employees); 


-- 문제 2.
-- 평균월급, 최대월급
SELECT AVG(salary), MAX(salary) FROM employees;

-- 평균월급 이상, 최대월급 이하로 받는 사원
SELECT employee_id AS 직원번호, first_name AS 이름, salary AS 월급, AVG(salary) AS 평균월급, MAX(salary) AS 최대월급
	FROM employees GROUP BY employee_id
    HAVING salary >= 6462 AND salary <=24000 ORDER BY salary;
    
-- 결합
SELECT employee_id AS 직원번호, first_name AS 이름, salary AS 월급, AVG(salary) AS 평균월급, MAX(salary) AS 최대월급
	FROM employees GROUP BY employee_id
    HAVING salary >= (SELECT AVG(salary) FROM employees) 
		AND salary <= (SELECT MAX(salary) FROM employees)ORDER BY salary;
        

-- 문제 3. 
-- Steven king이 소속된 부서
SELECT d.department_id FROM employees e JOIN departments d
	ON e.department_id = d.department_id WHERE e.first_name='Steven' AND e.last_name='king';

-- department_id가 90인 부서의 주소
SELECT l.location_id, l.street_address, l.postal_code, l.city, l.state_province, l.country_id 
	 FROM locations l JOIN departments d ON d.location_id = l.location_id WHERE department_id=90;
     
-- 결합
SELECT l.location_id, l.street_address, l.postal_code, l.city, l.state_province, l.country_id 
	FROM locations l JOIN departments d ON d.location_id = l.location_id 
	WHERE department_id=(SELECT d.department_id FROM employees e JOIN departments d 
		ON e.department_id = d.department_id 
		WHERE e.first_name='Steven' AND e.last_name='king');
        

-- 문제 4.
-- job_id가 ST_MAN인 직원의 월급
SELECT salary FROM employees WHERE job_id='ST_MAN';

-- 월급이 8200보다 작은 직원, 월급의 내림차순
SELECT employee_id, first_name, salary FROM employees 
	WHERE salary < 8200 ORDER BY salary DESC;
    
-- 결합
SELECT employee_id, first_name, salary FROM employees 
	WHERE salary <ANY (SELECT salary FROM employees WHERE job_id='ST_MAN')
    ORDER BY salary DESC;
    

-- 문제 5.
-- 각 부서별 최고 월급
SELECT department_id, MAX(salary) FROM employees GROUP BY department_id;

-- 조건절 비교
SELECT employee_id, first_name, salary, department_id FROM employees
	WHERE (department_id, salary) IN (SELECT department_id, MAX(salary) FROM employees GROUP BY department_id)
	ORDER BY salary DESC;

-- 테이블 조인
SELECT e.employee_id, e.first_name, e.salary, e.department_id FROM employees e JOIN
	(SELECT department_id, MAX(salary) FROM employees GROUP BY department_id) sal
	ON e.department_id = sal.department_id ORDER BY salary DESC;
    
    
-- 문제 6.
-- 각 업무별 월급의 총합
SELECT j.job_title, SUM(salary) FROM employees e JOIN jobs j
	ON e.job_id = j.job_id GROUP BY j.job_title ORDER BY SUM(salary) DESC; 
    
    
-- 문제 7.
-- 부서별 평균 월급
SELECT AVG(salary), department_id FROM employees GROUP BY department_id;

-- 자신의 부서 평균 월급보다 월급이 많은 직원 
SELECT employee_id, first_name, salary FROM employees e JOIN
	(SELECT AVG(salary), department_id FROM employees GROUP BY department_id) avs
    ON e.department_id = avs.department_id 
	WHERE e.salary > avs.AVG(salary); 
    
    
-- 문제 8. 
SELECT employee_id, first_name, salary, hire_date FROM employees ORDER BY hire_date LIMIT 10,5;
    