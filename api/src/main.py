from fastapi import FastAPI, HTTPException
from models.stocks import StockCreate, Stock, StockListResponse, StockData
from db.stocks import fetch_stocks_from_db, insert_stock_to_db, fetch_stock_by_id, fetch_stock_data_by_id
from typing import List, Optional

app = FastAPI()

@app.get("/stocks", response_model=StockListResponse)
async def get_stocks():
    try:
        stocks = fetch_stocks_from_db()
        if not stocks:
            raise HTTPException(status_code=404, detail="Actions not found.")
        return StockListResponse(stocks=stocks)
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Internal server error: {e}")
    
@app.get("/stocks/{id}", response_model=Stock)
async def get_stock(id: int):
    stock = fetch_stock_by_id(id)
    if stock:
        return stock
    else:
        raise HTTPException(status_code=404, detail="Stock not found")

@app.post("/stocks", response_model=Stock)
async def create_stock(stock: StockCreate):
    try:
        new_stock = insert_stock_to_db(stock)
        return new_stock
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Error creating action record: {e}")

@app.get("/stocks/{id}/data", response_model=List[StockData])
async def get_stock_data(id: int, start_date: Optional[str] = None, end_date: Optional[str] = None):
    stock_data = fetch_stock_data_by_id(id, start_date, end_date)
    if stock_data:
        return stock_data
    else:
        raise HTTPException(status_code=404, detail="Stock data not found")