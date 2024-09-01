#version de python con la que levantamos el proyecto
FROM python:3.11.2

#establecemos ruta del proyecto en el contenedor
WORKDIR /app

# Copiar el archivo requirements.txt al contenedor
COPY requirements.txt /app/requirements.txt

# Activar el entorno virtual e instalar las dependencias
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Añadir /app al PYTHONPATH
# ENV PYTHONPATH=/app

