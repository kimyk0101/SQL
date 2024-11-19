USE hrdb;

SELECT * FROM departments;

------------------------
-- SET OPERATION
------------------------
SELECT CONCAT(first_name, ' ', last_name) AS full_name, salary, hire_date FROM employees 
	WHERE department_id = 80;	-- 34row
    
SELECT CONCAT(first_name, ' ', last_name) AS full_name, salary, hire_date FROM employees
	WHERE salary > 9000;	-- 23row
    
SELECT CONCAT(first_name, ' ', last_name) AS full_name, salary, hire_date FROM employees WHERE department_id = 80 
    UNION	-- 중복을 제거한 합집합 (42row)
SELECT CONCAT(first_name, ' ', last_name) AS full_name, salary, hire_date FROM employees WHERE salary > 9000;

SELECT CONCAT(first_name, ' ', last_name) AS full_name, salary, hire_date FROM employees WHERE department_id = 80 
    UNION ALL	-- 중복을 제거하지 않은 합집합(57row)
SELECT CONCAT(first_name, ' ', last_name) AS full_name, salary, hire_date FROM employees WHERE salary > 9000;

-- MySQL은 INTERSECT(교집합), EXCEPT(차집합)는 지원하지 않음

------------------------------------
-- Simple Join or Equi Join
------------------------------------
SELECT * FROM employees;	-- 107row
SELECT * FROM departments;	-- 27row

SELECT first_name, department_name FROM employees, departments;    
-- 카티젼 프로덕트 (조합 가능한 모든 레코드의 쌍): 107 * 27

SELECT * FROM employees, departments WHERE employees.department_id = departments.department_id;
-- 두 테이블을 연결(Join)해서 큰 테이블을 만듦 
-- 이름, 부서ID, 부서명
SELECT CONCAT(first_name, ' ', last_name) AS full_name, emp.department_id, dept.department_id, department_name 
	FROM employees emp, departments dept WHERE emp.department_id = dept.department_id;	-- 106row
    
SELECT CONCAT(first_name, ' ', last_name) AS full_name, emp.department_id, dept.department_id, department_name 
	FROM employees emp JOIN departments dept	-- 여기까지가 Natural Join
    USING (department_id);	-- JOIN 조건 필터 
    
---------------------------------
-- OUTER JOIN
---------------------------------
-- 조건을 만족하는 짝이 없는 경우에도 NULL을 포함시켜 결과를 출력 
-- 모든 결과를 표현 할 테이블이 어느 위치에 있느냐에 따라
-- LEFT, RIGHT, FULL OUTER JOIN으로 구분

---------------------------------
-- LEFT OUTER JOIN
---------------------------------
SELECT CONCAT(first_name, ' ', last_name) AS full_name, emp.department_id, dept.department_id, department_name 
	FROM employees emp LEFT OUTER JOIN departments dept ON emp.department_id = dept.department_id;
    
---------------------------------
-- RIGHT OUTER JOIN
---------------------------------
SELECT CONCAT(first_name, ' ', last_name) AS full_name, emp.department_id, dept.department_id, department_name 
	FROM employees emp RIGHT OUTER JOIN departments dept ON emp.department_id = dept.department_id;

---------------------------------
-- FULL OUTER JOIN
---------------------------------
-- MySQL은 FULL OUTER JOIN을 지원하지 않음
-- LEFT JOIN의 결과와 RIGHT JOIN의 결과를 UNION 연산해서 FULL OUTER JOIN을 구현할 수 있음
SELECT employee_id, CONCAT(first_name, ' ', last_name) AS full_name, emp.department_id, dept.department_id, department_name 
	FROM employees emp LEFT OUTER JOIN departments dept ON emp.department_id = dept.department_id
UNION
SELECT employee_id, CONCAT(first_name, ' ', last_name) AS full_name, emp.department_id, dept.department_id, department_name 
	FROM employees emp RIGHT OUTER JOIN departments dept ON emp.department_id = dept.department_id;
    
---------------------------------
-- SELF JOIN
---------------------------------
-- 자기자신과 JOIN, 자기자신을 두번 이상 호출하므로, 별칭을 사용할 수 밖에 없음 
SELECT emp.employee_id, emp.first_name, emp.manager_id, man.employee_id, man.first_name
	FROM employees emp JOIN employees man ON emp.manager_id = man.employee_id;
    
SELECT * FROM employees;

SELECT emp.employee_id, emp.manager_id, man.employee_id, man.first_name
	FROM employees emp LEFT OUTER JOIN employees man ON emp.manager_id = man.employee_id;