# SQL Practice Project

A hands-on SQL practice project built around an employee-management database. The script creates sample tables, inserts realistic sample records, and explores common SQL operations used in data querying and database management.

## Project Overview

This project is designed for practicing SQL fundamentals and intermediate query-writing skills using a small relational database. The examples focus on employees, departments, bonuses, projects, and employee project assignments.

## Technologies Used

- **SQL**
- **MySQL** (the script uses MySQL-specific syntax such as `USE`, `MODIFY COLUMN`, and `SQL_SAFE_UPDATES`)

## Database Schema

The script creates and works with the following tables:

| Table | Purpose |
|---|---|
| `emp` | Employee details, including manager, department, salary, hire date, and email |
| `EmployeeBonus` | Bonus records associated with employees |
| `Departments` | Department names and locations |
| `EmployeeProjects` | Employee project assignments, hours worked, and assignment dates |
| `Projects` | Project details, department association, budget, and project dates |

### Relationships

- `EmployeeBonus.emp_id` references `emp.id`.
- `emp.dept_id` is intended to reference `Departments.dept_id`.
- `EmployeeProjects.emp_id` connects employee records with project assignments.
- `EmployeeProjects.project_id` is intended to reference `Projects.project_id`.

## SQL Concepts Practiced

The script contains examples of:

- Creating databases and tables with `CREATE DATABASE` and `CREATE TABLE`
- Defining primary keys and foreign-key constraints
- Inserting sample records with `INSERT INTO`
- Joining employee and department data
- Filtering records with `WHERE`
- Updating or calculating salary values
- Altering table structures with `ALTER TABLE`
- Using aggregate functions such as `COUNT`, `MIN`, `MAX`, `AVG`, and `SUM`
- Grouping results with `GROUP BY` and filtering groups with `HAVING`
- Sorting and limiting results with `ORDER BY` and `LIMIT`
- Deleting records based on related-table data
- Using Common Table Expressions (CTEs) with `WITH`

## Project Structure

```text
sql-practice-main/
├── README.md
└── sql-exam-1-10.sql
```

## Getting Started

### 1. Install or open MySQL

Use MySQL Server with a SQL editor such as MySQL Workbench, or another compatible MySQL client.

### 2. Open the SQL script

Open `sql-exam-1-10.sql` in your SQL editor.

### 3. Review the script before execution

The script creates a database named `exam` and modifies its tables. Review the statements before running them, especially the `DELETE` statement and any commands that disable safe-update checks.

### 4. Execute the script

Run the statements in order so that the tables and referenced records are created before foreign-key constraints are added.

### 5. Inspect the results

Run individual `SELECT` queries and review their outputs to understand how joins, filters, grouping, and aggregate functions work.

## Important Notes

- The SQL file is a practice script and may require corrections before it runs from beginning to end. For example, check the spelling of `SQL_SAFE_UPDATES`, ensure joins have the appropriate `ON` conditions, and use parentheses when combining `AND` and `OR` conditions.
- Some statements depend on tables or constraints created in earlier sections. Execute the script in order.
- The `DELETE` statement removes employees who do not have a matching record in `EmployeeProjects`. Use a test database and verify the target rows before executing destructive statements.
- Exact syntax and behavior can vary by MySQL version.

## Learning Outcomes

By working through this project, you can practice building relational tables, connecting data with keys, querying across multiple tables, summarizing records, and interpreting SQL query results.

## Future Improvements

- Add the expected output or screenshots for each question.
- Organize questions and solutions into separate SQL files.
- Add comments explaining the reasoning behind each query.
- Validate and correct each query against a specific MySQL version.
- Add sample result sets to make the project easier to review.

## Author

Created as a hands-on SQL practice project for strengthening database querying and problem-solving skills.
