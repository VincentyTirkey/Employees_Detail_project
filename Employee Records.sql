
create database  Employees_DB
use Employees_DB

create table Employees_Detail(
             Ecode Int primary key, Name varchar(20),
			 Department varchar(50), Hiredate Date)

insert into Employees_Detail(
            Ecode,Name,Department,Hiredate)
			values 
			('1009','Peter','NBT-03','2019-05-06')

CREATE TABLE Projects(Ecode varchar (10) , Project varchar(20) , Critical INT)

INSERT INTO Projects(Ecode, Project, Critical)
            VALUES
            (1001, 'RIT', 1),
            (1003, 'QUBEC', 2),
            (1004, 'MJES', 1),
            (1005, 'RIT', 2),
            (1005, 'NQX', 1),
            (1006, 'QUBEC', 2),
            (1007, 'QREV', 3)

			CREATE TABLE Working_data(Critical INT, Level varchar(20))

            INSERT INTO Working_data(Critical, Level)
               VALUES
            (1, 'High'),
            (2, 'Cool'),
            (3, 'Low')

			select * from Employees_Detail
            select * from projects
            select * from Working_data
			
			select * from [dbo].[Employees_Detail] as e
			select * from [dbo].[Projects] as p

			select e.Ecode, e.[Name],e.[department], e.Hiredate, p.project, p.critical
			from [dbo].[Employees_Detail] as e
			inner join
			[dbo].[Projects] as p
			on e.Ecode = p.Ecode

            ----Answer 1. How Many Employees are working on at least one Project. (Hint: use join)
            
			select e.Ecode, e.[Name], p.project
			from [dbo].[Employees_Detail] as e
			inner join
			[dbo].[Projects] as p
			on e.Ecode = p.Ecode

			----Answer 2. How Many Employees are not working on any project. (Hint: use join)
			
				select e.Ecode, e.[Name],e.[department], isnull (p.project, 'No Project') as [Project Name]
				from [dbo].[Employees_Detail] as e
				Left join
				[dbo].[Projects] as p
				on e.Ecode = p.Ecode
				where p.project is null

			---Answer 3. How Many Employees are working on more than one Project.
			
			select e.Ecode, e.[Name], p.project, p.critical as [Working]
			from [dbo].[Employees_Detail] as e
			Left join
			[dbo].[Projects] as p
			on e.Ecode = p.Ecode
			where p.critical > 1

		    ---- Answer 4.	Show the Name, Dept, [Hire date] of the Employees working on RIT Project.

			select e.Ecode, e.[Name],e.[department], e.Hiredate, p.project
			from [dbo].[Employees_Detail] as e
			Left join
			[dbo].[Projects] as p
			on e.Ecode = p.Ecode
			where p.project = 'RIT'

			----Answer 5. Show the Ecode, Name, Dept of the Employees working on High and Cool.

			select * from Employees_Detail as e
			select * from Projects as p
			select * from Working_data as w
            
			select e.Ecode, e.Name, e.Department, e.Hiredate, p.Project, p.Critical, w.Level
			from [dbo].[Employees_Detail] as e
			left join
			[dbo].[Projects] as p
			on e.Ecode = p.Ecode
			left join
			[dbo].[Working_data] as w
			on p.Critical = w.Critical
			where w.Level in ('High','Cool' )

			----Answer 6. Show the Ecode, Name, Dept of the Employees hired in May 2019.

            select ecode, name, department, year([Hiredate]) as [HireYear], month([Hiredate]) as [Hire Month] 
		    from [dbo].[Employees_Detail]
			where year([Hiredate]) = 2019 and
			month([Hiredate]) = 5

			---Answer 7. How many employees are working in each department.

			select count(ecode) as [Total employees], department from Employees_Detail
			group by Department	

			----Answer 8. How many employees are working in each department. 

			select department, count(Ecode) as [Total employees] from Employees_Detail
			where Department like 'AUT%'
			Group by Department
			
			---Answer 9. show the name of the projects where more than 1 employee is working.
			 
			select * from Employees_Detail as e
			select * from Projects as p

			select p.project, count(e.ecode) as [Employee number]
			from Employees_Detail as e
			left join
			Projects as p
			on e.ecode = p.Ecode
			group by Project	
			having count (e.ecode) > 1

			---Answer 10. Critical of brain is Low : (True or False)

			select * from Employees_Detail as e
			select * from Projects as p
			select * from Working_data as w

			select e.[Name], p.[Critical], w.Level
			from Employees_Detail as e 
			inner join 
			Projects as p
			on e.ecode = p.ecode
			inner join 
			Working_data as w
			on p.Critical = w.Critical

			select e.Name, w.Critical, Case 
			when e.Name = 'Brian' and w.Level = 'Low'
			then 'True' else 'False'
			end
			from Employees_Detail as e
			inner join 
			Projects as p 
			on e.Ecode = p.ecode
			inner join
			Working_data as w 
			on p.Critical = w.Critical
			where Name = 'Brian'

			---Answer 11. Show Ecode, Name, Department, Desc of the employee where project is RIT and the DEsc is High.

			
			select * from Employees_Detail as e
			select * from Projects as p
			select * from Working_data as w

			select e.Ecode, e.Name, p.Project, w.level 
			from Employees_Detail as e
			inner join
			Projects as p
			on e.Ecode = p.Ecode
			inner join
			Working_data as w
			on p.Critical = w.Critical
			where Project = 'RIT'
			AND level = 'High'
			       




			
			
