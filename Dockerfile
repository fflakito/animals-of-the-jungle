FROM continuumio/miniconda3:4.6.14

RUN mkdir /app

WORKDIR /app

COPY app/conda_environment.yml /app

RUN conda env create -f /app/conda_environment.yml \
    && conda clean --all --yes

COPY ./app /app

RUN chmod +x startup.sh

RUN echo "conda activate fastai" >> ~/.bashrc

RUN conda activate fastai && conda install flask

CMD bash startup.sh