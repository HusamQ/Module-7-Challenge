Select emp_no, first_name, last_name 
From employees; 

Select title, from_date, to_date 
From Titles


Drop table retirement_titles
-- Creating a new table using into clause by Joining both tables employees and Titles
Select E.emp_no, E.first_name, E.last_name, T.from_date, T.to_date, T.title
into retirement_titles
From employees E
inner join Titles as T
on E.emp_no = T.emp_no
Where E.birth_date between '1952-01-01' AND '1955-12-31'
order by emp_no



Select * From retirement_titles
Limit 100


-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;

-- Retirement Titles table for employees who are born between January 1, 1952 and December 31, 1955 and save it into retiring_titles.csv
Select Count(title) CT, title
into retiring_titles
From unique_titles
Group by title
order by CT desc

--- Deliverable 2
--
Select Distinct On (E.emp_no) E.emp_no, E.first_name, E.last_name, E.birth_date,
De.from_date, De.to_date, Ti.title
--Into mentorship_eligibility
From (employees as E
inner join dept_emp as De
on (E.emp_no = De.emp_no)
Inner Join titles as Ti
on (E.emp_no = Ti.emp_no))
Where (E.birth_date between '1965-01-01' and '1965-12-31') and (De.to_date = '9990-01-01')
order by E.emp_no



Select from_date, to_date From dept_Emp
