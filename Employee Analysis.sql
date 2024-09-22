
-- Read the dataset --
Select * from hrdatasetworking

-- 1) Diversity report :-
-- a) Analyse the current workforce in terms of marital status.
SELECT 
    MaritalDesc, COUNT(MaritalDesc) AS Totalcount
FROM
    hrdatasetworking
GROUP BY MaritalDesc
ORDER BY COUNT(MaritalDesc) DESC

-- b) Analyse the current workforce in terms of race.
SELECT 
    RaceDesc, COUNT(Employee_Name)
FROM
    hrdatasetworking
GROUP BY RaceDesc
ORDER BY COUNT(Employee_Name) DESC


-- c) Analyse the current workforce in terms of Age.
SELECT 
    TIMESTAMPDIFF(YEAR, STR_TO_DATE(DOB, '%d-%m-%Y'), current_date) AS age,
    Salary
FROM 
    hrdatasetworking
Order by Salary Desc


-- d) Analyse the current workforce in terms of Gender.
SELECT 
    Sex, COUNT(Employee_Name)
FROM
    hrdatasetworking
GROUP BY Sex

-- 2) Employee satisfaction:-
-- Analyse the employee satisfaction profile for each of the four performance ratings that were given in 2019 (PIP, NI, Meets, Exceeds)
SELECT 
    PerformanceScore, AVG(Empsatisfaction)
FROM
    hrdatasetworking
WHERE
    LastPerformanceReview_Date LIKE '%2019'
GROUP BY PerformanceScore


-- 3. Compensation distribution:- 
-- Analyze the wage bill in terms of how much is spent across each type of role (Position) within the company, and the average salary of person in each of the roles.
SELECT 
    Position,
    SUM(Salary) AS TotalSalary,
    AVG(Salary) AS AvgSalary
FROM
    hrdatasetworking
GROUP BY Position
ORDER BY AVG(Salary) DESC


-- 4. Attrition analysis: 
-- a) Analyse how many people have left each year,  type of exit, and reasons given if exit was voluntary.
SELECT 
    TermReason, COUNT(DateofTermination)
FROM
    hrdatasetworking
WHERE
    EmploymentStatus = 'Voluntarily Terminated'
GROUP BY TermReason
ORDER BY COUNT(DateofTermination) DESC

-- b) Analyse how many people have left each year,  type of exit, and reasons given if exit was voluntary
SELECT 
    YEAR(STR_TO_DATE(DateofTermination, '%d-%m-%Y')) AS Year,
    COUNT(DateofTermination) AS EmployeeExit
FROM
    hrdatasetworking
WHERE
    EmploymentStatus = 'Voluntarily Terminated'
GROUP BY YEAR
ORDER BY COUNT(DateofTermination) DESC




    