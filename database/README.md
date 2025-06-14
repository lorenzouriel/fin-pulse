# Database Schema Overview

This document provides a concise overview of the database schema designed for managing stock market data, cryptocurrency tracking, **currency exchange**, and **personal expense management**. The schema is structured to support a financial AI agent that helps users monitor investments and track spending.

### Tables and Objectives

| Table Name             | Objective                                                                             |
| ---------------------- | ------------------------------------------------------------------------------------- |
| **Stocks**             | Stores information about individual stocks, including ticker, sector, and currency.   |
| **Stock Data**         | Contains historical price and volume data for stocks.                                 |
| **Cryptocurrencies**   | Stores information about cryptocurrencies, including symbol, platform, and algorithm. |
| **Crypto Data**        | Holds historical pricing and volume data for cryptocurrencies.                        |
| **Currencies**         | Stores fiat currency data including symbol and country.                               |
| **Currency Rates**     | Maintains historical exchange rates between currencies.                               |
| **User Selections**    | Tracks user-selected assets: stocks, cryptocurrencies, and currencies.                |
| **Users**              | Manages user credentials and identification.                                          |
| **Expenses**           | Stores financial transactions made by users.                                          |
| **Expense Categories** | Organizes expenses into logical categories (e.g., Food, Transport).                   |

---

## [dbdiagram.io](https://dbdiagram.io/d)

```sql
Table stocks {
  id int [pk, increment] // Unique identifier for the stock
  ticker varchar(10) // Asset code (e.g., AAPL, TSLA)
  name varchar(100) // Full company name
  sector varchar(100) // Company sector (e.g., Technology)
  industry varchar(100) // Company industry (e.g., Semiconductors)
  currency varchar(10) // Trading currency (e.g., USD)
  created_at timestamp // Record creation date
}

Table stock_data {
  id int [pk, increment] // Unique identifier for the data
  stock_id int [ref: > stocks.id] // Foreign key to the stocks table
  date date // Quote date
  open_price decimal(10,2) // Opening price of the stock
  close_price decimal(10,2) // Closing price of the stock
  high_price decimal(10,2) // Highest price of the stock for the day
  low_price decimal(10,2) // Lowest price of the stock for the day
  volume bigint // Trading volume of the stock
  created_at timestamp // Record creation date
}

Table cryptocurrencies {
  id int [pk, increment] // Unique identifier for the cryptocurrency
  symbol varchar(10) // Symbol of the cryptocurrency (e.g., BTC, ETH)
  name varchar(100) // Full name of the cryptocurrency
  algorithm varchar(50) // Mining algorithm or consensus mechanism (e.g., PoW, PoS)
  platform varchar(100) // Blockchain platform (e.g., Ethereum, Binance Smart Chain)
  created_at timestamp
}

Table crypto_data {
  id int [pk, increment] // Unique identifier for the data
  crypto_id int [ref: > cryptocurrencies.id] // Foreign key to the cryptocurrencies table
  date date // Quote date
  open_price decimal(18,8) // Opening price
  close_price decimal(18,8) // Closing price
  high_price decimal(18,8) // Highest price for the day
  low_price decimal(18,8) // Lowest price for the day
  volume decimal(18,8) // Trading volume in base currency
  created_at timestamp
}

Table currencies {
  currency_code varchar(10) [pk] // Currency code (e.g., USD, BRL, EUR)
  name varchar(100) // Full currency name
  symbol varchar(10) // Currency symbol (e.g., $, R$, €)
  country varchar(100) // Country or region using the currency
  created_at timestamp
}

Table currency_rates {
  rate_id int [pk, increment] // Unique identifier for the exchange rate record
  currency_code varchar(10) [ref: > currencies.currency_code] // Currency code being referenced
  base_currency_code varchar(10) [ref: > currencies.currency_code] // Base currency code (e.g., USD)
  date date // Date of the exchange rate
  rate decimal(18,8) // Exchange rate (how much base currency equals one unit of currency_code)
  created_at timestamp
}

Table user_selections {
  id int [pk, increment] // Unique identifier for the selection
  user_id int [ref: > users.id] // Foreign key to the users table
  stock_id int [ref: > stocks.id, null] // Foreign key to stocks (nullable)
  crypto_id int [ref: > cryptocurrencies.id, null] // Foreign key to cryptocurrencies (nullable)
  currency_code varchar(10) [ref: > currencies.currency_code, null] // Foreign key to currencies (nullable)
  selected_at timestamp // Selection date and time
  created_at timestamp // Record creation date
}

Table users {
  id int [pk, increment] // Unique identifier for the user
  username varchar(100) // Username
  email varchar(100) // User email
  access_key varchar(100) // Access key
  created_at timestamp // Record creation date
}

Table expenses {
  id int [pk, increment] // Unique expense ID
  user_id int [ref: > users.id] // Who made the expense
  category_id int [ref: > expense_categories.id] // Expense category
  payment_method varchar(30) // Payment method used
  amount decimal(10,2) // Expense amount
  currency varchar(10) // Currency of the transaction (e.g., USD, BRL)
  description varchar(255) // Optional description
  expense_date date // Date the expense occurred
  created_at timestamp // When the record was created
}

Table expense_categories {
  id int [pk, increment] // Category ID
  name varchar(100) // Category name (e.g., Food, Transport)
  created_at timestamp
}
```