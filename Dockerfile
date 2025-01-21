# Используем официальный образ Python в качестве базового образа
FROM python:3.12-slim

# Устанавливаем рабочую директорию внутри контейнера
WORKDIR /usr/src/app

# Копируем файлы проекта в контейнер
COPY . .

# Устанавливаем зависимости
RUN pip install -r requirements.txt

# Устанавливаем wait-for-it
RUN apt-get update && apt-get install -y wait-for-it

# Команда по умолчанию
CMD ["wait-for-it", "pgdb:5432", "--", "python", "manage.py", "runserver", "0.0.0.0:8000"]
