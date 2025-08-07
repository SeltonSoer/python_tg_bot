#!/bin/bash
set -e

# Проверяем, есть ли poetry
if ! command -v poetry &> /dev/null; then
 echo "📥 Poetry не найден, устанавливаю..."
 curl -sSL https://install.python-poetry.org | python3
 export PATH="$HOME/.local/bin:$PATH"
else
 echo "✅ Poetry уже установлен"
fi

echo "🧹 Удаляем старую среду Poetry..."
poetry env remove --all


echo "📦 Устанавливаем зависимости..."
poetry install || exit 1

echo "🚀 Запускаем main.py через Poetry..."
poetry run python main.py
