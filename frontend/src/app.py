import streamlit as st
import pandas as pd
import matplotlib.pyplot as plt
from datetime import datetime, timedelta
from backend.stocks import get_stocks, get_stock_data

# Title and Theme
st.set_page_config(page_title="Stock Dashboard", layout="wide")
st.title("📈 Stock Dashboard")

# Sidebar Filters
st.sidebar.header("Filters")
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

                # Insights and Statistics
                st.subheader("Key Insights")
                st.metric("Highest Price", f"${df['high_price'].max():,.2f}")
                st.metric("Lowest Price", f"${df['low_price'].min():,.2f}")
                st.metric("Total Volume", f"{df['volume'].sum():,.0f} shares")
            else:
                st.warning("No data available for the selected stock and date range.")
    else:
        st.error("No stocks available to display.")
else:
    st.error("Invalid data returned from the stock API.")
