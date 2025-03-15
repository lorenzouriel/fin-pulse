from pydantic import BaseModel
from typing import List, Optional
from datetime import datetime

class User(BaseModel):
    username: str
    email: str
    access_key: str

class UserResponse(BaseModel):
    user_id: int
    username: str
    email: str
    access_key: str
    created_at: datetime

class UserSelectionRequest(BaseModel):
    stock_ids: List[int]

class UserSelectionResponse(BaseModel):
    selection_id: int
    user_id: int
    stock_id: int
    stock_name: str
    selected_at: datetime
    created_at: datetime