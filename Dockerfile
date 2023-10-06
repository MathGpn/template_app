FROM python:3.10-slim

WORKDIR /app

COPY . /app

# ENV VIRTUAL_ENV=/opt/venv
# RUN python3 -m venv $VIRTUAL_ENV
# ENV PATH="$VIRTUAL_ENV/bin:$PATH"

# Install dependencies:
RUN  pip install --upgrade pip
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

#COPY . .

EXPOSE 8000

CMD ["python", "-m", "streamlit", "run", "app/main.py"]
#CMD . /opt/venv/bin/activate && exec streamlit run app/main.py
# CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "80"]

# COPY /app ./st_dock_az 

# FROM qui vous permet de définir l'image source ;
# WORKDIR qui vous permet de définir votre répertoire de travail ;
# ADD qui vous permet d'ajouter des fichiers dans votre conteneur <=> COPY ;
# ENV qui vous permet de déclarer une variable d'environnement pour le conteneur ;
# RUN qui vous permet d’exécuter des commandes dans votre conteneur ;
# EXPOSE qui permet de définir les ports d'écoute par défaut ;
# CMD qui permet de définir la commande par défaut lors de l’exécution de vos conteneurs Docker.