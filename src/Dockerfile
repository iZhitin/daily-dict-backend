FROM python:3.12-slim

WORKDIR /code

RUN apt update -y && apt install -y build-essential gcc

COPY requirements.txt requirements.txt
RUN pip install --upgrade pip && pip install -r requirements.txt --no-cache-dir

COPY . /code

ENTRYPOINT [ "sh", "entrypoint.sh" ]