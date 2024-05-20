FROM postgres:14.5

ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=Qwerty_386
ENV POSTGRES_DB=dd_db

# Копируем файл с SQL скриптом для инициализации базы данных (опционально)
COPY init.sql /docker-entrypoint-initdb.d/

# Запускаем PostgreSQL
CMD ["postgres"]