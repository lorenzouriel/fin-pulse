import mysql.connector
from mysql.connector import Error
from typing import List
from models.stocks import Stock, StockCreate, StockData
from typing import Optional
from datetime import date
import os
from dotenv import load_dotenv

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

def get_db_connection():
    try:
        connection = mysql.connector.connect(**DB_CONFIG)
        if connection.is_connected():
            print("MySQL connection established.")
        return connection
    except Error as e:
        print(f"MySQL connection error: {e}")
        return None

def fetch_stocks_from_db() -> List[Stock]:
    """Fetch all stock records from the database and return a list of Stock objects"""
    connection = None
    stocks = []
    try:
        connection = get_db_connection()
        cursor = connection.cursor(dictionary=True)
        cursor.execute("SELECT id, ticker, name, sector, industry, currency, created_at FROM stock.stocks")
        rows = cursor.fetchall()
        
        for row in rows:
            created_at_str = row["created_at"].strftime("%Y-%m-%d %H:%M:%S") if row["created_at"] else None

            stocks.append(Stock(
                stock_id=row["id"],
                ticker=row["ticker"],
                name=row["name"],
                sector=row["sector"],
                industry=row["industry"],
                currency=row["currency"],
                created_at=created_at_str  
            ))
        cursor.close()
    except Error as e:
        print(f"MySQL connection error: {e}")
    finally:
        if connection:
            connection.close()
    return stocks

def insert_stock_to_db(stock: StockCreate) -> Stock:
    """Insert a new action record into the database and return the object with the generated ID"""
    connection = None
    try:
        connection = get_db_connection()
        if not connection:
            raise Exception("Unable to establish a connection to the database.")
        
        cursor = connection.cursor()
        insert_query = """
            INSERT INTO stock.stocks (ticker, name, sector, industry, currency)
            VALUES (%s, %s, %s, %s, %s)
        """
        cursor.execute(insert_query, (stock.ticker, stock.name, stock.sector, stock.industry, stock.currency))
        connection.commit()
        stock_id = cursor.lastrowid

        cursor.execute(
            "SELECT id, ticker, name, sector, industry, currency, created_at FROM stock.stocks WHERE id = %s", 
            (stock_id,)
        )
        row = cursor.fetchone()  
        if row:
            created_at_str = row[6].strftime("%Y-%m-%d %H:%M:%S") if row[6] else None 
            
            return Stock(
                stock_id=row[0],  
                ticker=row[1],   
                name=row[2],      
                sector=row[3],    
                industry=row[4],  
                currency=row[5],  
                created_at=created_at_str
            )
    except Error as e:
        print(f"Error when entering data: {e}")
        raise Exception("Error creating action record.")
    finally:
        if connection:
            connection.close()

def fetch_stock_by_id(stock_id: int) -> Stock:
    """Fetches a stock record by its ID"""
    connection = None
    stock = None
    try:
        connection = get_db_connection()
        if not connection:
            raise Exception("Unable to establish a connection to the database.")
        
        cursor = connection.cursor(dictionary=True)
        query = """
            SELECT id, ticker, name, sector, industry, currency, created_at
            FROM stock.stocks WHERE id = %s
        """
        cursor.execute(query, (stock_id,))
        row = cursor.fetchone()  # Fetch one record by stock_id
        
        if row:
            created_at_str = row["created_at"].strftime("%Y-%m-%d %H:%M:%S") if row["created_at"] else None
            stock = Stock(
                stock_id=row["id"],
                ticker=row["ticker"],
                name=row["name"],
                sector=row["sector"],
                industry=row["industry"],
                currency=row["currency"],
                created_at=created_at_str
            )
        cursor.close()
    except Error as e:
        print(f"Error when searching for stock: {e}")
    finally:
        if connection:
            connection.close()
    return stock

def fetch_stock_data_by_id(stock_id: int, start_date: Optional[str] = None, end_date: Optional[str] = None) -> List[StockData]:
    """Fetches stock data for a specific stock within an optional date range"""
    connection = None
    stock_data = []
    try:
        connection = get_db_connection()
                
        cursor = connection.cursor(dictionary=True)
        query = """
            SELECT id as data_id, stock_id, date, open_price, close_price, high_price, low_price, volume, created_at
            FROM stock.stock_data WHERE stock_id = %s
        """
        
        if start_date and end_date:
            query += " AND date BETWEEN %s AND %s"
            cursor.execute(query, (stock_id, start_date, end_date))
        else:
            cursor.execute(query, (stock_id,))
        
        rows = cursor.fetchall()
        
        for row in rows:
            date_str = row["date"].strftime('%Y-%m-%d') if isinstance(row["date"], date) else row["date"]
            created_at_str = row["created_at"].strftime("%Y-%m-%d %H:%M:%S") if row["created_at"] else None
            stock_data.append(StockData(
                data_id=row["data_id"],
                stock_id=row["stock_id"],
                date=date_str, 
                open_price=row["open_price"],
                close_price=row["close_price"],
                high_price=row["high_price"],
                low_price=row["low_price"],
                volume=row["volume"],
                created_at=created_at_str
            ))
        cursor.close()
    except Error as e:
        print(f"Error when searching for stock: {e}")
    finally:
        if connection:
            connection.close()
    return stock_data