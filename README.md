# DBMS Lab Experiments

This repository contains the completed experiments for the Database Management Systems (DBMS) Lab course. 
The repository is structured logically by experiment number, each covering distinct DBMS concepts ranging from Entity-Relationship modeling to stored procedures and triggers.

## Experiments Overview

### [Experiment 1: ER Diagram](./Experiment-1/)
- **Topic:** Database Design (ER Modeling)
- **Description:** Design an ER diagram for an Indian e-commerce platform using concepts like weak entities, multi-valued attributes, composite attributes, and specialization.
- **Files Included:** 
  - `ER_Diagram.drawio`: The raw diagram file.
  - `README.md`: Contains a Mermaid visual representation of the ER diagram.
  - `requirements.txt`: Requirements prompt.

### [Experiment 2: Relational Schema](./Experiment-2/)
- **Topic:** Relational Schema & Integrity Constraints
- **Description:** Conversion of the ER diagram into a relational schema with proper primary/foreign keys, constraints, and cascading rules.
- **Files Included:** 
  - `schema.sql`: Table definitions.
  - `sample_data.sql`: Example insertion data.
  - `referential_integrity.sql`: Queries demonstrating FK constraint enforcement.
  - `README.md`: Explanations of referential integrity rules.

### [Experiment 3: Employee-Department-Project Schema](./Experiment-3/)
- **Topic:** Basic SQL Queries (Selection, Aggregates, GROUP BY)
- **Description:** Creates an organizational structure and runs fundamental Data Manipulation Language (DML) statements.
- **Files Included:** 
  - `schema.sql`: Schema definition.
  - `sample_data.sql`: Generated dataset for 30 employees, 5 departments, 8 projects.
  - `queries.sql`: Implementation of basic select, group, and aggregate queries.
  - `README.md`: Directory overview.

### [Experiment 4: Joins and Subqueries](./Experiment-4/)
- **Topic:** Advanced Querying
- **Description:** Demonstrates complex joining methods and nested subqueries on the organizational schema.
- **Files Included:** 
  - `queries.sql`: Implementations of INNER, LEFT, SELF, 3-way joins, and subqueries.
  - `explain_plans.sql`: `EXPLAIN` statements for query analysis.
  - `README.md`: Detailed descriptions of each query type.

### [Experiment 5: Views and Recursive CTEs](./Experiment-5/)
- **Topic:** Virtual Tables and Hierarchical Querying
- **Description:** Implements database views and demonstrates how to query a recursive employee hierarchy using CTEs.
- **Files Included:** 
  - `views.sql`: View definitions and updatability tests.
  - `recursive_cte.sql`: Traversal of the managerial hierarchy.
  - `README.md`: Notes on view updatability rules.

### [Experiment 6: Stored Procedures and Triggers](./Experiment-6/)
- **Topic:** Procedural SQL, Transactions, and Auditing
- **Description:** Implements custom logic using stored procedures and enforces strict business rules using table triggers.
- **Files Included:** 
  - `procedure.sql`: Stored procedure for employee transfer.
  - `triggers.sql`: Triggers for salary validation and logging.
  - `test_cases.sql`: Tests valid and invalid database state transitions.
  - `README.md`: Expected failure/success conditions for the test cases.

## Execution Instructions

To execute the SQL scripts, you will need a running instance of a MySQL server.

1. Create and select a new database:
   ```sql
   CREATE DATABASE dbms_lab;
   USE dbms_lab;
   ```
2. For each experiment, execute the files in this order (where applicable):
   ```sql
   SOURCE path/to/schema.sql;
   SOURCE path/to/sample_data.sql;
   SOURCE path/to/queries.sql;
   ```
3. *Note*: In `Experiment-2` and `Experiment-6`, some SQL queries inside `referential_integrity.sql` and `test_cases.sql` are intentionally designed to violate constraints and raise errors to prove that the schema rules work. If your SQL client halts execution on an error, you must execute the failing lines individually or bypass errors to see subsequent successful lines. Read the corresponding `README.md` files for details on what should fail.
