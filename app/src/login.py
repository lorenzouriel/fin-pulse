import streamlit as st
from backend.users import get_user_by_email
from create_account import create_user_page

def validate_credentials(email, password):
    """
    Validate user credentials by checking email and access_key.
    """
    user = get_user_by_email(email)
    if user and user.get("access_key") == password:
        return user
    return None

def login_page():
    """
    Renders the login page.
    """
    st.title("Login")

    email = st.text_input("Email")
    password = st.text_input("Password", type="password")

    if st.button("Login Confirmation"):
        if email and password:
            user = validate_credentials(email, password)
            if user:
                st.session_state["user_logged_in"] = True
                st.session_state["user_details"] = user
                st.success(f"Welcome, {user['username']}!")
            else:
                st.error("Username/password is incorrect.")
        else:
            st.warning("Please enter both email and password.")

    if st.button("Create Account"):
        st.session_state["show_create_user"] = True