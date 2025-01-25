import streamlit as st
import requests

# API Base URL
API_BASE_URL = "http://localhost:8000"

def login_user(email, access_key):
    """Function to verify user login using the GET /users/{email} endpoint."""
    try:
        response = requests.get(f"{API_BASE_URL}/users/{email}")
        if response.status_code == 200:
            user_data = response.json()
            if user_data['access_key'] == access_key:
                return True, user_data
            else:
                return False, "Invalid access key."
        elif response.status_code == 404:
            return False, "User not found."
        else:
            return False, "An error occurred during login."
    except requests.exceptions.RequestException as e:
        return False, f"Request error: {e}"

# Streamlit Interface
st.title("Login Page")
st.write("Please enter your credentials to log in.")

# User Input Fields
email = st.text_input("Email", placeholder="Enter your email")
access_key = st.text_input("Access Key", placeholder="Enter your access key", type="password")

# Login Button
if st.button("Log In"):
    if email and access_key:
        is_successful, response = login_user(email, access_key)
        if is_successful:
            st.success(f"Welcome, {response['username']}!")
            st.write("User Details:")
            st.json(response)
        else:
            st.error(response)
    else:
        st.warning("Please fill in all the fields.")
