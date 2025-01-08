CREATE TABLE stock_performance (
    id INT AUTO_INCREMENT PRIMARY KEY, -- Unique identifier for performance
    stock_id INT, -- Relationship with the stocks table
    date DATE NOT NULL, -- Date of performance analysis
    percent_change DECIMAL(5,2), -- Percentage change of the asset
    moving_avg DECIMAL(10,2), -- Calculated moving average
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Date of record creation
    FOREIGN KEY (stock_id) REFERENCES stocks(id) -- FK for stock_id
);