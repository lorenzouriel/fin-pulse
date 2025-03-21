# Endpoints API `stock`

Este documento lista os endpoints disponíveis para a API de gerenciamento de estoque.

## Pontos finais
### 1. **`GET /stocks`**
- **Descrição**: Recupera uma lista de todas as ações.
- **Resposta**: Retorna uma matriz JSON de ações.

#### Exemplo:
```json
[
  {
    "stock_id": 1,
    "ticker": "AAPL",
    "name": "Apple Inc.",
    "sector": "Tecnologia",
    "industry": "Eletrônicos de consumo",
    "currency": "USD",
    "created_at": "2024-01-01T00:00:00Z"
  },
  {
    "stock_id": 2,
    "ticker": "MSFT",
    "name": "Microsoft Corp.",
    "sector": "Tecnologia",
    "industry": "Software - Infraestrutura",
    "currency": "USD",
    "created_at": "2024-01-01T00:00:00Z"
  }
]
```

### 2. `POST /stocks`
- **Descrição:** Cria um novo registro de ações.
- **Corpo:**
Requer um objeto JSON com os seguintes campos:
  - **ticker** (string): Código do ativo (por exemplo, AAPL, TSLA)
  - **name** (string): Nome completo da empresa
  - **sector** (string): Setor da empresa
  - **industry** (string): Setor da empresa
  - **currency** (string): Moeda de negociação

#### Resposta:
Retorna o registro de ações criado com seu `stock_id`.

#### Exemplo de solicitação:
```json
{
  "ticker": "AAPL",
  "name": "Apple Inc.",
  "sector": "Tecnologia",
  "industry": "Eletrônicos de consumo",
  "currency": "USD"
}
```

#### Exemplo de resposta:
```json
{
  "stock_id": 2,
  "ticker": "TSLA",
  "name": "Tesla Inc.",
  "sector": "Automotive",
  "industry": "Veículos elétricos",
  "currency": "USD",
  "created_at": "2024-01-02T00:00:00Z"
}
```

### 3. `GET /stocks/{id}`
- **Descrição:** Recupera detalhes de uma ação específica por `stock_id`.
- **Parâmetros:**
  - **id** (inteiro): O `stock_id` exclusivo da ação.

#### Resposta:
Retorna os detalhes da ação.

#### Exemplo:
```json
{
  "stock_id": 1,
  "ticker": "AAPL",
  "name": "Apple Inc.",
  "sector": "Technology",
  "industry": "Consumer Electronics",
  "currency": "USD",
  "created_at": "2024-01-01T00:00:00Z"
}
```

### 4. `GET /stocks/{id}/data`
- **Descrição:** Recupera dados de ações para uma ação específica (`stock_id`) dentro de um intervalo de datas opcional.
- **Parâmetros:**
  - **id** (inteiro): O `stock_id` exclusivo da ação.
  - **start_date** (string, opcional): O início do intervalo de datas no formato `AAAA-MM-DD`.
  - **end_date** (string, opcional): O fim do intervalo de datas no formato `AAAA-MM-DD`.

#### Resposta:
Retorna uma matriz de dados de ações para a ação especificada. Se um intervalo de datas for fornecido, apenas os dados dentro desse intervalo serão retornados.

**Solicitação:**
- `GET /stocks/1/data?start_date=2024-01-01&end_date=2024-01-31`

**Resposta:**
```json
[
  {
    "data_id": 1,
    "stock_id": 1,
    "date": "2024-01-01",
    "open_price": 150.25,
    "close_price": 155.30,
    "high_price": 157.00,
    "low_price": 148.80,
    "volume": 1200000,
    "created_at": "2024-01-01T00:00:00Z"
  },
  {
    "data_id": 2,
    "stock_id": 1,
    "date": "2024-01-02",
    "open_price": 155.50,
    "close_price": 158.00,
    "high_price": 160.00,
    "low_price": 154.00,
    "volume": 1100000,
    "created_at": "2024-01-02T00:00:00Z"
  }
]
```

### 5. `POST /users`
- **Description:** Cria um novo usuário.

- **Body:**
Requer um objeto JSON com os seguintes campos:
  - **username** (string): Nome de usuário
  - **email** (string): E-mail do usuário
  - **access_key** (string): Chave de acesso

#### Resposta:
Retorna o registro de usuário criado com seu `user_id`.

#### Exemplo de solicitação:
```json
{
  "username": "Michael Burry",
  "email": "michael.burry@example.com",
  "access_key": "ef819ce1-2005-4e2d-b95e-8dd41bd215db"
}
```

#### Exemplo de resposta:
```json
{
  "user_id": 1,
  "username": "Michael Burry",
  "email": "michael.burry@example.com",
  "access_key": "ef819ce1-2005-4e2d-b95e-8dd41bd215db",
  "created_at": "2024-01-01T00:00:00Z"
}
```

### 6. `GET /users/{email}`
- **Descrição:** Recupera detalhes de um usuário específico por `email`.
- **Parâmetros:**
  - **email** (string): O `email` exclusivo do usuário.

#### Resposta:
Retorna os detalhes do usuário.

#### Exemplo:
```json
{
  "user_id": 1,
  "username": "Michael Burry",
  "email": "michael.burry@example.com",
  "access_key": "ef819ce1-2005-4e2d-b95e-8dd41bd215db",
  "created_at": "2024-01-01T00:00:00Z"
}
```

### 7. `POST /users/{id}/selections`
- **Descrição:** Permite que um usuário selecione uma ou mais ações.

- **Parâmetros:**
  - **id** (inteiro): O `user_id` exclusivo do usuário.

- **Corpo:**
Requer um objeto JSON com os seguintes campos:
  - **stock_ids** (matriz de inteiros): Uma lista de valores `stock_id` representando as ações selecionadas.

#### Resposta:
Retorna uma matriz de registros de seleção de usuário criados.

#### Exemplo de solicitação:
```json
{
  "stock_ids": [1, 2, 3]
}
```

**Exemplo de resposta:**
```json
[
  {
    "selection_id": 1,
    "user_id": 1,
    "stock_id": 1,
    "stock_name": "AAPL",
    "selected_at": "2024-01-01T00:00:00Z",
    "created_at": "2024-01-01T00:00:00Z"
  },
  {
    "selection_id": 2,
    "user_id": 1,
    "stock_id": 2,
    "stock_name": "MSFT",
    "selected_at": "2024-01-01T00:01:00Z",
    "created_at": "2024-01-01T00:01:00Z"
  },
  {
    "selection_id": 3,
    "user_id": 1,
    "stock_id": 3,
    "stock_name": "GOOGL",
    "selected_at": "2024-01-01T00:02:00Z",
    "created_at": "2024-01-01T00:02:00Z"
  }
]
```

<div style="text-align: center; font-size: 24px;">
  . . . 
</div>

# Endpoints API `stock`

This document lists the available endpoints for the Stock Management API.

## Endpoints
### 1. **`GET /stocks`**
- **Description**: Retrieves a list of all stocks.
- **Response**: Returns a JSON array of stocks.

#### Example:
```json
[ 
    {    
        "stock_id": 1,    
        "ticker": "AAPL",    
        "name": "Apple Inc.",    
        "sector": "Technology",    
        "industry": "Consumer Electronics",    
        "currency": "USD",    
        "created_at": "2024-01-01T00:00:00Z" 
    },
    {
        "stock_id": 2,    
        "ticker": "MSFT",    
        "name": "Microsoft Corp.",    
        "sector": "Technology",    
        "industry": "Software - Infrastructure",    
        "currency": "USD",    
        "created_at": "2024-01-01T00:00:00Z" 
    }
]
```

### 2. `POST /stocks`
- **Description:** Creates a new stock record.
- **Body:**
Requires a JSON object with the following fields:
    - **ticker** (string): Asset code (e.g., AAPL, TSLA)
    - **name** (string): Full company name
    - **sector** (string): Company sector
    - **industry** (string): Company industry
    - **currency** (string): Trading currency

#### Response:
Returns the created stock record with its `stock_id`.

#### Example Request:
```json
{
  "ticker": "AAPL",
  "name": "Apple Inc.",
  "sector": "Technology",
  "industry": "Consumer Electronics",
  "currency": "USD"
}
```

#### Example Response:
```json
{
  "stock_id": 2,
  "ticker": "TSLA",
  "name": "Tesla Inc.",
  "sector": "Automotive",
  "industry": "Electric Vehicles",
  "currency": "USD",
  "created_at": "2024-01-02T00:00:00Z"
}
```

### 3. `GET /stocks/{id}`
- **Description:** Retrieves details of a specific stock by `stock_id`.
- **Parameters:**
    - **id** (integer): The unique `stock_id` of the stock.

#### Response:
Returns the stock details.

#### Example:
```json
{
  "stock_id": 1,
  "ticker": "AAPL",
  "name": "Apple Inc.",
  "sector": "Technology",
  "industry": "Consumer Electronics",
  "currency": "USD",
  "created_at": "2024-01-01T00:00:00Z"
}
```

### 4. `GET /stocks/{id}/data`
- **Description:** Retrieves stock data for a specific stock (`stock_id`) within an optional date range.
- **Parameters:**
    - **id** (integer): The unique `stock_id` of the stock.
    - **start_date** (string, optional): The start of the date range in `YYYY-MM-DD` format.
    - **end_date** (string, optional): The end of the date range in `YYYY-MM-DD` format.

#### Response:
Returns an array of stock data for the specified stock. If a date range is provided, only data within that range is returned.

**Request:**  
- `GET /stocks/1/data?start_date=2024-01-01&end_date=2024-01-31`

**Response:**
```json
[
  {
    "data_id": 1,
    "stock_id": 1,
    "date": "2024-01-01",
    "open_price": 150.25,
    "close_price": 155.30,
    "high_price": 157.00,
    "low_price": 148.80,
    "volume": 1200000,
    "created_at": "2024-01-01T00:00:00Z"
  },
  {
    "data_id": 2,
    "stock_id": 1,
    "date": "2024-01-02",
    "open_price": 155.50,
    "close_price": 158.00,
    "high_price": 160.00,
    "low_price": 154.00,
    "volume": 1100000,
    "created_at": "2024-01-02T00:00:00Z"
  }
]
```

### 5. `POST /users`
- **Description:** Creates a new user.

- **Body:**  
Requires a JSON object with the following fields:
    - **username** (string): Username
    - **email** (string): User email
    - **access_key** (string): Access key

#### Response:
Returns the created user record with its `user_id`.

#### Example Request:
```json
{
  "username": "Michael Burry",
  "email": "michael.burry@example.com",
  "access_key": "ef819ce1-2005-4e2d-b95e-8dd41bd215db"
}
```

#### Example Response:
```json
{
  "user_id": 1,
  "username": "Michael Burry",
  "email": "michael.burry@example.com",
  "access_key": "ef819ce1-2005-4e2d-b95e-8dd41bd215db",
  "created_at": "2024-01-01T00:00:00Z"
}
```

### 6. `GET /users/{email}`
- **Description:** Retrieves details of a specific user by `email`.
- **Parameters:**
    - **email** (string): The unique `email` of the user.

#### Response:
Returns the user details.

#### Example:
```json
{
  "user_id": 1,
  "username": "Michael Burry",
  "email": "michael.burry@example.com",
  "access_key": "ef819ce1-2005-4e2d-b95e-8dd41bd215db",
  "created_at": "2024-01-01T00:00:00Z"
}
```

### 7. `POST /users/{id}/selections`
- **Description:** Allows a user to select one or more stocks.

- **Parameters:**
    - **id** (integer): The unique `user_id` of the user.

- **Body:**  
Requires a JSON object with the following fields:
    - **stock_ids** (array of integers): A list of `stock_id` values representing the selected stocks.

#### Response:
Returns an array of created user selection records.

#### Example Request:
```json
{
  "stock_ids": [1, 2, 3]
}
```

**Example Response:**
```json
[
  {
    "selection_id": 1,
    "user_id": 1,
    "stock_id": 1,
    "stock_name": "AAPL",
    "selected_at": "2024-01-01T00:00:00Z",
    "created_at": "2024-01-01T00:00:00Z"
  },
  {
    "selection_id": 2,
    "user_id": 1,
    "stock_id": 2,
    "stock_name": "MSFT",
    "selected_at": "2024-01-01T00:01:00Z",
    "created_at": "2024-01-01T00:01:00Z"
  },
  {
    "selection_id": 3,
    "user_id": 1,
    "stock_id": 3,
    "stock_name": "GOOGL",
    "selected_at": "2024-01-01T00:02:00Z",
    "created_at": "2024-01-01T00:02:00Z"
  }
]
```