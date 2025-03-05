import streamlit as st
import pandas as pd
import matplotlib.pyplot as plt
from datetime import datetime, timedelta
from sklearn.linear_model import LinearRegression
import numpy as np
from backend.stocks import get_stocks, get_stock_data

def stock_dashboard():
    st.title("📈 Stock Dashboard")
    st.sidebar.header("Filters")

    if st.sidebar.button("Logout"):
        st.session_state["user_logged_in"] = False
        st.session_state["user_details"] = None
        st.success("You have been logged out.")

    response = get_stocks()
    if "stocks" in response:
        stocks = response["stocks"]

        if stocks:
            stock_names = {stock["stock_id"]: f"{stock['ticker']} - {stock['name']}" for stock in stocks}
            selected_stock_id = st.sidebar.selectbox(
                "Select a Stock",
                options=stock_names.keys(),
                format_func=lambda x: stock_names[x]
            )

            default_end_date = datetime.today()
            default_start_date = default_end_date - timedelta(days=30)
            start_date = st.sidebar.date_input("Start Date", value=default_start_date)
            end_date = st.sidebar.date_input("End Date", value=default_end_date)
            granularity = st.sidebar.radio("Data Granularity", options=["Daily", "Weekly", "Monthly"])

            if start_date > end_date:
                st.sidebar.error("Start date must be before end date.")
            else:
                stock_data = get_stock_data(selected_stock_id, start_date=start_date, end_date=end_date)

                if stock_data:
                    df = pd.DataFrame(stock_data)
                    df["date"] = pd.to_datetime(df["date"])
                    df = df.sort_values(by="date")

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

                    st.subheader(f"Stock Price Chart: {stock_names[selected_stock_id]}")
                    st.line_chart(df.set_index("date")[["open_price", "close_price"]])

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

                    st.subheader("Stock Data Table")
                    st.dataframe(df[["date", "open_price", "close_price", "high_price", "low_price", "volume"]])

                    st.subheader("Future Stock Trends")
                    df['days'] = (df['date'] - df['date'].min()).dt.days
                    X = df[['days']].values
                    y = df['close_price'].values

                    if len(df) > 1:
                        model = LinearRegression()
                        model.fit(X, y)

                        future_days = np.arange(df['days'].max() + 1, df['days'].max() + 31).reshape(-1, 1)
                        future_prices = model.predict(future_days)

                        future_dates = [df['date'].max() + timedelta(days=i) for i in range(1, 31)]
                        fig, ax = plt.subplots(figsize=(12, 6))
                        ax.plot(df['date'], df['close_price'], label="Historical Prices", color="blue")
                        ax.plot(future_dates, future_prices, label="Predicted Prices", linestyle="--", color="green")
                        ax.set_xlabel("Date")
                        ax.set_ylabel("Price (USD)")
                        ax.set_title(f"Price Prediction: {stock_names[selected_stock_id]}")
                        ax.legend()
                        st.pyplot(fig)

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