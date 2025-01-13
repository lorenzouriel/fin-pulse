import streamlit as st
import pandas as pd
from src.backend.stocks import get_stocks, get_stock_data
from src.backend.users import get_user_by_email, create_selection

def main():
    st.title("Stock Management")

    stocks = get_stocks()
    if not stocks:
        st.write("No stocks available.")
        return

    stock_tickers = [stock['ticker'] for stock in stocks]
    
    st.sidebar.header("Select a Stock")
    selected_stock = st.sidebar.selectbox("Choose a stock:", stock_tickers)
    
    stock = next(stock for stock in stocks if stock['ticker'] == selected_stock)
    
    st.header(f"{stock['name']} ({stock['ticker']})")
    st.write(f"**Sector:** {stock['sector']}")
    st.write(f"**Industry:** {stock['industry']}")
    st.write(f"**Currency:** {stock['currency']}")
    
    st.sidebar.header("Select Date Range")
    start_date = st.sidebar.date_input("Start Date", value=pd.to_datetime("2024-01-01"))
    end_date = st.sidebar.date_input("End Date", value=pd.to_datetime("2024-01-31"))
    
    start_date_str = start_date.strftime('%Y-%m-%d')
    end_date_str = end_date.strftime('%Y-%m-%d')

    stock_data = get_stock_data(stock['stock_id'], start_date=start_date_str, end_date=end_date_str)

    if stock_data:
        st.write(f"Showing data for {selected_stock} from {start_date} to {end_date}")
        df = pd.DataFrame(stock_data)
        if 'date' in df.columns:
            df['date'] = pd.to_datetime(df['date'])
            st.dataframe(df[['date', 'open_price', 'close_price', 'high_price', 'low_price', 'volume']])
        else:
            st.write("Data does not contain 'date' column.")
    else:
        st.write("No data available for the selected date range.")

if __name__ == "__main__":
    main()