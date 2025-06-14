CREATE TABLE expense_categories (
    category_id INT IDENTITY(1,1) PRIMARY KEY,        -- Category ID
    name VARCHAR(100) NOT NULL,                       -- Category name (e.g., Food, Transport)
    color VARCHAR(10) NULL,                           -- Optional color code for visualizations
    created_at DATETIME NOT NULL DEFAULT GETDATE()    -- Record creation timestamp
);