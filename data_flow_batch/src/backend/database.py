import mysql.connector
import os
from dotenv import load_dotenv
import yfinance as yf
from datetime import datetime

load_dotenv()

DB_SERVER = os.getenv('DB_SERVER')
DB_NAME = os.getenv('DB_NAME')
DB_USER = os.getenv('DB_USER')
DB_PASSWORD = os.getenv('DB_PASSWORD')

DB_CONFIG = {
    'user': DB_USER,
    'password': DB_PASSWORD,
    'host': DB_SERVER,
    'database': DB_NAME
}

def get_stocks():
    """
    Searches a list of stocks in the database.
    """
    try:
        conn = mysql.connector.connect(**DB_CONFIG)
        cursor = conn.cursor()
        cursor.execute('SELECT id, ticker, name, currency, created_at FROM stock.stocks;')
        stocks = cursor.fetchall()
        cursor.close()
        conn.close()
        return stocks
    except mysql.connector.Error as e:
        print(f"Error connecting or querying the database: {e}")
        return []

def post_stock_data(stock_id, ticker, period):
    """
    Fetches historical data for a given ticker using yfinance and inserts it into the stock.stock_data table.

    Args:
        ticker (str): The stock ticker symbol (e.g., "AAPL", "GOOG").
        period (str): The period for historical data (e.g., "5d", "1mo", "1y").
    """
    try:
        conn = mysql.connector.connect(**DB_CONFIG)
        cursor = conn.cursor()

        cursor.execute('SELECT id FROM stock.stocks WHERE ticker = %s;', (ticker,))

        stock = stock_id
        print(f"Fetching data for ticker: {ticker}, period: {period}")

        ticker_data = yf.Ticker(ticker)
        historical_data = ticker_data.history(period=period)

        if historical_data.empty:
            print(f"No historical data found for ticker: {ticker}")
            return

        for date, row in historical_data.iterrows():
            open_price = row['Open']
            close_price = row['Close']
            high_price = row['High']
            low_price = row['Low']
            volume = row['Volume']
            created_at = datetime.now()

            query = """
                INSERT INTO stock.stock_data (stock_id, `date`, open_price, close_price, high_price, low_price, volume, created_at)
                VALUES (%s, %s, %s, %s, %s, %s, %s, %s)
            """
            values = (
                stock, date.strftime('%Y-%m-%d'), open_price, close_price,
                high_price, low_price, volume, created_at
            )
            cursor.execute(query, values)
            print(f"Data inserted for {ticker} on {date.strftime('%Y-%m-%d')}")

        conn.commit()
        print(f"Data insertion completed for ticker: {ticker}")

        cursor.close()
        conn.close()

    except mysql.connector.Error as e:
        print(f"Database error: {e}")

    except Exception as e:
        print(f"An error occurred: {e}")