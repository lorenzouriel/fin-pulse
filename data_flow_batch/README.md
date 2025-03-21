# Documentação do ETL `stock`

## 1. Descrição

### Objetivo
Este projeto tem como objetivo automatizar o processo de busca de valores das ações em uma API externa e armazenar esses dados em um banco de dados, utilizando o Apache Airflow e a solução do Astro para orquestrar os jobs. O Airflow facilita a execução agendada de tarefas repetitivas, garantindo a coleta e o armazenamento de dados de forma eficiente e sem a necessidade de intervenções manuais.

- **Problema resolvido**: O projeto resolve a necessidade de automatizar a coleta e o armazenamento de dados financeiros de ações, economizando tempo e minimizando erros humanos.
- **Público-alvo**: Profissionais de dados, desenvolvedores, analistas financeiros e equipes de TI responsáveis pela automação e análise de dados financeiros.
- **Área relacionada**: Equipes de dados, automação, análise financeira e TI.

## 2. Tecnologias Utilizadas
O projeto utiliza as seguintes tecnologias:

| **Componente**  | **Tecnologia** | **Versão**|
|-----------------|----------------|-----------|
| Orquestração    | Astro          | 12.6.0    |
| Contêinerização | Docker         | latest    |

## 3. Instalação

### Passos para Instalação
1. Clone o repositório:
```sh
git clone https://github.com/lorenzouriel/fin-pulse.git
```

2. Navegue para o diretório do projeto:
```sh
cd fin-pulse/data-flow-batch
```

3. Adicione o `.env`
```sh
DB_SERVER=fin-pulse-db-1
DB_NAME=stock
DB_USER=stock_user
DB_PASSWORD=stock_password
```

4. Construa a solução com o Astro e rode
```sh
astro dev init
astro dev start
```

5. Acesse o Airflow: O Airflow estará disponível em `http://localhost:8080` para você monitorar e executar os DAGs.
    - Usuário: `admin`
    - Senha: `admin`

## 4. Arquitetura

### Estrutura
A estrutura do projeto foi organizada para garantir uma fácil compreensão e manutenção. Abaixo está a descrição das pastas e arquivos principais:

```bash
projeto/
├── dags/               # Definição dos DAGs (Jobs) do Airflow
├── include/            # Scripts e utilitários auxiliares
├── tests/              # Testes automatizados
├── Dockerfile          # Arquivo para criação da imagem Docker
```
- `dags/`: Contém os DAGs que definem os jobs do Airflow para a busca e o armazenamento dos dados financeiros.
- `include/`: Contém utilitários e funções auxiliares que ajudam nos jobs, como conexões com a API e com o banco de dados.
- `tests/`: Contém os testes automatizados para verificar a integridade e o correto funcionamento dos jobs.
- `Dockerfile`: Arquivo necessário para criar a imagem Docker que configura o ambiente do Airflow.

### Fluxo de Execução
O fluxo principal do sistema é o seguinte:

1. Airflow orquestra a execução periódica dos jobs de coleta de dados financeiros.
2. Cada job realiza uma requisição para a API de valores de ações.
3. Os dados coletados são processados e armazenados em um banco de dados MySQL.
4. A interface do Airflow permite monitorar a execução dos DAGs e verificar logs de execução.


<div style="text-align: center; font-size: 24px;">
  . . . 
</div>

# ETL `stock` documentation

## 1. Description

### Objective
This project aims to automate the process of searching for stock values ​​in an external API and storing this data in a database, using Apache Airflow and Astro's solution to orchestrate jobs. Airflow facilitates the scheduled execution of repetitive tasks, ensuring the collection and storage of data efficiently and without the need for manual interventions.

- **Problem solved**: The project solves the need to automate the collection and storage of financial stock data, saving time and minimizing human errors.
- **Target audience**: Data professionals, developers, financial analysts and IT teams responsible for the automation and analysis of financial data.
- **Related area**: Data, automation, financial analysis and IT teams.

## 2. Technologies Used
The project uses the following technologies:

| **Component** | **Technology** | **Version**| 
|-----------------|----------------|-----------|
| Orchestration | Astro | 12.6.0 |
| Containerization | Docker | latest |

## 3. Installation

### Installation Steps
1. Clone the repository:
```sh
git clone https://github.com/lorenzouriel/fin-pulse.git
```

2. Navigate to the project directory:
```sh
cd fin-pulse/data-flow-batch
```

3. Add the `.env`
```sh
DB_SERVER=fin-pulse-db-1
DB_NAME=stock
DB_USER=stock_user
DB_PASSWORD=stock_password
```

4. Build the solution with Astro and run
```sh
astro dev init
start of astro development
```

5. Access Airflow: Airflow will be available at `http://localhost:8080` for you to monitor and run DAGs.
- Username: `admin`
- Password: `admin`

## 4. Architecture

### Structure
The project structure was organized to ensure easy understanding and maintenance. Below is a description of the main folders and files:

```bash
project/
├── dags/ # Definition of Airflow DAGs (Jobs)
├── include/ # Auxiliary scripts and utilities
├── tests/ # Automated tests
├── Dockerfile # File for creating the Docker image
```
- `dags/`: Contains the DAGs that define Airflow jobs for searching and storing financial data.
- `include/`: Contains auxiliary utilities and functions that help with jobs, such as connections to the API and the database.
- `tests/`: Contains automated tests to verify the integrity and correct functioning of the jobs. - `Dockerfile`: File required to create the Docker image that configures the Airflow environment.

### Execution Flow
The main flow of the system is as follows:

1. Airflow orchestrates the periodic execution of financial data collection jobs.
2. Each job makes a request to the stock values ​​API.
3. The collected data is processed and stored in a MySQL database.
4. The Airflow interface allows you to monitor the execution of DAGs and check execution logs.