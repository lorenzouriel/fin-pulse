import streamlit as st
from backend.users import get_user_by_email

st.title("Login")

def validate_credentials(email, password):
    user = get_user_by_email(email)
    if user and user.get("access_key") == password:
        return user
    return None

# Collect user input
email = st.text_input("Email")
password = st.text_input("Password", type="password")

# Show Login Confirmation button
if st.button("Login Confirmation"):
    if email and password:
        # Validate credentials
        user = validate_credentials(email, password)
        if user:
            st.success(f"Welcome, {user['username']}!")
            st.write("User Details:")
            st.json(user)
        else:
            st.error("Username/password is incorrect")
    else:
        st.warning("Please enter both email and password.")

# Optional: Logout functionality
if "user_logged_in" in st.session_state and st.session_state["user_logged_in"]:
    if st.button("Logout"):
        st.session_state["user_logged_in"] = False
        st.success("You have been logged out.")