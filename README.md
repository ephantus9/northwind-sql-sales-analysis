# Northwind SQL Sales Analysis

## Project Overview
This project performs exploratory data analysis (EDA) on the Northwind relational database using SQL. The objective is to analyze sales performance, customer behavior, product trends, and employee activity by translating business questions into structured SQL queries.

## Dataset
The Northwind database contains transactional sales data across multiple related tables, including:
- customers
- orders
- orderdetails
- products
- categories
- suppliers
- employees
- shippers

The dataset simulates a retail distribution business and allows for real-world sales analysis.

## Business Questions Solved
- What are the top-performing product categories by revenue?
- Which customers generate the highest total revenue?
- What is the year-over-year growth in total sales?
- Which products are frequently ordered together?
- Which employees handle the highest order volumes?
- What is the monthly and quarterly sales trend?

## SQL Techniques Used
- Aggregations (SUM, COUNT, AVG)
- GROUP BY and HAVING
- Subqueries
- Common Table Expressions (CTEs)
- Window functions (RANK, ROW_NUMBER, SUM OVER)
- Date functions for monthly and yearly analysis
- Revenue calculations (Price × Quantity)

## Key Insights
- Revenue is concentrated among a small group of high-value customers.
- Certain product categories consistently outperform others in total sales.
- Sales activity shows clear monthly seasonality patterns.
- Employee order distribution highlights performance variation across staff.

