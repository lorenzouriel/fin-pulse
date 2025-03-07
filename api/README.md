# Documentação da API `stock`

## 1. Descrição

### Objetivo
A API foi desenvolvida para fornecer uma maneira eficiente de gerenciar informações de ações de empresas, como seus detalhes e dados financeiros. A API permite criar registros de ações, recuperar informações detalhadas sobre as ações existentes, acessar dados históricos de preços e volume, além de gerenciar as seleções de ações feitas por usuários.

Ela facilita o acesso a dados essenciais sobre as ações de uma empresa, como o preço de abertura e fechamento, volume de transações e variações de preços.

Desenvolvida para analistas financeiros que precisam coletar dados históricos e atuais para análise de mercado e desenvolvedores que desejam integrar essas funcionalidades de gerenciamento e consulta de ações em seus próprios sistemas financeiros.


## 2. Tecnologias Utilizadas
O projeto utiliza as seguintes tecnologias:

| Componente        | Tecnologia             | Versão           |
|-------------------|------------------------|------------------|
| Backend           | FastAPI + Uvicorn      | 0.115.6 + 0.34.0 |
| Banco de Dados    | MySQL                  | 8+               |
| Contêinerização   | Docker                 | latest           |
| Contrato de Dados | Pydantic               | 2.10.5           |
| ORM               | Mysql Connector        | 9.1.0            |

## 3. Instalação

### Passos para Instalação

1. Clone o repositório:
```sh
git clone https://github.com/lorenzouriel/fin-pulse.git
```

2. Navegue para o diretório do projeto:
```sh
cd fin-pulse/api/src
```

3. Crie o ambiente virtual:
```sh
python -m venv venv
source venv/bin/activate    # On Linux/MacOS
venv\Scripts\activate       # On Window
```

4. Instale as dependências:
```sh
pip install -r requirements.txt
```

5. Configure o arquivo de variáveis de ambiente:
```sh
DB_SERVER=database_db_1
DB_NAME=stock
DB_USER=stock_user
DB_PASSWORD=stock_password
```

6. Execute o projeto:
```sh
uvicorn src.main:app --reload
```

Ou, para rodar via Docker (recomendado):
```sh
docker build -t api .
docker run -p 8000:8000 api
```

## 4. Arquitetura

### Estrutura
O projeto está organizado da seguinte forma:
```sh
api/
├── mockoon/              # Projeto criado no Mockoon para simulação de API
├── src/                  # Código-fonte da API
│   ├── db/               # Conexões com o banco de dados e queries para os endpoints
│   ├── models/           # Criação dos contratos de dados com Pydantic
│   ├── Dockerfile        # Conteinerização API
│   ├── requirements.txt  # Dependências do projeto
│   ├── .env              # Variáveis de ambiente
│   ├── README.md         # Documentação dos endpoints
│   └── main.py           # Arquivo principal da aplicação FastAPI
└── README.md             # Documentação principal
```

### Fluxo de Execução
1. O FastAPI é iniciado no arquivo `src.main` utilizando o comando `uvicorn`, expondo a API no endpoint `localhost:8000`.
2. As conexões com o banco de dados e as queries são gerenciadas pela pasta `src/db/`, onde as interações com o banco são definidas.
3. Os contratos de dados são definidos utilizando Pydantic na pasta `src/models/`, onde os dados recebidos ou enviados pela API são validados.
4. O Mockoon é utilizado para simular ambientes de teste de API na pasta `mockoon/`.
5. O Dockerfile permite a execução da API em contêineres para facilitar o deploy.


<div style="text-align: center; font-size: 24px;">
  . . . 
</div>

# `stock` API documentation

## 1. Description

### Objective
The API is designed to provide an efficient way to manage company stock information, such as stock details and financial data. The API allows you to create stock records, retrieve detailed information about existing stocks, access historical price and volume data, and manage user stock selections.

It facilitates access to essential data about a company's stocks, such as opening and closing prices, trading volume, and price changes.

Designed for financial analysts who need to collect historical and current data for market analysis, and developers who want to integrate these stock management and query functionalities into their own financial systems.

## 2. Technologies Used
The project uses the following technologies:

| Component         | Technology        | Version          |
|-------------------|-------------------|------------------|
| Backend           | FastAPI + Uvicorn | 0.115.6 + 0.34.0 |
| Database          | MySQL             | 8+               |
| Containerization  | Docker            | latest           |
| Data Contract     | Pydantic          | 2.10.5           |
| ORM               | Mysql Connector   | 9.1.0            |

## 3. Installation

### Installation Steps

1. Clone the repository:
```sh
git clone https://github.com/lorenzouriel/fin-pulse.git
```

2. Navigate to the project directory:
```sh
cd fin-pulse/api/src
```

3. Create the virtual environment:
```sh
python -m venv venv
source venv/bin/activate # On Linux/MacOS
venv\Scripts\activate # On Window
```

4. Install the dependencies:
```sh
pip install -r requirements.txt
```

5. Set the environment variables file:
```sh
DB_SERVER=database_db_1
DB_NAME=stock
DB_USER=stock_user
DB_PASSWORD=stock_password
```

6. Run the command project:
```sh
uvicorn src.main:app --reload
```

Or, to run via Docker (recommended):
```sh
docker build -t api . docker run -p 8000:8000 api
```

## 4. Architecture

### Structure
The project is organized as follows:
```sh
api/
├── mockoon/            # Project created in Mockoon for API simulation
├── src/                # API source code
│   ├── db/               # Database connections and queries for endpoints
│   ├── models/           # Creation of data contracts with Pydantic
│   ├── Dockerfile        # Docker to run the API
│   ├── requirements.txt  # Project dependencies
│   ├── .env              # Environment variables
│   ├── README.md         # Endpoints documentation
│   └── main.py           # Main file of the FastAPI application
└── README.md           # Main documentation
```

### Execution Flow
1. FastAPI is started in the `src.main` file using the `uvicorn` command, exposing the API at the `localhost:8000` endpoint.
2. Database connections and queries are managed by the `src/db/` folder, where interactions with the database are defined.
3. Data contracts are defined using Pydantic in the `src/models/` folder, where data received or sent by the API is validated.
4. Mockoon is used to simulate API test environments in the `mockoon/` folder.
5. The Dockerfile allows the API to be executed in containers to facilitate deployment.