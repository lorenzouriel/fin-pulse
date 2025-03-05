CREATE TABLE user_activity_logs (
    id INT AUTO_INCREMENT PRIMARY KEY, -- Unique identifier for the log
    user_id INT, -- Relationship with the users table
    action VARCHAR(100) NOT NULL, -- Description of the action performed
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Date and time of the action
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Date of record creation
    FOREIGN KEY (user_id) REFERENCES users(id) -- FK for user_id
);