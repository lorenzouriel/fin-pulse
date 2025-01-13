import requests

API_URL = "http://localhost:8000"

def get_stocks():
    response = requests.get(f"{API_URL}/stocks")
    try:
        data = response.json()  
        if "stocks" in data and isinstance(data["stocks"], list):
            return data["stocks"]  
        else:
            return []
    except Exception as e:
        return []

def get_stock_data(stock_id, start_date=None, end_date=None):
    url = f"{API_URL}/stocks/{stock_id}/data"
    params = {}
    if start_date:
        params['start_date'] = start_date
    if end_date:
        params['end_date'] = end_date
    response = requests.get(url, params=params)
    return response.json()
