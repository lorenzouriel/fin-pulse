-- Table: Stocks
CREATE TABLE stocks (
    id INT IDENTITY(1,1) PRIMARY KEY, -- Unique identifier for the stock
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