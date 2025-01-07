-- Table: Users
CREATE TABLE users (
    id INT IDENTITY(1,1) PRIMARY KEY, -- Unique identifier for the user
    username VARCHAR(100) NOT NULL, -- Username
    email VARCHAR(100) NOT NULL, -- User email
    access_key VARCHAR(100) NOT NULL, -- Access key
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Record creation date
);

EXEC sp_addextendedproperty 'MS_Description', 'Unique identifier for the user', 'SCHEMA', 'dbo', 'TABLE', 'users', 'COLUMN', 'user_id';
EXEC sp_addextendedproperty 'MS_Description', 'Username', 'SCHEMA', 'dbo', 'TABLE', 'users', 'COLUMN', 'username';
EXEC sp_addextendedproperty 'MS_Description', 'User email', 'SCHEMA', 'dbo', 'TABLE', 'users', 'COLUMN', 'email';
EXEC sp_addextendedproperty 'MS_Description', 'Access key', 'SCHEMA', 'dbo', 'TABLE', 'users', 'COLUMN', 'access_key';
EXEC sp_addextendedproperty 'MS_Description', 'Record creation date', 'SCHEMA', 'dbo', 'TABLE', 'users', 'COLUMN', 'created_at';