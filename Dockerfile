FROM python:3.12-slim

COPY . .

RUN pip3 install --default-timeout 50 -r requirements.txt

CMD ["uvicorn", "main:app", "--network", "0.0.0.0", "--port", "80"]

