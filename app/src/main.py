import streamlit as st
from login import login_page
from dashboard import stock_dashboard
from create_account import create_user_page

st.set_page_config(page_title="Login & Stock Dashboard", layout="wide")

if "user_logged_in" not in st.session_state:
    st.session_state["user_logged_in"] = False
    st.session_state["user_details"] = None

if not st.session_state["user_logged_in"]:
    if "show_create_user" in st.session_state and st.session_state["show_create_user"]:
        create_user_page() 
    else:
        login_page()  
else:
    stock_dashboard()
