-- Table: User Selections
CREATE TABLE user_selections (
    id INT IDENTITY(1,1) PRIMARY KEY, -- Unique identifier for the selection
    user_id INT, -- Foreign key to the users table
    stock_id INT, -- Foreign key to the stocks table
    selected_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Selection date and time
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Record creation date
);

EXEC sp_addextendedproperty 'MS_Description', 'Unique identifier for the selection', 'SCHEMA', 'dbo', 'TABLE', 'user_selections', 'COLUMN', 'selection_id';
EXEC sp_addextendedproperty 'MS_Description', 'Foreign key to the users table', 'SCHEMA', 'dbo', 'TABLE', 'user_selections', 'COLUMN', 'user_id';
EXEC sp_addextendedproperty 'MS_Description', 'Foreign key to the stocks table', 'SCHEMA', 'dbo', 'TABLE', 'user_selections', 'COLUMN', 'stock_id';
EXEC sp_addextendedproperty 'MS_Description', 'Selection date and time', 'SCHEMA', 'dbo', 'TABLE', 'user_selections', 'COLUMN', 'selected_at';
EXEC sp_addextendedproperty 'MS_Description', 'Record creation date', 'SCHEMA', 'dbo', 'TABLE', 'user_selections', 'COLUMN', 'created_at';