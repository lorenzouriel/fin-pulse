# Documentação da Aplicação `stock`

## 1. Descrição

### Objetivo
A aplicação permite que os usuários consultem e acompanhem ações financeiras por meio de uma interface interativa com Streamlit, integrando com a API de gerenciamento de ações para exibir dados sobre as ações em tempo real.

Esta aplicação resolve o problema da visualização e interação com dados financeiros de ações de uma forma simples e intuitiva.

Desenvolvido para investidores e analistas financeiros que desejam consultar dados de ações de forma simples e intuitiva.


## 2. Tecnologias Utilizadas
O projeto utiliza as seguintes tecnologias:

| **Componente**      | **Tecnologia**  | **Versão**|
|---------------------|-----------------|-----------|
| FrontEnd            | Streamlit       | 1.41.1    |
| Linguagem           | Python          | 3.12      |
| Requisições HTTP    | Requests        | 2.32.3    |
| Tratamento de Dados | Pandas          | 2.2.3     |
| Previsões           | Scikit Learn    | 1.6.1     |
| Gráficos e Painéis  | Matplotlib      | 3.10.0    |
| Contêinerização     | Docker          | latest    |


## 3. Instalação

### Passos para Instalação
1. Clone o repositório:
```sh
git clone https://github.com/lorenzouriel/fin-pulse.git
```

2. Navegue para o diretório do projeto:
```sh
cd fin-pulse/api
```

3. Crie o ambiente virtual:
```sh
pip install -r requirements.txt
```

4. Instale as dependências:
```sh
pip install -r requirements.txt
```

5. Configure o arquivo de variáveis de ambiente:
```sh
API_URL=http://localhost:8000
```

6. Execute o projeto:
```sh
streamlit run src/main.py
```
- A aplicação estará disponível no seu navegador em `http://localhost:8501`.

Ou, para rodar via Docker (recomendado):
```sh
docker build -t app .
docker run -p 8501:8501 app
```

## 4. Arquitetura

### Estrutura
O projeto está organizado da seguinte forma:
```sh
app/
├── src/                  
│   ├── backend/          # Lógica de comunicação com a API
│   ├── create_account.py # Tela de criação de conta
│   ├── dashboard.py      # Tela principal do dashboard
│   ├── login.py          # Tela de Login
│   └── main.py           # Entrypoint
├── Dockerfile            # Arquivo para containerizar a aplicação
├── README.md             # Documentação do projeto
└── requirements.txt      # Arquivo de dependências do projeto
```

### Fluxo de Execução
1. Quando você executa o Docker, a aplicação e o backend começam a rodar.
2. O usuário acessa a aplicação e interage com as diferentes telas.
3. O frontend (Streamlit) faz requisições à API para login, criação de conta e visualização de dados.
4. A API processa as requisições, acessa o banco de dados, e retorna os dados ou mensagens de erro.
5. O Streamlit exibe os dados no dashboard conforme necessário.
6. O usuário pode encerrar a sessão e retornar ao login.


<div style="text-align: center; font-size: 24px;">
  . . . 
</div>


# `stock` Application Documentation

## 1. Description

### Objective
The application allows users to consult and track financial stocks through an interactive interface with Streamlit, integrating with the stock management API to display real-time stock data.

This application solves the problem of viewing and interacting with stock financial data in a simple and intuitive way.

Developed for investors and financial analysts who want to consult stock data in a simple and intuitive way.

## 2. Technologies Used
The project uses the following technologies:

| **Component**         | **Technology** | **Version**|
|-----------------------|----------------|------------|
| FrontEnd              | Streamlit      | 1.41.1     |
| Language              | Python         | 3.12       |
| HTTP Requests         | Requests       | 2.32.3     |
| Data Handling         | Pandas         | 2.2.3      |
| Forecasts             | Scikit Learn   | 1.6.1      |
| Charts and Dashboards | Matplotlib     | 3.10.0     |
| Containerization      | Docker         | latest     |

## 3. Installation

### Installation Steps
1. Clone the repository:
```sh
git clone https://github.com/lorenzouriel/fin-pulse.git
```

2. Navigate to the project directory:
```sh
cd fin-pulse/api
```

3. Create the virtual environment:
```sh
pip install -r requirements.txt
```

4. Install the dependencies:
```sh
pip install -r requirements.txt
```

5. Configure the environment variables file:
```sh
API_URL=http://localhost:8000
```

6. Run the project:
```sh
streamlit run src/main.py
```
- The application will be available in your browser at `http://localhost:8501`.

Or, to run via Docker (recommended):
```sh
docker build -t app .
docker run -p 8501:8501 app
```

## 4. Architecture

### Structure
The project is organized as follows:
```sh
frontend/
├── src/
│ ├── backend/           # Communication logic with the API
│ ├── create_account.py  # Account creation screen
│ ├── dashboard.py       # Dashboard main screen
│ ├── login.py           # Login screen
│ └── main.py            # Entrypoint
├── Dockerfile           # File to containerize the application
├── README.md            # Project documentation
└── requirements.txt     # Project dependencies file
```

### Execution Flow
1. When you run Docker, the application and the backend start running. 2. The user accesses the application and interacts with the different screens.
3. The frontend (Streamlit) makes requests to the API for login, account creation, and data viewing.
4. The API processes the requests, accesses the database, and returns the data or error messages.
5. Streamlit displays the data on the dashboard as needed.
6. The user can end the session and return to login.