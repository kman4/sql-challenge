-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


SET XACT_ABORT ON

BEGIN TRANSACTION QUICKDBD

CREATE TABLE [Department_emp] (
    [emp_no] INT  NOT NULL ,
    [dept_no] VARCHAR(4)  NOT NULL 
)

CREATE TABLE [Department] (
    [dept_no] VARCHAR(4)  NOT NULL ,
    [dept_name] VARCHAR(100)  NOT NULL 
)

CREATE TABLE [Department_mgr] (
    [dept_no] VARCHAR(4)  NOT NULL ,
    [emp_no] INT  NOT NULL 
)

CREATE TABLE [Employee] (
    [emp_no] INT  NOT NULL ,
    [emp_title] VARCHAR(5)  NOT NULL ,
    [birth_date] VARCHAR(50)  NOT NULL ,
    [first_name] VARCHAR(100)  NOT NULL ,
    [last_name] VARCHAR(100)  NOT NULL ,
    [sex] VARCHAR(2)  NOT NULL ,
    [hire_date] VARCHAR(50)  NOT NULL 
)

CREATE TABLE [Salaries] (
    [emp_no] INT  NOT NULL ,
    [salary] INT  NOT NULL 
)

CREATE TABLE [Titles] (
    [title_id] VARCHAR(5)  NOT NULL ,
    [title] VARCHAR(25)  NOT NULL 
)

ALTER TABLE [Department_emp] WITH CHECK ADD CONSTRAINT [FK_Department_emp_dept_no] FOREIGN KEY([dept_no])
REFERENCES [Department] ([dept_no])

ALTER TABLE [Department_emp] CHECK CONSTRAINT [FK_Department_emp_dept_no]

ALTER TABLE [Department] WITH CHECK ADD CONSTRAINT [FK_Department_dept_no] FOREIGN KEY([dept_no])
REFERENCES [Department_mgr] ([dept_no])

ALTER TABLE [Department] CHECK CONSTRAINT [FK_Department_dept_no]

ALTER TABLE [Department_mgr] WITH CHECK ADD CONSTRAINT [FK_Department_mgr_emp_no] FOREIGN KEY([emp_no])
REFERENCES [Employee] ([emp_no])

ALTER TABLE [Department_mgr] CHECK CONSTRAINT [FK_Department_mgr_emp_no]

ALTER TABLE [Employee] WITH CHECK ADD CONSTRAINT [FK_Employee_emp_title] FOREIGN KEY([emp_title])
REFERENCES [Titles] ([title_id])

ALTER TABLE [Employee] CHECK CONSTRAINT [FK_Employee_emp_title]

ALTER TABLE [Salaries] WITH CHECK ADD CONSTRAINT [FK_Salaries_emp_no] FOREIGN KEY([emp_no])
REFERENCES [Employee] ([emp_no])

ALTER TABLE [Salaries] CHECK CONSTRAINT [FK_Salaries_emp_no]

COMMIT TRANSACTION QUICKDBD