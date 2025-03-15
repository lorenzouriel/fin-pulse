CREATE TABLE stocks (
    id INT AUTO_INCREMENT PRIMARY KEY, -- Unique identifier for the stock
    ticker VARCHAR(10) NOT NULL, -- Asset code (e.g., AAPL, TSLA)
    name VARCHAR(100) NOT NULL, -- Full company name
    sector VARCHAR(100), -- Company sector (e.g., Technology)
    industry VARCHAR(100), -- Company industry (e.g., Semiconductors)
    currency VARCHAR(10), -- Trading currency (e.g., USD)
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Record creation date
);