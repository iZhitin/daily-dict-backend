FROM python:3.12-slim

COPY . .

RUN pip3 install --default-timeout 15 -r requirements.txt

CMD ["uvicorn", "main:app", "--workers", "0.0.0.0", "--port", "80"]

#  docker build . --tag fastapi_app --network host  && docker run -p 80:80 fastapi_app

