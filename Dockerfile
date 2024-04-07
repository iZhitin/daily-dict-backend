FROM python:3.12-slim

COPY . .

# RUN pip3 install -r requirements.txt
RUN ping pypi.org
RUN ping pypi.org
RUN ping pypi.org
RUN ping pypi.org
RUN ping pypi.org



CMD ["uvicorn", "main:app", "--network", "127.0.0.1", "--port", "80"]

