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
    
    
  
----------------------------------
-- Aggregation (집계)
----------------------------------
-- 여러 행의 데이터를 입력으로 받아서 하나의 행을 반환 
-- NULL이 포함된 데이터는 NULL을 제외하고 집계 

-- 갯수 세기: COUNT
SELECT COUNT(*), COUNT(commission_pct), COUNT(department_id) FROM employees;

-- *로 COUNT하면 모든 행의 수, 특정 컬럼에 NULL 포함여부는 중요하지 않음 
SELECT COUNT(commission_pct) FROM employees;
-- 위 쿼리는 아래와 같은 의미
SELECT COUNT(*) FROM employees WHERE commission_pct IS NOT NULL;  

-- 합계 함수: SUM
-- 사원들의 월급의 총합은? 
SELECT SUM(salary) FROM employees;

-- 평균 함수: AVG
-- 사원들의 월급의 평균은?
SELECT AVG(salary) FROM employees;

-- 사원들이 받는 커미션 비율의 평균치는? 
SELECT AVG(commission_pct) FROM employees;
SELECT COUNT(commission_pct) FROM employees;
-- 집계 함수는 NULL을 제외하고 집계
-- NULL을 변환하여 사용해야 할지 여부를 정책적으로 결정하고 수행해야 함

SELECT AVG(IFNULL(commission_pct, 0)) FROM employees;	-- 7%

-- MIN/MAX
-- 월급의 최소값, 최대값, 평균 
SELECT MIN(salary), MAX(salary), AVG(salary) FROM employees;

-- 부서별로 평균 급여를 확인
SELECT department_id, AVG(salary) FROM employees;

-- 안되는 이유: AVG(1row), department_id(107row) -> 매치가 안됨
SELECT department_id FROM employees ORDER BY department_id;
SELECT AVG(salary) FROM employees;

-- 수정된 쿼리: 그룹마다 1개의 레코드로 결론 도출 -> 매치 가능 
SELECT department_id, AVG(salary) FROM employees GROUP BY department_id ORDER BY department_id;

SELECT department_id, salary FROM employees ORDER BY department_id ASC;

-- 평균 급여가 7000 이상인 부서만 출력
SELECT department_id, AVG(salary) FROM employees WHERE AVG(salary) >= 7000 GROUP BY department_id;	-- Error: why?
-- 집계 함수 실행 이전에 WHERE 절을 이용한 SELECTION이 이루어짐 (그룹이 이루어지기 전에 AVG는 실행 불가)
-- 집계 함수는 WHERE 절에서 활용할 수 없는 상태 
-- 집계 이후에 조건 검사를 하려면 HAVING 절을 활용

SELECT department_id, AVG(salary) 	-- (5): 가장 앞에 쓰지만 사실 가장 마지막에 처리됨
FROM employees 						-- (1)
GROUP BY department_id 				-- (2)
	HAVING AVG(salary) >= 7000 		-- (3)
ORDER BY department_id;				-- (4)


---------------------------
-- SUBQUERY
---------------------------

-- Susan보다 많은 급여를 받는 직원의 목록

-- Query 1. 이름이 Susan인 직원의 급여를 뽑는 쿼리
SELECT salary FROM employees WHERE first_name='Susan';	-- 6500

-- Query 2. 급여를 6500보다 많이 맏는 직원의 목록을 뽑는 쿼리
SELECT first_name, salary FROM employees WHERE salary > 6500;	-- 49row

-- Query 3. 쿼리의 결합 
SELECT first_name, salary FROM employees 
	WHERE salary > (SELECT salary FROM employees WHERE first_name='Susan');	-- 49row

-- 연습문제    
-- Den보다 많은 급여를 받는 사원의 이름과 급여 출력

-- Query 1. 이름이 Den인 직원의 급여를 뽑는 쿼리
SELECT salary FROM employees WHERE first_name='Den';	-- 11000

-- Query 2. 급여를 11000보다 많이 맏는 직원의 목록을 뽑는 쿼리
SELECT first_name, salary FROM employees WHERE salary > 11000;	-- 10row

-- Query 3. 쿼리의 결합 
SELECT first_name, salary FROM employees 
	WHERE salary > (SELECT salary FROM employees WHERE first_name='Den');	-- 10row
  
  
-- 급여를 가장 적게 받는 사람의 이름, 급여, 사원번호를 출력

-- Query 1. 가장 적은 급여
SELECT MIN(salary) FROM employees;	-- 2100

-- Query2. Query 1의 결과보다 salary가 작은 직원 목록
SELECT employee_id, first_name, salary FROM employees WHERE salary = 2100;

-- Query 3. 쿼리의 결합 
SELECT employee_id, first_name, salary FROM employees 
	WHERE salary = (SELECT MIN(salary) FROM employees);

    
-- 평균 급여보다 적게 받는 사원의 이름과 급여를 출력

-- Query 1. 평균 급여
SELECT AVG(salary) FROM employees;	-- 6462

-- Query2. Query 1의 결과보다 salary가 적은 직원 목록
SELECT employee_id, salary FROM employees WHERE salary < 6462;

-- Query 3. 쿼리의 결합 
SELECT employee_id, salary FROM employees 
	WHERE salary < (SELECT AVG(salary) FROM employees);
    

-- 다중행 서브쿼리
-- 서브쿼리의 결과 레코드가 둘 이상일 때는 단순 비교연산자는 사용 불가
-- 서브쿼리 결과가 둘 이상일 때는 집합연산자(IN, ANY, ALL, EXISTS) 사용

SELECT salary FROM employees WHERE department_id = 110;	-- 2row

-- 110번 부서 사람들이 받는 급여와 동일한 급여를 받는 사원들 (salary = 12008 or 8300)
SELECT first_name, salary FROM employees 
	WHERE salary = (SELECT salary FROM employees WHERE department_id = 110);	-- 단일쿼리가 아니라서 Error
-- 수정
SELECT first_name, salary FROM employees 
	WHERE salary IN (SELECT salary FROM employees WHERE department_id = 110);

-- 110번 부서 사람들이 받는 급여 중 1개 이상보다 많은 급여를 받는 사람들 (salary > 12008 or 8300)
SELECT first_name, salary FROM employees 
	WHERE salary > ANY (SELECT salary FROM employees WHERE department_id = 110);
-- ANY 연산자는 비교연산자와 결합해서 작동
-- OR 연산자와 비슷

-- 110번 부서 사람들이 받는 급여 전체보다 많은 급여를 받는 사람들 (salary > 12008 and 8300)
SELECT first_name, salary FROM employees 
	WHERE salary > ALL (SELECT salary FROM employees WHERE department_id = 110);
-- ALL 연산자는 비교연산자와 결합하여 사용
-- AND 연산자와 비슷

-- 서브쿼리 연습
-- 각 부서별로 최고 급여를 받는 사원을 출력 - 조건절에 서브쿼리 사용
-- Query 1. 각 부서의 최고급여
SELECT department_id, MAX(salary) FROM employees GROUP BY department_id ORDER BY department_id;

-- Query 2. Query 1에서 나온 department_id와 salary값을 이용하여 비교 연산 
SELECT department_id, employee_id, first_name, salary FROM employees 
	WHERE (department_id, salary) IN 
		(SELECT department_id, MAX(salary) FROM employees GROUP BY department_id) ORDER BY department_id;
        

-- 각 부서별로 최고 급여를 받는 사원을 출력 - 서브쿼리 테이블 조인 사용 
SELECT emp.department_id, emp.employee_id, emp.first_name, emp.salary FROM employees emp 
	JOIN (SELECT department_id, MAX(salary) FROM employees GROUP BY department_id) sal
	ON emp.department_id = sal.department_id ORDER BY emp.department_id;
    
SELECT emp.department_id, emp.employee_id, emp.first_name, emp.salary FROM employees emp,  
	(SELECT department_id, MAX(salary), salary FROM employees GROUP BY department_id) sal
	WHERE emp.department_id = sal.department_id AND emp.salary = sal.salary ORDER BY emp.department_id;
    

----------------------------
-- LIMIT
----------------------------
-- LIMIT: 출력 개수의 제한
SELECT first_name, salary FROM employees ORDER BY salary DESC LIMIT 3;	-- 앞으로부터 3개
SELECT first_name, salary FROM employees ORDER BY salary DESC LIMIT 10, 3;	-- 앞에서 10개 건너뛰고 3개만 출력
SELECT first_name, salary FROM employees ORDER BY salary DESC;


