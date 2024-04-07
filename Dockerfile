FROM python:3.12-slim

COPY . .

RUN pip3 install --default-timeout 15 -r requirements.txt

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "80"]

# TODO: ЭТО ВСЕ В ДОКУ
# Для деплоя:
# 1) Авторизация на серваке: ssh root@95.163.231.19 (затем ввести пароль), либо авторизоваться другим способом
# 2) Установка докера в 2 команды с сайта: https://docs.docker.com/engine/install/ubuntu/
# 3) Установка git: sudo apt-get git
# 4) Сам деплой: docker build . --tag fastapi_app --network host  && docker run -p 80:80 fastapi_app

