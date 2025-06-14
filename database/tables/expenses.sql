CREATE TABLE expenses (
    expense_id INT IDENTITY(1,1) PRIMARY KEY,        -- Unique expense ID
    user_id INT NOT NULL,                             -- Who made the expense
    category_id INT NOT NULL,                         -- Expense category
    payment_method VARCHAR(30) NOT NULL,              -- Payment method used
    amount DECIMAL(10,2) NOT NULL,                    -- Expense amount
    currency VARCHAR(10) NOT NULL,                     -- Currency of the transaction (e.g., USD, BRL)
    description VARCHAR(255) NULL,                     -- Optional description
    expense_date DATE NOT NULL,                         -- Date the expense occurred
    created_at DATETIME NOT NULL DEFAULT GETDATE(),   -- Record creation timestamp

    CONSTRAINT FK_expenses_users FOREIGN KEY (user_id) REFERENCES users(user_id),
    CONSTRAINT FK_expenses_expense_categories FOREIGN KEY (category_id) REFERENCES expense_categories(category_id)
);