from airflow.decorators import task, dag
from include import load_stock_daily, load_stock_historical
from datetime import datetime

@dag(dag_id="stocks-daily",
     description="Pipeline to run historical and daily stock data loading tasks",
     start_date=datetime(2025,1,10),
     schedule="* * * * *",
     catchup=False)
def stocks_data():

    @task(task_id='load_stock_historical')
    def task_load_stock_historical():
        return load_stock_historical()
    
    @task(task_id='load_stock_daily')
    def task_load_stock_daily():
        load_stock_daily()
    
    t1 = task_load_stock_historical()
    t2 = task_load_stock_daily()

    t1 >> t2

stocks_data()