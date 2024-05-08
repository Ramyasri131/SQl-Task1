--1. Select firstname, lastname, title, age, salary for everyone in your employee table. 
select * from Employee;

--2. Select firstname, age and salary for everyone in your employee table.
select FirstName,Age,Salary from Employee;

--3. Selct firstname and display as 'Name' for everyone in your employee table
select FirstName as [Name] from Employee;

--4. Select firstname and lastname as 'Name' for everyone. Use " " (space) to separate firstname and last
select FirstName + ' ' + LastName as Name from Employee;

--5. Select all columns for everyone with a salary over 38000. 
select * from Employee where Salary>38000;

--6. Select first and last names for everyone that's under 24 years old. 
select FirstName,LastName from Employee where Age<24;

--7. Select first name, last name, and salary for anyone with "Programmer" in their title. 
select FirstName,LastName,Salary from Employee where Title='Programmer';

--8. Select all columns for everyone whose last name contains "O". 
select * from Employee where LastName like '%o%';

--9. Select the lastname for everyone whose first name equals "Kelly". 
select LastName from Employee where FirstName like 'Kelly';

--10. Select all columns for everyone whose last name ends in "Moore".
select * from Employee where LastName like '%Moore';

--11. Select all columns for everyone who are 35 and above.
select * from Employee where Age>=35;

--12. Select firstname ,lastname,age and salary of everyone whose age is above 24 and below 43.
select FirstName,LastName,Age,Salary from Employee where age>24 and age<43;

--13 Select firstname, title and lastname whose age is in the range 28 and 62 and salary greater than 31250
select FirstName,LastName,Title from Employee where Age between 28 and 62  and Salary>31250;

--14. Select all columns for everyone whose age is not more than 48 and salary not less than 21520
select * from Employee where Age<=48 and Salary>=21520;

--15. Select firstname and age of everyone whose firstname starts with "John" and salary in the range 25000 and 35000
select FirstName,Age from Employee where FirstName like 'John%' and Salary between 25000 and 35000;

--16. Select all columns for everyone by their ages in descending order.
Select * from Employee order by Age DESC;

--17. Select all columns for everyone by their ages in ascending order.
Select * from Employee order by Age;

--18. Select all columns for everyone by their salaries in descending order.
Select * from Employee order by Salary DESC;

--19. Select all columns for everyone by their salaries in ascending order.
Select * from Employee order by Salary;

--20. Select all columns for everyone by their salaries in ascending order whose age not less than 17.
Select * from Employee where age>=17 order by Salary;

--21. Select all columns for everyone by their salaries in descending order whose age not more than 34
Select * from Employee where age<=34 order by Salary DESC;

--22. Select all columns for everyone by their length of firstname in ascending order.
select * from Employee order by len(FirstName);

--23. Select the number of employees whose age is above 45
Select count(*) as NumberOfEmployees from Employee where age>45;

--24. Show the results by adding 5 to ages and removing 250 from salaries of all employees
Select FirstName,LastName,Title,(Age+5) as Age , (Salary-250) as Salary from Employee;

--25. Select the number of employees whose lastname ends with "re" or "ri" or "ks"
Select Count(*) as count from Employee where LastName like '%re' or LastName like '%ri' or LastName like '%ks';

--26. Select the average salary of all your employees
Select avg(Salary) as AverageSalary from Employee;

--27. Select the average salary of Freshers
Select avg(Salary) as AverageSalary from Employee where Title='Fresher';

--28. Select the average age of Programmers
Select avg(Age) as AverageAge from Employee where Title='programmer';

--29. Select the average salary of employees whose age is not less than 35 and not more than 50
select avg(salary) as AverageSalary from Employee where Age between 35 and 50;

--30. Select the number of Freshers
Select Count(*) as NumberOfFreshers from Employee where Title='Fresher';

--31. What percentage of programmers constitute your employees
select Count(*)*100/(select count(*) from Employee) as [percentage] from Employee where Title like 'programmer';

--32. What is the combined salary that you need to pay to the employees whose age is not less than 40
Select sum(Salary) as Total from Employee where Age>=40;

--33. What is the combined salary that you need to pay to all the Freshers and Programmers for 1 month
Select Sum(Salary) as TotalSalary from Employee where Title like 'Fresher' or Title='programmer';

--34. What is the combined salary that you need to pay to all the Freshers whose age is greater than 27 for 3years
Select Sum(Salary)*3*12 as Salary from Employee where Title like 'Fresher' and Age>27;

--35. Select the eldest employee's firstname, lastname and age whose salary is less than 35000
select FirstName,LastName,Age from Employee where Age in (select Max(Age) from Employee where Salary<35000);

--36. Who is the youngest General Manager
Select * from Employee where Age in (select min(Age) from Employee where Title like 'Manager');

--37. Select the eldest fresher whose salary is less than 35000
select * from Employee where Age in (select Max(Age) from Employee where Title='Fresher' and Salary<35000);

--38. Select firstname and age of everyone whose firstname starts with "John" or "Michael" and salary in the range 17000 and 26000
select FirstName,Age from Employee where (FirstName like 'John' or FirstName like 'Micheal') and (Salary between 17000 and 26000);
select FirstName,Age from Employee where (Salary between 17000 and 26000) and FirstName in (select FirstName from Employee where (FirstName like 'John' or FirstName like 'Micheal'));

--39. How many employees are having each unique title. Select the title and display the number of employees present in ascending order
select Title,Count(Title) as NoOFEmployees from Employee group by Title;


--40. What is the average salary of each unique title of the employees. Select the title and display the average salary of employees in each
select Title,Avg(Salary) as AverageSalary from Employee group by Title;

--41. What is the average salary of employees excluding Freshers
select Title, Avg(Salary) as averageSalary from Employee where Title not like 'Fresher' group by Title;

--42. What is the average age of employees of each unique title.
Select Title,Avg(Age) as AverageAge from Employee group by Title;

--43. In the age range of 25 to 40 get the number of employees under each unique title.
select Title,Count(Title) as NoOfEmployees from Employee where Age between 25 and 40 group by Title;

--44. Show the average salary of each unique title of employees only if the average salary is not less than 25000
Select Title,Avg(Salary) as AverageSalary from Employee Group by Title having Avg(Salary)>=25000;

--45. Show the sum of ages of each unique title of employee only if the sum of age is greater than 30
Select Title,Sum(Age) as Age from Employee group by Title having sum(Age)>30;

--46.Lisa Ray just got married to Michael Moore. She has requested that her last name be updated to Moore.
update Employee set LastName='Moore' where FirstName like 'Lisa' and LastName like 'Ray';

--47.Ginger Finger's birthday is today, add 1 to his age and a bonus of 5000
update Employee set Age=Age+1 ,Salary+=5000 where FirstName like 'Ginger' and LastName like 'Finger';

--48.All 'Programmer's are now called "Engineer"s. Update all titles accordingly.
update Employee set Title='Engineer' where Title like 'programmer';

--49.Everyone whose making under 30000 are to receive a 3500 bonus. 
update Employee set Salary+=3500 where Salary<30000;

--50. Everyone whose making over 35500 are to be deducted 15% of their salaries
update Employee set Salary-=(Salary*15)/100 where Salary>35500;