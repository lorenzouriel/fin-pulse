import requests

API_URL = "http://localhost:8000"

def get_user_by_email(email):
    url = f"{API_URL}/users/{email}"

    try:
        response = requests.get(url)
        if response.status_code == 200:
            return response.json()
        else:
            return {"message": "User not found"}
    except requests.exceptions.RequestException as e:
        return {"message": f"Error connecting to the API: {e}"}


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