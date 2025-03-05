from pydantic import BaseModel
from typing import List, Optional

class Stock(BaseModel):
    stock_id: Optional[int]  
    ticker: str
    name: str
    sector: str
    industry: str
    currency: str
    created_at: Optional[str]  

class StockCreate(BaseModel):
    ticker: str
    name: str
    sector: str
    industry: str
    currency: str
    
class StockListResponse(BaseModel):
    stocks: List[Stock]

class StockData(BaseModel):
    data_id: int
    stock_id: int
    date: str
    open_price: float
    close_price: float
    high_price: float
    low_price: float
    volume: int
    created_at: str