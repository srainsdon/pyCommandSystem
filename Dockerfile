FROM python:3.6.1-alpine

LABEL maintainer = "seth.rainsdon@nunetnetworks.net"

RUN apk update && apk add build-base libpq
RUN pip install --upgrade pip

RUN mkdir /app
WORKDIR /app
COPY ./requirements.txt .
RUN pip install -r requirements.txt
ENV PYTHONUNBUFFERED 1

COPY . .

CMD gunicorn --access-logfile - --reload -b 0.0.0.0:8888 app
