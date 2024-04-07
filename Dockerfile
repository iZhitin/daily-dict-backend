FROM python:3.12-slim

COPY . .

# RUN pip3 install -r requirements.txt
RUN ping pypi.org
RUN ping pypi.org
RUN ping pypi.org
RUN ping pypi.org
RUN ping pypi.org



CMD ["uvicorn", "main:app", "--network", "host", "--port", "80"]

