import yfinance as yf
import os
from datetime import datetime, timedelta
from dotenv import load_dotenv
from backend.database import get_stocks, post_stock_data

# Load .env file
load_dotenv()

def load_stock_historical():
    """
    Fetches historical stock data for all the stocks in the database and inserts it into the stock.stock_data table.
    Only loads historical data if created_at is within the last 24 hours.
    """
    # Get the list of stocks from the database
    stocks = get_stocks()

    for stock in stocks:
        stock_id, ticker, name, currency, created_at = stock
        print(f"Checking data for {ticker} ({name})...")

        # If created_at is already a datetime object, no need to convert
        if isinstance(created_at, str):
            created_at_datetime = datetime.strptime(created_at, '%Y-%m-%d %H:%M:%S')
        else:
            created_at_datetime = created_at  # it's already a datetime object

        # Get the current time
        current_time = datetime.now()

        # Check if created_at is within the last 24 hours
        if current_time - created_at_datetime <= timedelta(days=1):
            print(f"Loading historical data for {ticker} ({name})...")
            post_stock_data(stock_id, ticker, period="1y")
        else:
            print(f"Skipping historical data for {ticker} ({name}) as created_at is older than 24 hours.")

    print("Historical stock data loading process completed.")

if __name__ == "__main__":
    load_stock_historical()
