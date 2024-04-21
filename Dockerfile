FROM python:3.12-slim

COPY . .

RUN pip3 install --default-timeout 15 -r requirements.txt

# С POSTGRESQL
# 5432

# С UVICORN
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "80"]
# TODO: ЭТО ВСЕ В ДОКУ
# Для деплоя:
# 1) Авторизация на серваке: ssh root@95.163.231.19 (затем ввести пароль), либо авторизоваться другим способом
# 2) Установка докера в 2-3 команды с сайта (можно разбить, если не получается): https://docs.docker.com/engine/install/ubuntu/
# 3) Проверка установки: docker
# 4) Установка git: sudo apt-get install git
# 5) Проверка установки: git
# 6) Клонирование публичного репозитория: git clone https://github.com/iZhitin/daily-dict-backend.git
# 7) Смена директории: cd daily-dict-backend
# 8) Сам деплой: docker build . --tag fastapi_app --network host  && docker run -p 80:80 fastapi_app

