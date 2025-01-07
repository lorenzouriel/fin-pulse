-- Table: Stock Data
CREATE TABLE stock_data (
    id INT IDENTITY(1,1) PRIMARY KEY, -- Unique identifier for the data
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