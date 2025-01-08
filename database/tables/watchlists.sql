CREATE TABLE watchlists (
    id INT AUTO_INCREMENT PRIMARY KEY, -- Unique identifier for the list
    user_id INT, -- Relationship with the users table
    name VARCHAR(100) NOT NULL, -- Name of the watchlist
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Date of record creation
    FOREIGN KEY (user_id) REFERENCES users(id) -- FK for user_id
);