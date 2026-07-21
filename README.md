# 📁 Retail Store SQLite Database
A relational SQLite retail store database built with Python. The project generates four related tables (Customers, Products, Transactions and Transaction_Items) using NumPy and Pandas, and creates the database with Python’s sqlite3 module.

---

## Repository Structure

```text
Retail-Store-SQLite-Database/

│
├── data/
│   ├── Customers.csv
│   ├── Products.csv
│   ├── Transaction_Items.csv
│   └── Transactions.csv
│
├── database/
│   └── retail_database.db
│
├── notebooks/
│   └── SQL_retail_database.ipynb
│
├── sql/
│   └── queries.sql
│
├── .gitignore
└── README.md
```

## Overview

This repository contains a relational retail store database built with Python and SQLite. The project demonstrates the complete workflow of generating a realistic retail dataset, creating a relational database, and querying the data using SQL.

The database was generated entirely from scratch using Python. Customer records, products, transactions and transaction items were created programmatically to simulate a retail store while maintaining relationships between tables through primary keys, foreign keys and a compound primary key.

The repository includes the Python notebook used to generate the data, the SQLite database, the exported CSV files and a collection of SQL queries for retrieving and summarising information from the database.

---

## Features

* Generates a synthetic retail dataset using Python.
* Creates four related database tables.
* Implements primary keys, foreign keys and a compound primary key.
* Applies SQL constraints to maintain data integrity.
* Exports the generated datasets as CSV files.
* Creates an SQLite database directly from Python.
* Includes example SQL queries demonstrating joins, filtering and aggregation.

---

## Technologies and Libraries Used

### Programming Language

* Python

### Database

* SQLite

### Development Environment

* Google Colab

### Python Libraries

* NumPy
* Pandas
* sqlite3
* matplotlib
* google.colab.files

---

## Database Structure

The database consists of four related tables.

### Customers

Stores customer information including demographic details, loyalty membership and registration information.

**Primary Key**

* `customer_id`

---

### Products

Stores information about products available in the retail store.

**Primary Key**

* `product_id`

---

### Transactions

Stores information about each customer purchase.

**Primary Key**

* `transaction_id`

**Foreign Key**

* `customer_id` → `Customers(customer_id)`

---

### Transaction_Items

Stores the individual products purchased within each transaction.

**Compound Primary Key**

* (`transaction_id`, `product_id`)

**Foreign Keys**

* `transaction_id` → `Transactions(transaction_id)`
* `product_id` → `Products(product_id)`

---

## Data Generation

All datasets were generated programmatically using Python and stored in Pandas DataFrames before being exported as CSV files and inserted into SQLite.

The generated data consists of:

| Table             |                            Records |
| ----------------- | ---------------------------------: |
| Customers         |                              1,000 |
| Products          |                                250 |
| Transactions      |                              4,000 |
| Transaction_Items | Generated from transaction baskets, 12,000+ rows |

The dataset includes several features to make the generated data more representative of a retail environment, including:

* Gender-specific customer names.
* UK cities.
* Multiple product categories and brands.
* Category-based product pricing.
* Weighted loyalty tiers.
* Weighted payment methods.
* Random transaction dates between 2020 and 2024.
* Between one and eight products assigned to each transaction.
* Automatically calculated transaction totals.

### Missing Values

Twenty missing values were intentionally introduced into the **stock_quantity** column of the Products table. This simulates situations where inventory information may be incomplete because of delayed stock updates or data entry issues. Including missing values also makes the dataset more representative of the type of data quality issues commonly encountered during data analysis.

### Duplicate Products

The Products table was created by sampling the predefined product catalogue with replacement. As a result, some products appear more than once in the final dataset. This approach was used to expand the catalogue to the required number of product records while representing repeated inventory records that may occur in retail systems, such as different stock batches or similar products.

---

## SQL Constraints

The SQLite database includes several constraints to improve data quality and maintain relationships between tables.

Implemented constraints include:

* **Primary keys** for all main tables.
* **Foreign keys** linking related tables.
* **Compound primary key** in the Transaction_Items table.
* **`CHECK`** constraints on:

  * customer age
  * product price
  * product rating
  * transaction date
  * purchased quantity
  * transaction total
* **`NOT NULL`** constraints for mandatory fields.
* **`ON DELETE CASCADE`** between the Transactions and Transaction_Items tables.

---

## SQL Queries

The project includes several SQL queries demonstrating different ways of retrieving and summarising information from the database.

### 1. Customer Transaction Summary

Returns customer age, transaction total and satisfaction level by joining the Customers and Transactions tables.

```sql
SELECT age,
       total_amount_GBP,
       customer_id,
       satisfaction_level
FROM Customers
JOIN Transactions USING (customer_id);
```

---

### 2. Total Number of Customers

Returns the total number of customer records.

```sql
SELECT COUNT(*) AS total_customers
FROM Customers;
```

---

### 3. Customer Distribution by Loyalty Tier

Returns the number of customers within each loyalty tier.

```sql
SELECT loyalty_tier,
       COUNT(*) AS num_customers
FROM Customers
GROUP BY loyalty_tier;
```

---

### 4. Total Number of Products

Returns the total number of products stored in the database.

```sql
SELECT COUNT(*) AS total_products
FROM Products;
```

---

### 5. Product Distribution by Category

Returns the number of products within each category.

```sql
SELECT category,
       COUNT(*) AS num_products
FROM Products
GROUP BY category;
```

---

### 6. Products with Low Stock

Returns products with fewer than 27 units currently in stock.

```sql
SELECT product_id,
       product_name,
       stock_quantity
FROM Products
WHERE stock_quantity < 27;
```

---

### 7. Total Number of Transactions

Returns the total number of recorded transactions.

```sql
SELECT COUNT(*) AS total_transactions
FROM Transactions;
```

---

### 8. Transactions by Payment Method

Returns the number of transactions completed using each payment method.

```sql
SELECT payment_method,
       COUNT(*) AS num_transactions
FROM Transactions
GROUP BY payment_method;
```

---

## Ethics and Data Privacy Considerations

* No real customer information was used in this project.
* All customer `names`, `email addresses`, `ages` and other customer attributes were generated programmatically using Python.
* Twenty missing values were intentionally introduced into the **stock_quantity** column of the `products table` to simulate incomplete inventory records that may occur in real-world retail systems.
* Duplicate product records were generated by sampling the predefined product catalogue with replacement to increase the number of product records while representing repeated inventory entries.
* Because the dataset is entirely synthetic, no personal or sensitive information is stored or exposed.

---

## Running the Project

1. Open the Jupyter notebook.
2. Run all notebook cells in sequence.
3. The notebook generates the four CSV datasets.
4. The SQLite database is created automatically.
5. Open `retail_database.db` in SQLite.
6. Execute the SQL statements in `sql/queries.sql` to reproduce the example queries.

---

## Future Improvements

Possible future enhancements include:

* Expanding the product catalogue with additional categories and brands.
* Adding more SQL queries for advanced data analysis.
* Creating dashboards to visualise customer purchasing behaviour and sales trends.
* Integrating the database with a web application or API.
