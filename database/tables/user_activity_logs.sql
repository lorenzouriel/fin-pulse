-- User Activity Logs Table (user_activity_logs)
CREATE TABLE user_activity_logs (
    id INT IDENTITY(1,1) PRIMARY KEY, -- Unique identifier for the log
    user_id INT, -- Relationship with the users table
    action VARCHAR(100) NOT NULL, -- Description of the action performed
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Date and time of the action
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Date of record creation
);

EXEC sp_addextendedproperty 'MS_Description', 'Unique identifier for the log', 'SCHEMA', 'dbo', 'TABLE', 'user_activity_logs', 'COLUMN', 'log_id';
EXEC sp_addextendedproperty 'MS_Description', 'Relationship with the users table', 'SCHEMA', 'dbo', 'TABLE', 'user_activity_logs', 'COLUMN', 'user_id';
EXEC sp_addextendedproperty 'MS_Description', 'Description of the action performed', 'SCHEMA', 'dbo', 'TABLE', 'user_activity_logs', 'COLUMN', 'action';
EXEC sp_addextendedproperty 'MS_Description', 'Date and time of the action', 'SCHEMA', 'dbo', 'TABLE', 'user_activity_logs', 'COLUMN', 'timestamp';
EXEC sp_addextendedproperty 'MS_Description', 'Date of record creation', 'SCHEMA', 'dbo', 'TABLE', 'user_activity_logs', 'COLUMN', 'created_at';