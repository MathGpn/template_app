# Streamlit dockerized web app pushed on Azure and hosted on Github for CI/CD

Made with Python 3.10 on Windows 10

## Pre requisite :
- having the .env file ready with the credentials

## Launch the app locally :

```python
git clone repo
```

```python
docker build -f Dockerfile -t st_dock_az:latest . 
```

```python
docker run -p 8000:8000 st_dock_az:latest
```

The application can now be accessed at the following address : 
http://localhost:8000/

## The dockerfile
- building the image installing all the dependencies with their corresponding version (pip install -r requirements.txt)
- create the virtual environment (py -m venv my_venv)
- execute the main script on the dedicated port (python -m streamlit run app/main.py on port 8000)

## Azure 

- docker login registryML.azurecr.io  
- docker run -p 8000:8000 st_dock_az:latest

You can now see your container with the following command
- docker image ls
- docker container ls

Copy the ID and commit the container by typing
- docker container commit [Replace by container's ID, without the [] characters] st_dock_az:latest

You can then tag the container with the following format : docker image tag [Container_Name:version] 
- docker image tag st_dock_az:latest registryML.azurecr.io/st_dock_az:latest

Once tagged you can finally push your container to the registry
- docker push registryML.azurecr.io/st_dock_az:latest

And finally it must be converted as an Azure Web app with the following command with AZURE CLI installed !

- az webapp config appsettings set --resource-group rg-appML --name st_dock_az --settings WEBSITES_PORT=8000

Or simply create a new Web App manually for the resource group (testMLstud) containing the registry.
- Conteneur docker
- Linux East US
- Source d'image : Azure Registry
- Sélectionner l'image, la balise (et la commande à lancer)

Lien de l'app : f1appmath.azurewebsites.net

## CI/CD

A Github Action has been made in order to keep the application maintained when we push new modifications on the Web App.

## Overview

App très simpliste (pas de modèles, notebooks ni de datas) made by :

<img src="assets/ballerz.png" alt="logo" hight="300" width="300"/>
