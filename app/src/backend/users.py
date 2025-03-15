import requests
import os
from dotenv import load_dotenv

load_dotenv()

API_URL = os.getenv('API_URL')

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


def create_user(username, email, access_key):
    """
    Function to create a user using the API.
    """

    url = f"{API_URL}/users"

    payload = {
        "username": username,
        "email": email,
        "access_key": access_key
    }
    try:
        response = requests.post(url, json=payload)
        if response.status_code == 200:
            return response.json()
        else:
            return {"error": response.json().get("message", "Unknown error occurred.")}
    except Exception as e:
        return {"error": str(e)}