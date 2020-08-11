from flask import Flask
# from fastai import *
# from fastai.vision import *


app = Flask(__name__)

# https://docs.fast.ai/basic_train.html#Learner.load
# learn = load_learner(path, 'trained_model.pkl')

@app.route('/')
def hello_world():
    return 'Hello, World!'

# @app.route('/predict', methods=['POST'])
# def predict_animal():
#     # img = XXX
#     # pred = learn.predict(img)
#     return 'Hello, World! <3'