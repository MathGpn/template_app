import streamlit as st
from dotenv import load_dotenv
import os
from PIL import Image
import getpass
from scripts.app_functions import *

load_dotenv()

# Image for cosmetic of the page
img = Image.open('assets/ballerz.png')
st.set_page_config(layout="wide",page_title='MathGpn App',page_icon=img)

st.header("Mon application conteneurisée et poussée sur Azure")

st.sidebar.warning("Authentification")
# st.success(os.getlogin())
#st.success(getpass.getuser())
#pwd.getpwuid(os.getuid())[0]
#print("Voici votre identifiant :", os.getlogin())

image = Image.open('assets/f1_peak.jpg')
st.image(image, caption='Elles sont belles ces F1')