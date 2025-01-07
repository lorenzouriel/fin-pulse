-- Stock Performance Table (stock_performance)
CREATE TABLE stock_performance (
    id INT IDENTITY(1,1) PRIMARY KEY, -- Unique identifier for performance
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