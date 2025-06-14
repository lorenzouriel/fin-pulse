-- Create stocks table
CREATE TABLE stocks (
    id INT IDENTITY(1,1) PRIMARY KEY,
    ticker VARCHAR(10) NOT NULL,
    name VARCHAR(100) NOT NULL,
    sector VARCHAR(100),
    industry VARCHAR(100),
    currency VARCHAR(10),
    created_at DATETIME DEFAULT GETDATE()
);

-- Create stock_data table
CREATE TABLE stock_data (
    id INT IDENTITY(1,1) PRIMARY KEY,
    stock_id INT NOT NULL,
    date DATE NOT NULL,
    open_price DECIMAL(10,2) NOT NULL,
    close_price DECIMAL(10,2) NOT NULL,
    high_price DECIMAL(10,2) NOT NULL,
    low_price DECIMAL(10,2) NOT NULL,
    volume BIGINT NOT NULL,
    created_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (stock_id) REFERENCES stocks(id)
);

-- Create cryptocurrencies table
CREATE TABLE cryptocurrencies (
    id INT IDENTITY(1,1) PRIMARY KEY,
    symbol VARCHAR(10) NOT NULL,
    name VARCHAR(100) NOT NULL,
    algorithm VARCHAR(50),
    platform VARCHAR(100),
    created_at DATETIME DEFAULT GETDATE()
);

-- Create crypto_data table
CREATE TABLE crypto_data (
    id INT IDENTITY(1,1) PRIMARY KEY,
    crypto_id INT NOT NULL,
    date DATE NOT NULL,
    open_price DECIMAL(18,8) NOT NULL,
    close_price DECIMAL(18,8) NOT NULL,
    high_price DECIMAL(18,8) NOT NULL,
    low_price DECIMAL(18,8) NOT NULL,
    volume DECIMAL(18,8) NOT NULL,
    created_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (crypto_id) REFERENCES cryptocurrencies(id)
);

-- Create currencies table
CREATE TABLE currencies (
    currency_code VARCHAR(10) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    symbol VARCHAR(10),
    country VARCHAR(100),
    created_at DATETIME DEFAULT GETDATE()
);

-- Create currency_rates table
CREATE TABLE currency_rates (
    rate_id INT IDENTITY(1,1) PRIMARY KEY,
    currency_code VARCHAR(10) NOT NULL,
    base_currency_code VARCHAR(10) NOT NULL,
    date DATE NOT NULL,
    rate DECIMAL(18,8) NOT NULL,
    created_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (currency_code) REFERENCES currencies(currency_code),
    FOREIGN KEY (base_currency_code) REFERENCES currencies(currency_code)
);

-- Create users table
CREATE TABLE users (
    id INT IDENTITY(1,1) PRIMARY KEY,
    username VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    access_key VARCHAR(100) NOT NULL,
    created_at DATETIME DEFAULT GETDATE()
);

-- Create expense_categories table
CREATE TABLE expense_categories (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    created_at DATETIME DEFAULT GETDATE()
);

-- Create expenses table
CREATE TABLE expenses (
    id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT NOT NULL,
    category_id INT NOT NULL,
    payment_method VARCHAR(30) NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    currency VARCHAR(10) NOT NULL,
    description VARCHAR(255),
    expense_date DATE NOT NULL,
    created_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (category_id) REFERENCES expense_categories(id)
);

-- Create user_selections table
CREATE TABLE user_selections (
    id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT NOT NULL,
    stock_id INT,
    crypto_id INT,
    currency_code VARCHAR(10),
    selected_at DATETIME NOT NULL,
    created_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (stock_id) REFERENCES stocks(id),
    FOREIGN KEY (crypto_id) REFERENCES cryptocurrencies(id),
    FOREIGN KEY (currency_code) REFERENCES currencies(currency_code)
);

-- Create indexes for better performance
CREATE INDEX idx_stock_data_stock_id ON stock_data(stock_id);
CREATE INDEX idx_stock_data_date ON stock_data(date);
CREATE INDEX idx_crypto_data_crypto_id ON crypto_data(crypto_id);
CREATE INDEX idx_crypto_data_date ON crypto_data(date);
CREATE INDEX idx_currency_rates_date ON currency_rates(date);
CREATE INDEX idx_currency_rates_codes ON currency_rates(currency_code, base_currency_code);
CREATE INDEX idx_expenses_user_id ON expenses(user_id);
CREATE INDEX idx_expenses_date ON expenses(expense_date);
CREATE INDEX idx_user_selections_user_id ON user_selections(user_id);