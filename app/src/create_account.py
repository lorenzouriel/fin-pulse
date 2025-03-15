import streamlit as st
from backend.users import create_user
import login as login

def create_user_page():
    """
    Renders the create user page.
    """
    st.title("Create a New User")
    st.markdown("Fill out the form below to create a new user.")

    username = st.text_input("Username", placeholder="Enter your username")
    email = st.text_input("Email", placeholder="Enter your email address")
    access_key = st.text_input("Access Key", placeholder="Enter an access key", type="password")

    if st.button("Create User"):
        if username and email and access_key:
            with st.spinner("Creating user..."):
                result = create_user(username, email, access_key)
                
                if "error" in result:
                    st.error(f"Error: {result['error']}")
                else:
                    st.success("User created successfully!")
                    st.session_state["show_create_user"] = False
        else:
            st.warning("Please fill in all fields.")
