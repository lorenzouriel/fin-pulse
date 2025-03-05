import mysql.connector
from mysql.connector import Error
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