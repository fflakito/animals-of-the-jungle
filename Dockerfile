FROM python:3.7-slim-stretch

COPY requirements.txt .
ENV FLASK_APP=app.py

RUN apt-get update && apt-get install -y git python3-dev gcc \
    && rm -rf /var/lib/apt/lists/* && pip install --upgrade pip && pip install --no-cache-dir --upgrade -r requirements.txt

COPY app app/

RUN python app/server.py

EXPOSE 5042

# CMD ["python", "app/server.py", "serve"]
CMD ["python", "-m", "flask", "run"]