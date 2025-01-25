import requests
from datetime import datetime

API_URL = "http://localhost:8000"

def get_stocks():
    try:
        response = requests.get(f"{API_URL}/stocks")
        data = response.json()
        return data  
    except Exception as e:
        return []

def get_stock_data(stock_id, start_date=None, end_date=None):
    params = {"start_date": start_date, "end_date": end_date} if start_date and end_date else {}
    try:
        response = requests.get(f"{API_URL}/stocks/{stock_id}/data", params=params)
        data = response.json()
        return data 
    except Exception as e:
        return []
