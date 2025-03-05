# Documentação do Database `stock`

## 1. Descrição

### Objetivo
O projeto **Database** tem como objetivo fornecer uma estrutura organizada para armazenamento de dados de **stocks (ações)**, incluindo backups, documentação e definição das tabelas do banco de dados.

- **Problema resolvido:** Centraliza e organiza os valores e informações de ações.
- **Público-alvo:** Equipes de análise financeira, investidores e sistemas de gestão de portfólio.
- **Área relacionada:** Setores financeiros, corretoras de valores e plataformas de investimentos.

## 2. Tecnologias Utilizadas

O projeto utiliza as seguintes tecnologias:

| Componente   | Tecnologia | Versão  |
|-------------|-----------|---------|
| Banco de Dados | MySQL      | 8.0     |
| Gerenciamento | Docker     | Latest  |

## 3. Instalação

### Passos para Instalação

1. Clone o repositório:
```sh
git clone https://github.com/lorenzouriel/project-python-stock-analysis.git
```

2. Navegue para o diretório do projeto:
```sh
cd project-python-stock-analysis
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

Se houver configurações extras necessárias, inclua aqui.

## 4. Arquitetura

### Estrutura
O projeto está organizado da seguinte forma:

```
project-python-stock-analysis/
├── database/
│   ├── backup/          # Arquivos de backup do banco de dados
│   │   └── data.sql     # Dump inicial do banco
│   ├── docs/            # Documentação do banco
│   ├── tables/          # Definição das tabelas de ações e histórico de valores
├── docker-compose.yaml  # Arquivo de configuração do Docker
├── README.md            # Documentação principal
```

### Fluxo de Execução

1. O **Docker Compose** inicia um contêiner MySQL com as credenciais e estrutura definidas no `docker-compose.yaml`.
2. Caso um arquivo `data.sql` esteja presente, ele é carregado automaticamente na inicialização.
3. O banco fica acessível na porta `3306` do host, permitindo conexões externas.
4. Backups podem ser armazenados e restaurados utilizando a pasta `backup/`.
5. O banco armazena informações sobre ações, incluindo histórico de preços, volume de negociações e dados financeiros relevantes.
