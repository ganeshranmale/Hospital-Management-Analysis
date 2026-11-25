# Hospital-Management-Analysis
SQL analysis of hospital data, exploring patients, doctors, appointments, treatments, and billing.

# Hospital Management Analysis Using SQL

## About the Project

This is a beginner-level SQL project about hospital management. I used MySQL queries to explore hospital data and answer questions about patients, doctors, appointments, treatments, and billing.

The project helped me practice SQL and understand how a hospital database can be used to find useful information.

## Project Questions

The queries answer questions such as:

- How many patients, doctors, and appointments are recorded?
- How many appointments are completed, cancelled, or in other statuses?
- Which doctors have the most appointments?
- Which doctors have no appointments?
- How many treatments are given for each treatment type?
- What is the average and total cost of each treatment type?
- How much has been billed for each treatment type?
- Which patients have multiple appointments?
- Which patients have not made an appointment?
- How many bills are paid, pending, or failed?
- Which payment methods are used?
- What is the average bill amount by payment method or month?

## SQL Skills Used

While working on this project, I practiced:

- `SELECT` to choose information from tables
- `COUNT`, `SUM`, and `AVG` to calculate totals and averages
- `GROUP BY` to organize results into categories
- `HAVING` to filter grouped results
- `ORDER BY` to sort results
- `CASE` to count records based on conditions
- `JOIN` and `LEFT JOIN` to connect information from different tables
- `MONTH()` and `ROUND()` to work with dates and format numbers

## Database Tables

The queries use these tables:

- `patients` — patient records
- `doctors` — doctor details and specializations
- `appointments` — patient appointments and their status
- `treatments` — treatments and their costs
- `billing` — bill amounts, payment methods, and payment statuses

## Files

- `Hospital_Management_Analysis.sql` — SQL queries for the analysis

## How to Run the Project

1. Install or open MySQL.
2. Create the hospital database tables and add data.
3. Open `Hospital_Management_Analysis.sql` in a MySQL editor.
4. Run the queries to see the results.

**Note:** The SQL file contains analysis queries. It does not include the table creation statements or sample data, so you will need those separately before running the queries.

## What I Learned

This project gave me practice writing SQL queries and connecting related data across multiple tables. It also helped me see how data can answer practical questions about hospital appointments, treatments, and payments.
