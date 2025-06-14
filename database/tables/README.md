# Database Schema Overview

This document provides a concise overview of the database schema designed for managing stock market data **and personal expense tracking**. The schema comprises several tables, each serving a specific purpose in storing and organizing relevant information.

### Tables and Objectives

| Table Name             | Objective                                                                 |
|------------------------|---------------------------------------------------------------------------|
| **Stocks**             | Stores information about individual stocks, including their identifiers, names, sectors, and trading currency. |
| **Stock Data**         | Contains daily trading data for stocks, including opening and closing prices, volume, and date of the data. |
| **Stock Performance**  | Records performance metrics for stocks over time, such as percentage change and moving averages. |
| **User Selections**    | Tracks user-selected stocks for personalized monitoring or analysis.      |
| **Users**              | Manages user information, including usernames, emails, and access keys.   |
| **Expenses**           | Stores users' financial expenses with details on amount, category, payment method, and dates. |
| **Expense Categories** | Classifies expenses into categories for organization and reporting.       |

## [dbdiagram.io](https://dbdiagram.io/d)
```sql
Table stocks {
  stock_id int [pk, increment] // Unique identifier for the stock
  ticker varchar(10) // Asset code (e.g., AAPL, TSLA)
  name varchar(100) // Full company name
  sector varchar(100) // Company sector (e.g., Technology)
  industry varchar(100) // Company industry (e.g., Semiconductors)
  currency varchar(10) // Trading currency (e.g., USD)
  created_at timestamp // Record creation date
}

Table stock_data {
  data_id int [pk, increment] // Unique identifier for the data
  stock_id int [ref: > stocks.stock_id] // Foreign key to the stocks table
  date date // Quote date
  open_price decimal(10,2) // Opening price of the stock
  close_price decimal(10,2) // Closing price of the stock
  high_price decimal(10,2) // Highest price of the stock for the day
  low_price decimal(10,2) // Lowest price of the stock for the day
  volume bigint // Trading volume of the stock
  created_at timestamp // Record creation date
}

Table stock_performance {
  performance_id int [pk, increment] // Unique identifier for performance
  stock_id int [ref: > stocks.stock_id] // Relationship with the stocks table
  date date // Date of performance analysis
  percent_change decimal(5,2) // Percentage change of the asset
  moving_avg decimal(10,2) // Calculated moving average
  created_at timestamp // Date of record creation
}

Table user_selections {
  selection_id int [pk, increment] // Unique identifier for the selection
  user_id int [ref: > users.user_id] // Foreign key to the users table
  stock_id int [ref: > stocks.stock_id] // Foreign key to the stocks table
  selected_at timestamp // Selection date and time
  created_at timestamp // Record creation date
}

Table users {
  user_id int [pk, increment] // Unique identifier for the user
  username varchar(100) // Username
  email varchar(100) // User email
  access_key varchar(100) // Access key
  created_at timestamp // Record creation date
}

Table expenses {
  expense_id int [pk, increment] // Unique expense ID
  user_id int [ref: > users.user_id] // Who made the expense
  category_id int [ref: > expense_categories.category_id] // Expense category
  payment_method varchar(30) // Payment method used
  amount decimal(10,2) // Expense amount
  currency varchar(10) // Currency of the transaction (e.g., USD, BRL)
  description varchar(255) // Optional description
  expense_date date // Date the expense occurred
  created_at timestamp // When the record was created
}

Table expense_categories {
  category_id int [pk, increment] // Category ID
  name varchar(100) // Category name (e.g., Food, Transport)
  color varchar(10) // Optional color code for visualizations
  created_at timestamp
}
```