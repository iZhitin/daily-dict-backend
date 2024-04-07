FROM python:3.12-slim

COPY . .

RUN pip install -r requirements.txt

CMD ["uvicorn", "main:app", "--network", "host", "--port", "80"]

