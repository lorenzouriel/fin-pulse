# Documentação do Database `stock`

## 1. Descrição

### Objetivo
O projeto **Database** tem como objetivo fornecer uma estrutura organizada para armazenamento de dados de **stocks (ações)**, incluindo backups, documentação e definição das tabelas do banco de dados.

entraliza e organiza os valores e informações de ações. 

O projeto foi criado para equipes de análise financeira, investidores e sistemas de gestão de portfólio.

## 2. Tecnologias Utilizadas
O projeto utiliza as seguintes tecnologias:

| Componente     | Tecnologia | Versão  |
|----------------|------------|---------|
| Banco de Dados | MySQL      | 8.0     |
| Contêinerização| Docker     | Latest  |

## 3. Instalação

### Passos para Instalação

1. Clone o repositório:
```sh
git clone https://github.com/lorenzouriel/fin-pulse.git
```

2. Navegue para o diretório do projeto:
```sh
cd fin-pulse/database
```

3. Execute o banco de dados utilizando Docker:
```sh
docker-compose up -d
```

4. Para acessar o banco de dados, utilize:
```sh
mysql -h 127.0.0.1 -P 3306 -u stock_user -p
```

Informe a senha `stock_password` quando solicitado.

5. Para restaurar um backup manualmente, utilize:
```sh
docker exec -i container_mysql mysql -u stock_user -pstock_password stock < database/backup/data.sql
```
- O comando `docker-compose up -d` já realiza essa restauração do backup.

## 4. Arquitetura

### Estrutura
O projeto está organizado da seguinte forma:
```sh
fin-pulse/
├── database/
│   ├── backup/          # Arquivos de backup do banco de dados
│   │   └── data.sql     # Dump inicial do banco
│   ├── docs/            # Documentação ERD
│   ├── tables/          # Query das tabelas e documentação complementar
├── docker-compose.yaml  # Arquivo de configuração do Docker
├── README.md            # Documentação principal
```

### Fluxo de Execução

1. O **Docker Compose** inicia um contêiner MySQL com as credenciais e estrutura definidas no `docker-compose.yaml`.
2. Caso um arquivo `data.sql` esteja presente, ele é carregado automaticamente na inicialização.
3. O banco fica acessível na porta `3306` do host, permitindo conexões externas.
4. Backups podem ser armazenados e restaurados utilizando a pasta `backup/`.
5. O banco armazena informações sobre ações, incluindo histórico de preços, volume de negociações e dados financeiros relevantes.

<div style="text-align: center; font-size: 24px;">
  . . . 
</div>


# Database `stock` documentation

## 1. Description

### Objective
The **Database** project aims to provide an organized structure for storing **stock** data, including backups, documentation, and definition of database tables.

It internalizes and organizes stock values ​​and information.

The project was created for financial analysis teams, investors, and portfolio management systems.

## 2. Technologies Used

The project uses the following technologies:

| Component        | Technology | Version |
|------------------|------------|---------|
| Database         | MySQL      | 8.0     |
| Containerization | Docker     | Latest  |

## 3. Installation

### Installation Steps

1. Clone the repository:
```sh
git clone https://github.com/lorenzouriel/fin-pulse.git
```

2. Navigate to the project directory:
```sh
cd fin-pulse/database
```

3. Run the database using Docker:
```sh
docker-compose up -d
```

4. To access the database, use:
```sh
mysql -h 127.0.0.1 -P 3306 -u stock_user -p
```

Enter the password `stock_password` when prompted.

5. To restore a backup manually, use:
```sh
docker exec -i container_mysql mysql -u stock_user -pstock_password stock < database/backup/data.sql
```

## 4. Architecture

### Structure
The project is organized as follows:

```sh
fin-pulse/
├── database/
│ ├── backup/           # Database backup files
│ │ └── data.sql        # Initial database dump
│ ├── docs/             # ERD documentation
│ ├── tables/           # Table queries and additional documentation
├── docker-compose.yaml # Docker configuration file
├── README.md           # Main documentation
```

### Execution Flow

1. **Docker Compose** starts a MySQL container with the credentials and structure defined in `docker-compose.yaml`.
2. If a `data.sql` file is present, it is automatically loaded at startup.
3. The bank is accessible on port `3306` on the host, allowing external connections.
4. Backups can be stored and restored using the `backup/` folder.
5. The bank stores information about stocks, including price history, trading volume and relevant financial data.
