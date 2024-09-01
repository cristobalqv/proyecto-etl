#version de python con la que levantamos el proyecto
FROM python:3.11.2

#establecemos ruta del proyecto en el contenedor
WORKDIR /app

RUN python -m venv /app/venv

# Copiar el archivo requirements.txt al contenedor
COPY requirements.txt /app/requirements.txt

# Activar el entorno virtual e instalar las dependencias
RUN /app/venv/bin/pip install --no-cache-dir -r /app/requirements.txt

COPY . /app

# Añadir /app al PYTHONPATH
ENV PYTHONPATH=/app
ENV VIRTUAL_ENV=/app/venv

#este comando mantiene en espera al contenedor que se vaya a crear, 
#esperando una instrucción de ejecución desde un objeto pythonoperator en el dag 
CMD ["tail", "-f", "/dev/null"]

