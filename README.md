# Database Management Systems (DBMS) Laboratory

This repository contains the complete laboratory curriculum for Database Management Systems (DBMS). Each experiment is organized in a self-contained directory containing the professional documentation and an all-in-one, run-ready SQL script engineered to execute flawlessly in online compilers and local MySQL environments.

---

## Curriculum Overview

| Experiment | Title / Topic | Run-Ready SQL File | Key Concepts Covered |
| :--- | :--- | :--- | :--- |
| **[Experiment 1](./Experiment-1/)** | **E-Commerce ER Modeling** | `ER_Diagram.drawio` | Weak entities, composite/multi-valued attributes, specialization, cardinality |
| **[Experiment 2](./Experiment-2/)** | **Relational Schema & Constraints** | `ecommerce_schema.sql` | 12 tables, primary keys, foreign keys, `ON DELETE CASCADE`, `ON DELETE SET NULL` |
| **[Experiment 3](./Experiment-3/)** | **DML & Basic Querying** | `employee_management.sql` | 30 employees, 5 departments, 8 projects, Aggregates, `GROUP BY`, `HAVING`, `CASE` |
| **[Experiment 4](./Experiment-4/)** | **Advanced Joins & Subqueries** | `joins_and_subqueries.sql` | INNER, LEFT, SELF, 3-way joins, correlated subqueries, `EXISTS`, set operations, `EXPLAIN` |
| **[Experiment 5](./Experiment-5/)** | **Views & Recursive CTEs** | `views_and_recursive_cte.sql` | Virtual tables, updatability checks via `information_schema`, hierarchical CTE |
| **[Experiment 6](./Experiment-6/)** | **Procedures, Triggers & Auditing** | `procedures_and_triggers.sql` | `transfer_employee` stored procedure, rollback handlers, salary & audit triggers |
| **[Experiment 7](./Experiment-7/)** | **Schema Normalization** | `schema_normalization.sql` | Step-by-step UNF $\rightarrow$ 1NF $\rightarrow$ 2NF $\rightarrow$ 3NF $\rightarrow$ BCNF, lossless join verification |

---

## Repository Structure

```text
DBMS-Lab/
├── .gitignore
├── README.md
├── Experiment-1/
│   ├── ER_Diagram.drawio
│   └── README.md
├── Experiment-2/
│   ├── ecommerce_schema.sql
│   └── README.md
├── Experiment-3/
│   ├── employee_management.sql
│   └── README.md
├── Experiment-4/
│   ├── joins_and_subqueries.sql
│   └── README.md
├── Experiment-5/
│   ├── views_and_recursive_cte.sql
│   └── README.md
├── Experiment-6/
│   ├── procedures_and_triggers.sql
│   └── README.md
└── Experiment-7/
    ├── schema_normalization.sql
    └── README.md
```

---

## Execution Instructions

### Option 1: Running in Online Compilers (Instant Execution)
Every experiment's SQL file is completely self-contained and idempotent (includes clean table reset logic, schema creation, data insertion, and all required operations):
1. Open an online MySQL compiler (e.g., [OneCompiler MySQL](https://onecompiler.com/mysql) or [DB Fiddle](https://www.db-fiddle.com/)).
2. Navigate to the desired experiment folder above and copy the entire contents of the `.sql` file.
3. Paste into the compiler editor and click **Run**.
4. All tables, outputs, and verification results will render immediately in the output console with zero setup.

### Option 2: Running in Local MySQL Server / Workbench
1. Connect to your MySQL instance:
   ```bash
   mysql -u root -p
   ```
2. Create and select the database:
   ```sql
   CREATE DATABASE IF NOT EXISTS dbms_lab;
   USE dbms_lab;
   ```
3. Run any experiment file directly:
   ```sql
   SOURCE path/to/Experiment-2/ecommerce_schema.sql;
   ```
