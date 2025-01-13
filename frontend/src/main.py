import streamlit as st

if 'page' not in st.session_state:
    st.session_state.page = "Stocks Dashboard"

st.sidebar.title("Navigation")
st.sidebar.radio("Choose a page", ["Stocks Dashboard"], key="nav")

gear_button = st.sidebar.button("⚙️ Go to Users Info")

if st.session_state.page == "Stocks Dashboard":
    st.title("Stocks Dashboard")
    st.write("Welcome to the Stocks Dashboard!")
    st.line_chart([1, 3, 2, 4, 6, 8, 5, 7]) 
    
    if gear_button:
        st.session_state.page = "Users Info"
        st.rerun()

if st.session_state.page == "Users Info":
    st.title("Users Info")
    st.write("Here is the Users Info page!")
    st.text_input("Enter User's Name:")
    st.text_area("Enter User's Details:")

    back_button = st.button("Back to Stocks Dashboard")
    if back_button:
        st.session_state.page = "Stocks Dashboard"
        st.rerun()