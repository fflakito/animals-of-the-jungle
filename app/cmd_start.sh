#!/bin/sh

# https://pythonspeed.com/articles/gunicorn-in-docker/
gunicorn -w 4 --log-file=- --worker-tmp-dir /dev/shm -b 0.0.0.0:8000 app:app 
