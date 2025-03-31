from flask import Flask
from datetime import datetime

app = Flask(__name__)

@app.route('/')
def display_time():
    time = datetime.now().strftime("%b %d, %Y, %H:%M")
    return time 
