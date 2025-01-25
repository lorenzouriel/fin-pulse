import streamlit as st
import pandas as pd
import matplotlib.pyplot as plt
from datetime import datetime, timedelta
from sklearn.linear_model import LinearRegression
import numpy as np
from backend.stocks import get_stocks, get_stock_data
from backend.users import get_user_by_email

# Set Streamlit Page Config
st.set_page_config(page_title="Login & Stock Dashboard", layout="wide")

# Function to validate credentials
def validate_credentials(email, password):
    user = get_user_by_email(email)
    if user and user.get("access_key") == password:
        return user
    return None

# Authentication Logic
if "user_logged_in" not in st.session_state:
    st.session_state["user_logged_in"] = False
    st.session_state["user_details"] = None

# Login Page
if not st.session_state["user_logged_in"]:
    st.title("Login")

    # Collect user input
    email = st.text_input("Email")
    password = st.text_input("Password", type="password")

    # Show Login Confirmation button
    if st.button("Login Confirmation"):
        if email and password:
            # Validate credentials
            user = validate_credentials(email, password)
            if user:
                st.session_state["user_logged_in"] = True
                st.session_state["user_details"] = user
                st.success(f"Welcome, {user['username']}!")
            else:
                st.error("Username/password is incorrect")
        else:
            st.warning("Please enter both email and password.")
else:
    # Dashboard Page
    st.title("📈 Stock Dashboard")
    st.sidebar.header("Filters")

    # Logout Button
    if st.sidebar.button("Logout"):
        st.session_state["user_logged_in"] = False
        st.session_state["user_details"] = None
        st.success("You have been logged out.")
        st.experimental_rerun()

    # Fetch stocks data
    response = get_stocks()
    if "stocks" in response:
        stocks = response["stocks"]

        if stocks:
            # Dropdown to select stock
            stock_names = {stock["stock_id"]: f"{stock['ticker']} - {stock['name']}" for stock in stocks}
            selected_stock_id = st.sidebar.selectbox(
                "Select a Stock",
                options=stock_names.keys(),
                format_func=lambda x: stock_names[x]
            )

            # Date range with sensible defaults (past 1 year)
            default_end_date = datetime.today()
            default_start_date = default_end_date - timedelta(days=365)
            start_date = st.sidebar.date_input("Start Date", value=default_start_date)
            end_date = st.sidebar.date_input("End Date", value=default_end_date)

            # Data granularity (daily, weekly, monthly)
            granularity = st.sidebar.radio("Data Granularity", options=["Daily", "Weekly", "Monthly"])

            # Error handling for invalid date ranges
            if start_date > end_date:
                st.sidebar.error("Start date must be before end date.")
            else:
                # Fetch and process stock data
                stock_data = get_stock_data(selected_stock_id, start_date=start_date, end_date=end_date)

                if stock_data:
                    # Convert to DataFrame and handle granularity
                    df = pd.DataFrame(stock_data)
                    df["date"] = pd.to_datetime(df["date"])
                    df = df.sort_values(by="date")

                    # Aggregate for weekly or monthly views
                    if granularity == "Weekly":
                        df = df.resample("W-Mon", on="date").agg({
                            "open_price": "first",
                            "close_price": "last",
                            "high_price": "max",
                            "low_price": "min",
                            "volume": "sum"
                        }).reset_index()
                    elif granularity == "Monthly":
                        df = df.resample("M", on="date").agg({
                            "open_price": "first",
                            "close_price": "last",
                            "high_price": "max",
                            "low_price": "min",
                            "volume": "sum"
                        }).reset_index()

                    # Main panel: Line Chart
                    st.subheader(f"Stock Price Chart: {stock_names[selected_stock_id]}")
                    st.line_chart(df.set_index("date")[["open_price", "close_price"]])

                    # Advanced Chart: Moving Averages
                    st.subheader("Advanced Chart: Moving Averages")
                    df["SMA_50"] = df["close_price"].rolling(window=50).mean()
                    df["SMA_200"] = df["close_price"].rolling(window=200).mean()
                    fig, ax = plt.subplots(figsize=(12, 6))
                    ax.plot(df["date"], df["close_price"], label="Close Price", color="blue")
                    ax.plot(df["date"], df["SMA_50"], label="50-Day SMA", linestyle="--", color="orange")
                    ax.plot(df["date"], df["SMA_200"], label="200-Day SMA", linestyle="--", color="red")
                    ax.set_xlabel("Date")
                    ax.set_ylabel("Price (USD)")
                    ax.set_title(f"Stock Analysis: {stock_names[selected_stock_id]}")
                    ax.legend()
                    st.pyplot(fig)

                    # Data Table
                    st.subheader("Stock Data Table")
                    st.dataframe(df[["date", "open_price", "close_price", "high_price", "low_price", "volume"]])

                    # Predictions
                    st.subheader("Future Stock Trends")
                    df['days'] = (df['date'] - df['date'].min()).dt.days
                    X = df[['days']].values
                    y = df['close_price'].values

                    if len(df) > 1:  # Ensure enough data for prediction
                        # Linear Regression Model
                        model = LinearRegression()
                        model.fit(X, y)

                        # Predict future prices for the next 30 days
                        future_days = np.arange(df['days'].max() + 1, df['days'].max() + 31).reshape(-1, 1)
                        future_prices = model.predict(future_days)

                        # Plot Predictions
                        future_dates = [df['date'].max() + timedelta(days=i) for i in range(1, 31)]
                        fig, ax = plt.subplots(figsize=(12, 6))
                        ax.plot(df['date'], df['close_price'], label="Historical Prices", color="blue")
                        ax.plot(future_dates, future_prices, label="Predicted Prices", linestyle="--", color="green")
                        ax.set_xlabel("Date")
                        ax.set_ylabel("Price (USD)")
                        ax.set_title(f"Price Prediction: {stock_names[selected_stock_id]}")
                        ax.legend()
                        st.pyplot(fig)

                        # Display Prediction Summary
                        st.write("### Predicted Prices (Next 30 Days)")
                        prediction_df = pd.DataFrame({
                            "Date": future_dates,
                            "Predicted Close Price": future_prices
                        })
                        st.dataframe(prediction_df)
                    else:
                        st.warning("Not enough historical data for AI predictions.")
                else:
                    st.warning("No data available for the selected stock and date range.")
        else:
            st.error("No stocks available to display.")
    else:
        st.error("Invalid data returned from the stock API.")