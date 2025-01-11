import mysql.connector
from mysql.connector import Error
from db.db_connection import get_db_connection
from typing import List
from models.users import UserResponse, UserSelectionResponse
from datetime import datetime
    
def create_user_in_db(username: str, email: str, access_key: str, created_at: datetime):
    connection = None
    try:
        connection = get_db_connection()
        cursor = connection.cursor()

        query = """
            INSERT INTO stock.users (username, email, access_key, created_at)
            VALUES (%s, %s, %s, %s)
        """
        cursor.execute(query, (username, email, access_key, created_at))
        connection.commit()

        return cursor.lastrowid 
    except mysql.connector.Error as e:
        raise Exception(f"Error creating user: {e}")
    finally:
        if connection:
            connection.close()

def fetch_user_by_id(user_id: int):
    connection = None
    try:
        connection = get_db_connection()
        cursor = connection.cursor(dictionary=True)

        query = """
            SELECT id, username, email, access_key, created_at
            FROM stock.users
            WHERE id = %s
        """
        cursor.execute(query, (user_id,))
        row = cursor.fetchone()

        if row:
            return {
                "user_id": row["id"],
                "username": row["username"],
                "email": row["email"],
                "access_key": row["access_key"],
                "created_at": row["created_at"].isoformat() if row["created_at"] else None
            }
        return None 

    except mysql.connector.Error as e:
        raise Exception(f"Error fetching user: {e}")
    finally:
        if connection:
            connection.close()

def create_user_selections(user_id: int, stock_ids: List[int]) -> List[UserSelectionResponse]:
    connection = None
    cursor = None
    try:
        connection = get_db_connection()
        cursor = connection.cursor()

        selections = []
        selected_at = datetime.utcnow()

        for stock_id in stock_ids:
            query = """
                INSERT INTO stock.user_selections (user_id, stock_id, selected_at, created_at)
                VALUES (%s, %s, %s, %s)
            """
            cursor.execute(query, (user_id, stock_id, selected_at, selected_at))
            connection.commit()

            selection_id = cursor.lastrowid

            cursor.execute("SELECT name FROM stock.stocks WHERE id = %s", (stock_id,))
            stock_row = cursor.fetchone()

            if stock_row:
                selections.append(UserSelectionResponse(
                    selection_id=selection_id,
                    user_id=user_id,
                    stock_id=stock_id,
                    stock_name=stock_row[0],  
                    selected_at=selected_at,
                    created_at=selected_at
                ))
            else:
                raise Exception(f"Stock with ID {stock_id} not found")

        return selections

    except mysql.connector.Error as e:
        raise Exception(f"Database error: {e}")
    finally:
        if cursor:
            cursor.close()
        if connection:
            connection.close()