FROM python:3.10-slim-buster
RUN apt-get update -y
RUN apt-get install git curl python3-pip ffmpeg -y
RUN python3 -m pip install --upgrade pip
RUN pip3 install -U pip
RUN curl -sL https://deb.nodesource.com/setup_18.x | bash -
RUN apt-get install -y nodejs
RUN npm i -g npm
FROM ubuntu:jammy
RUN apt-get update -y && apt-get upgrade -y \
    && apt-get install -y git python3-pip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
    
COPY . /app/
WORKDIR /app/

RUN pip3 install -r requirements.txt --force-reinstall
CMD python3 -m AdityaHalder
