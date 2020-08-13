from flask import Flask, request
from fastai import *
from fastai.vision import *

app = Flask(__name__)
path_to_model = "/app"

# https://docs.fast.ai/basic_train.html#Learner.load
learn = load_learner(path_to_model, "weights-v02.pkl")
classes = learn.data.classes


@app.route("/")
def hello_world():
    return "Hello, World!"


@app.route("/api/predict", methods=["POST"])
def predict_animal():
    img_bytes = request.files["image"]
    img = open_image(img_bytes)
    pred_class, label, probs = learn.predict(img)
    winner = pred_class.obj
    res = list(zip(classes, probs.tolist()))
    return {"winner": winner, "res": res}
