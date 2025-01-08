CREATE TABLE user_selections (
    id INT AUTO_INCREMENT PRIMARY KEY, -- Unique identifier for the selection
    user_id INT, -- Foreign key to the users table
    stock_id INT, -- Foreign key to the stocks table
    selected_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Selection date and time
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Record creation date
    FOREIGN KEY (user_id) REFERENCES users(id), -- FK for user_id
    FOREIGN KEY (stock_id) REFERENCES stocks(id) -- FK for stock_id
);