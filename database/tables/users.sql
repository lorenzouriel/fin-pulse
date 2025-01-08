CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY, -- Unique identifier for the user
    username VARCHAR(100) NOT NULL, -- Username
    email VARCHAR(100) NOT NULL, -- User email
    access_key VARCHAR(100) NOT NULL, -- Access key
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Record creation date
);