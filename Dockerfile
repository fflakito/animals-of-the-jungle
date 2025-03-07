FROM ubuntu:20.04

LABEL maintainer="Guillaume Vrx"

ENV DEBIAN_FRONTEND=noninteractive
ENV PYTHON_VERSION=3.8

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    build-essential \
    cmake \
    curl \
    libjpeg-dev \
    zip \
    unzip \
    libpng-dev \
    python3 python3-pip python3-dev\
    libprotobuf-dev libleveldb-dev libsnappy-dev libhdf5-serial-dev protobuf-compiler libopencv-dev\
    python3-nose python3-numpy python3-scipy \
    && rm -rf /var/lib/apt/lists/*

# most important Python dependency
RUN pip3 install torch==1.6.0+cpu torchvision==0.7.0+cpu -f https://download.pytorch.org/whl/torch_stable.html

COPY requirements.txt .
RUN pip3 install -r requirements.txt

COPY app/ /app/
WORKDIR /app/

RUN chmod +x cmd_start.sh

EXPOSE 8000

# CMD [ "flask run", "--host=0.0.0.0", "--port=8000" ] # for dev only: no Gunicorn server
CMD ["./cmd_start.sh"]
