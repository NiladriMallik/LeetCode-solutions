SELECT MAX(SALARY) AS SecondHighestSalary
FROM EMPLOYEE WHERE SALARY < (SELECT MAX(SALARY) FROM EMPLOYEE)