FROM python:3.8-slim

RUN apt-get update && apt-get install -y default-libmysqlclient-dev build-essential

COPY ./requirements.txt /requirements.txt
WORKDIR /app

RUN python -m venv /py && \
    /py/bin/pip install --upgrade pip && \
    /py/bin/pip install -r /requirements.txt

ENV PATH="/py/bin:$PATH"
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

COPY ./src /app

EXPOSE 8000