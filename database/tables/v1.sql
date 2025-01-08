-- Table: Stocks
CREATE TABLE stocks (
    stock_id INT IDENTITY(1,1) PRIMARY KEY, -- Unique identifier for the stock
    ticker VARCHAR(10) NOT NULL, -- Asset code (e.g., AAPL, TSLA)
    name VARCHAR(100) NOT NULL, -- Full company name
    sector VARCHAR(100), -- Company sector (e.g., Technology)
    industry VARCHAR(100), -- Company industry (e.g., Semiconductors)
    currency VARCHAR(10), -- Trading currency (e.g., USD)
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Record creation date
);

EXEC sp_addextendedproperty 'MS_Description', 'Unique identifier for the stock', 'SCHEMA', 'dbo', 'TABLE', 'stocks', 'COLUMN', 'stock_id';
EXEC sp_addextendedproperty 'MS_Description', 'Asset code (e.g., AAPL, TSLA)', 'SCHEMA', 'dbo', 'TABLE', 'stocks', 'COLUMN', 'ticker';
EXEC sp_addextendedproperty 'MS_Description', 'Full company name', 'SCHEMA', 'dbo', 'TABLE', 'stocks', 'COLUMN', 'name';
EXEC sp_addextendedproperty 'MS_Description', 'Company sector (e.g., Technology)', 'SCHEMA', 'dbo', 'TABLE', 'stocks', 'COLUMN', 'sector';
EXEC sp_addextendedproperty 'MS_Description', 'Company industry (e.g., Semiconductors)', 'SCHEMA', 'dbo', 'TABLE', 'stocks', 'COLUMN', 'industry';
EXEC sp_addextendedproperty 'MS_Description', 'Trading currency (e.g., USD)', 'SCHEMA', 'dbo', 'TABLE', 'stocks', 'COLUMN', 'currency';
EXEC sp_addextendedproperty 'MS_Description', 'Record creation date', 'SCHEMA', 'dbo', 'TABLE', 'stocks', 'COLUMN', 'created_at';

-- Table: Stock Data
CREATE TABLE stock_data (
    data_id INT IDENTITY(1,1) PRIMARY KEY, -- Unique identifier for the data
    stock_id INT, -- Foreign key to the stocks table
    date DATE NOT NULL, -- Quote date
    open_price DECIMAL(10,2), -- Opening price of the stock
    close_price DECIMAL(10,2), -- Closing price of the stock
    high_price DECIMAL(10,2), -- Highest price of the stock for the day
    low_price DECIMAL(10,2), -- Lowest price of the stock for the day
    volume BIGINT, -- Trading volume of the stock
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Record creation date
);

EXEC sp_addextendedproperty 'MS_Description', 'Unique identifier for the data', 'SCHEMA', 'dbo', 'TABLE', 'stock_data', 'COLUMN', 'data_id';
EXEC sp_addextendedproperty 'MS_Description', 'Foreign key to the stocks table', 'SCHEMA', 'dbo', 'TABLE', 'stock_data', 'COLUMN', 'stock_id';
EXEC sp_addextendedproperty 'MS_Description', 'Quote date', 'SCHEMA', 'dbo', 'TABLE', 'stock_data', 'COLUMN', 'date';
EXEC sp_addextendedproperty 'MS_Description', 'Opening price of the stock', 'SCHEMA', 'dbo', 'TABLE', 'stock_data', 'COLUMN', 'open_price';
EXEC sp_addextendedproperty 'MS_Description', 'Closing price of the stock', 'SCHEMA', 'dbo', 'TABLE', 'stock_data', 'COLUMN', 'close_price';
EXEC sp_addextendedproperty 'MS_Description', 'Highest price of the stock for the day', 'SCHEMA', 'dbo', 'TABLE', 'stock_data', 'COLUMN', 'high_price';
EXEC sp_addextendedproperty 'MS_Description', 'Lowest price of the stock for the day', 'SCHEMA', 'dbo', 'TABLE', 'stock_data', 'COLUMN', 'low_price';
EXEC sp_addextendedproperty 'MS_Description', 'Trading volume of the stock', 'SCHEMA', 'dbo', 'TABLE', 'stock_data', 'COLUMN', 'volume';
EXEC sp_addextendedproperty 'MS_Description', 'Record creation date', 'SCHEMA', 'dbo', 'TABLE', 'stock_data', 'COLUMN', 'created_at';

-- Table: User Selections
CREATE TABLE user_selections (
    selection_id INT IDENTITY(1,1) PRIMARY KEY, -- Unique identifier for the selection
    user_id INT, -- Foreign key to the users table
    stock_id INT, -- Foreign key to the stocks table
    selected_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Selection date and time
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Record creation date
);

EXEC sp_addextendedproperty 'MS_Description', 'Unique identifier for the selection', 'SCHEMA', 'dbo', 'TABLE', 'user_selections', 'COLUMN', 'selection_id';
EXEC sp_addextendedproperty 'MS_Description', 'Foreign key to the users table', 'SCHEMA', 'dbo', 'TABLE', 'user_selections', 'COLUMN', 'user_id';
EXEC sp_addextendedproperty 'MS_Description', 'Foreign key to the stocks table', 'SCHEMA', 'dbo', 'TABLE', 'user_selections', 'COLUMN', 'stock_id';
EXEC sp_addextendedproperty 'MS_Description', 'Selection date and time', 'SCHEMA', 'dbo', 'TABLE', 'user_selections', 'COLUMN', 'selected_at';
EXEC sp_addextendedproperty 'MS_Description', 'Record creation date', 'SCHEMA', 'dbo', 'TABLE', 'user_selections', 'COLUMN', 'created_at';

-- Table: Users
CREATE TABLE users (
    user_id INT IDENTITY(1,1) PRIMARY KEY, -- Unique identifier for the user
    username VARCHAR(100) NOT NULL, -- Username
    email VARCHAR(100) NOT NULL, -- User email
    access_key VARCHAR(100) NOT NULL, -- Access key
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Record creation date
);

EXEC sp_addextendedproperty 'MS_Description', 'Unique identifier for the user', 'SCHEMA', 'dbo', 'TABLE', 'users', 'COLUMN', 'user_id';
EXEC sp_addextendedproperty 'MS_Description', 'Username', 'SCHEMA', 'dbo', 'TABLE', 'users', 'COLUMN', 'username';
EXEC sp_addextendedproperty 'MS_Description', 'User email', 'SCHEMA', 'dbo', 'TABLE', 'users', 'COLUMN', 'email';
EXEC sp_addextendedproperty 'MS_Description', 'Access key', 'SCHEMA', 'dbo', 'TABLE', 'users', 'COLUMN', 'access_key';
EXEC sp_addextendedproperty 'MS_Description', 'Record creation date', 'SCHEMA', 'dbo', 'TABLE', 'users', 'COLUMN', 'created_at';

-- Stock Performance Table (stock_performance)
CREATE TABLE stock_performance (
    performance_id INT IDENTITY(1,1) PRIMARY KEY, -- Unique identifier for performance
    stock_id INT, -- Relationship with the stocks table
    date DATE NOT NULL, -- Date of performance analysis
    percent_change DECIMAL(5,2), -- Percentage change of the asset
    moving_avg DECIMAL(10,2), -- Calculated moving average
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Date of record creation
);

EXEC sp_addextendedproperty 'MS_Description', 'Unique identifier for performance', 'SCHEMA', 'dbo', 'TABLE', 'stock_performance', 'COLUMN', 'performance_id';
EXEC sp_addextendedproperty 'MS_Description', 'Relationship with the stocks table', 'SCHEMA', 'dbo', 'TABLE', 'stock_performance', 'COLUMN', 'stock_id';
EXEC sp_addextendedproperty 'MS_Description', 'Date of performance analysis', 'SCHEMA', 'dbo', 'TABLE', 'stock_performance', 'COLUMN', 'date';
EXEC sp_addextendedproperty 'MS_Description', 'Percentage change of the asset', 'SCHEMA', 'dbo', 'TABLE', 'stock_performance', 'COLUMN', 'percent_change';
EXEC sp_addextendedproperty 'MS_Description', 'Calculated moving average', 'SCHEMA', 'dbo', 'TABLE', 'stock_performance', 'COLUMN', 'moving_avg';
EXEC sp_addextendedproperty 'MS_Description', 'Date of record creation', 'SCHEMA', 'dbo', 'TABLE', 'stock_performance', 'COLUMN', 'created_at';

-- Watchlists Table (watchlists)
CREATE TABLE watchlists (
    watchlist_id INT IDENTITY(1,1) PRIMARY KEY, -- Unique identifier for the list
    user_id INT, -- Relationship with the users table
    name VARCHAR(100) NOT NULL, -- Name of the watchlist
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Date of record creation
);

EXEC sp_addextendedproperty 'MS_Description', 'Unique identifier for the list', 'SCHEMA', 'dbo', 'TABLE', 'watchlists', 'COLUMN', 'watchlist_id';
EXEC sp_addextendedproperty 'MS_Description', 'Relationship with the users table', 'SCHEMA', 'dbo', 'TABLE', 'watchlists', 'COLUMN', 'user_id';
EXEC sp_addextendedproperty 'MS_Description', 'Name of the watchlist', 'SCHEMA', 'dbo', 'TABLE', 'watchlists', 'COLUMN', 'name';
EXEC sp_addextendedproperty 'MS_Description', 'Date of record creation', 'SCHEMA', 'dbo', 'TABLE', 'watchlists', 'COLUMN', 'created_at';

-- User Activity Logs Table (user_activity_logs)
CREATE TABLE user_activity_logs (
    log_id INT IDENTITY(1,1) PRIMARY KEY, -- Unique identifier for the log
    user_id INT, -- Relationship with the users table
    action VARCHAR(100) NOT NULL, -- Description of the action performed
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Date and time of the action
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Date of record creation
);

EXEC sp_addextendedproperty 'MS_Description', 'Unique identifier for the log', 'SCHEMA', 'dbo', 'TABLE', 'user_activity_logs', 'COLUMN', 'log_id';
EXEC sp_addextendedproperty 'MS_Description', 'Relationship with the users table', 'SCHEMA', 'dbo', 'TABLE', 'user_activity_logs', 'COLUMN', 'user_id';
EXEC sp_addextendedproperty 'MS_Description', 'Description of the action performed', 'SCHEMA', 'dbo', 'TABLE', 'user_activity_logs', 'COLUMN', 'action';
EXEC sp_addextendedproperty 'MS_Description', 'Date and time of the action', 'SCHEMA', 'dbo', 'TABLE', 'user_activity_logs', 'COLUMN', 'timestamp';
EXEC sp_addextendedproperty 'MS_Description', 'Date of record creation', 'SCHEMA', 'dbo', 'TABLE', 'user_activity_logs', 'COLUMN', 'created_at';