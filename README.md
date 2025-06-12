# sql-ecommerce-analytics
A comprehensive SQL analytics project on a simulated eCommerce database to derive business insights.
# 📦 eCommerce SQL Analytics Project

A comprehensive SQL project that simulates business analytics on an eCommerce platform, analyzing user behavior, product performance, and merchant activity using advanced SQL techniques.

---

## 🧠 Project Objective

To explore a realistic eCommerce database using **PostgreSQL**, performing queries that reveal customer insights, sales trends, product rankings, and operational metrics using:

- Joins & Aggregations
- Window Functions
- Common Table Expressions (CTEs)
- Subqueries & CASE Statements
- Time-based Analysis

---

## 🗃️ Dataset Structure

The simulated schema contains six tables:

- `users` – customer data with country codes  
- `orders` – order records linked to users  
- `order_items` – items included in each order  
- `products` – items listed by merchants  
- `merchants` – sellers linked to countries  
- `countries` – reference table for country codes

> See `data/ecommerce_schema.png` for a visual ERD.

---

## 📌 Key Business Questions Answered

### 👥 Customer Insights
- How many orders has each customer placed?
- Who are the top 5 most active users?
- What’s the order pattern over time?

### 📦 Product Analytics
- What are the most and least ordered products?
- Which products are ranked highest by merchant?
- Price-based segmentation (Low, Medium, High)

### 🧾 Merchant & Operations
- Merchants per country
- Product count per merchant
- Order status lifecycle tracking

### ⏱️ Time-Based Trends
- Monthly order trends
- Days between first and last order per user

---

## 🛠️ SQL Concepts Used

- `JOIN`, `LEFT JOIN`, `INNER JOIN`, `SELF JOIN`
- `GROUP BY`, `HAVING`, `CASE`
- `RANK()`, `DENSE_RANK()`, `LEAD()`, `LAG()`
- `FIRST_VALUE()`, `LAST_VALUE()`
- `EXTRACT()`, `DATEDIFF()`
- `CTEs` (Common Table Expressions)
- Subqueries (IN, NOT IN)

---

## 📁 Project Files

| File | Description |
|------|-------------|
| `sql_queries/` | Contains categorized SQL scripts |
| `results/` | Includes outputs or markdown summaries |
| `data/` | Optional ERD or schema visualizations |

---

## 📅 Timeline

- **Start Date:** May 15, 2025  
- **Completion Date:** May 30, 2025  

---

## 👩‍💻 Author

**Ishrat Amin**  
*Data & Business Analytics Enthusiast*  
📧 aminishrat414@gmail.com
🔗 https://bd.linkedin.com/in/ishratamin
🌐 ishratamin.com





