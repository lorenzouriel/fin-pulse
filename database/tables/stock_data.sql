CREATE TABLE stock_data (
    id INT AUTO_INCREMENT PRIMARY KEY, -- Unique identifier for the data
    stock_id INT, -- Foreign key to the stocks table
    date DATE NOT NULL, -- Quote date
    open_price DECIMAL(10,2), -- Opening price of the stock
    close_price DECIMAL(10,2), -- Closing price of the stock
    high_price DECIMAL(10,2), -- Highest price of the stock for the day
    low_price DECIMAL(10,2), -- Lowest price of the stock for the day
    volume BIGINT, -- Trading volume of the stock
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Record creation date
    FOREIGN KEY (stock_id) REFERENCES stocks(id) -- FK for stock_id
);