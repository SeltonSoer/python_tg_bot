# syntax=docker/dockerfile:1

# 1) Базовый образ с Python. Используем "slim" — меньше веса, но достаточно для большинства проектов.
FROM python:3.12-slim

# 2) Не писать байткод .pyc и не буферизовать stdout (нужно для логов в контейнере)
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# 3) Рабочая директория внутри контейнера
WORKDIR /app

# 4) Копируем только requirements сначала — это хит для кэша слоёв
# если requirements не меняются, слой с pip install не будет пересобираться при изменении кода
COPY requirements.txt .

# 5) Обновляем pip и ставим зависимости (без cache чтобы уменьшить размер образа)
RUN pip install --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt \
    && apt-get update && apt-get install -y openssh-client && rm -rf /var/lib/apt/lists/*

# 6) Копируем весь код приложения в контейнер
COPY . .

# 7) Создаём непривилегированного пользователя и даём право на рабочую папку — безопасность
RUN useradd -m appuser && chown -R appuser:appuser /app

USER appuser

# 8) Команда по-умолчанию — запуск бота
CMD ["python", "main.py"]
