import requests
import json

API_URL = "http://localhost:8000"

def get_user_by_email(email):
    url = f"{API_URL}/users/{email}"

    response = requests.get(url)

    if response.status_code == 200:
        user = response.json()
        return user
    else:
        return {"message": "User not found"}

def create_selection(user_id, stock_id):
    url = f"{API_URL}/users/{user_id}/selections"

    data = {
        "stock_ids": stock_id
    }

    response = requests.post(url, json=data)

    if response.status_code == 201:
        selections = response.json()
        return selections
    else:
        return {"message": "Selection not created"}