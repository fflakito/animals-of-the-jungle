# animals-of-the-jungle

A very simple app that classifies images of animals into one of 6 different classes:
- Model trained with FastAI and Resnet 18 (~40 images for each class)
- Packaged into a Docker image (Carful ! 4.4 GB)
- Served with Gunicorn
- NB: FastAI handles images of any size

Could be improved:
- Add logging