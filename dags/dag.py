from datetime import datetime, timedelta
from airflow import DAG
from airflow.operators.python_operator import PythonOperator
import subprocess

def ejecutar_etl():
    subprocess.run(["/app/venv/bin/python", "/shared/script/main_script.py"], check=True)

default_args = {'owner': 'cristobalqv',
                'retries': 5,
                'retry_delay': timedelta(minutes=3)}

with DAG(default_args=default_args,
         dag_id='etl_meterorologia',
         description='DAG para realizar proceso ETL. extracción desde API, transformación y carga a AWS',
         start_date=datetime(2024,8,27),
         schedule_interval='@hourly',
         catchup=False) as dag:
    
     task_ETL_DAG = PythonOperator(
        task_id='ejecutar_etl',
        python_callable=ejecutar_etl)
     
    

