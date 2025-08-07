#!/bin/bash
# set -e

export PATH="/home/runner/workspace/.local/share/pypoetry/venv/bin:$PATH"

#Проверяем, есть ли poetry
if ! command -v poetry &> /dev/null; then
  echo "📥 Poetry не найден, устанавливаю..."
  curl -sSL https://install.python-poetry.org | python3
  export PATH="$HOME/.local/bin:$PATH"
else
  echo "✅ Poetry уже установлен"
fi

echo "🧹 Удаляем старую среду Poetry..."
poetry env remove --all || true

echo "📦 Устанавливаем зависимости..."
poetry install

echo "🚀 Запускаем main.py через Poetry..."
poetry run python main.py
