# API Documentation

This document provides instructions on how to set up and run the FastAPI application locally or in a production environment.

## Prerequisites

Before running the FastAPI application, ensure you have the following installed:
- [Python 3.8+](https://www.python.org/)
- [pip](https://pip.pypa.io/en/stable/)
- [Virtualenv](https://virtualenv.pypa.io/en/stable/) (optional but recommended)
- [MySQL](https://hub.docker.com/_/mysql) 

## Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/lorenzouriel/project-python-stock-analysis.git
cd .\api\src\
```

### 2. Create a Virtual Environment (Optional)
Set up a virtual environment to manage dependencies:
```bash
python -m venv venv
source venv/bin/activate    # On Linux/MacOS
venv\Scripts\activate       # On Window
```

### 3. Install Dependencies
Install the required Python packages using pip:
```bash
pip install -r requirements.txt
```

### 4. Configure Environment Variables
Create a `.env` file in the root directory and add the necessary environment variables. Example:
```bash
DB_SERVER=
DB_NAME=
DB_USER=
DB_PASSWORD=
```

### 5. Start the FastAPI Application
```bash
uvicorn main:app --reload
```

---

> **Created by:** Lorenzo Uriel - 11/01/2025 16:53