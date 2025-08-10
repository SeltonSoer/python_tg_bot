import os
from docker_usage_scripts import cmd_docker as _docker

from telegram import Update
from telegram.ext import ApplicationBuilder, ContextTypes, CommandHandler

TG_TOKEN = os.getenv('TG_KEY_BOT_TEST')

async def start(update: Update, context: ContextTypes.DEFAULT_TYPE):
    _docker.get_containers_docker()
    await context.bot.send_message(
        chat_id=update.effective_chat.id,
        text='Выполнено'
    )


if __name__ == '__main__':
    application = ApplicationBuilder().token(TG_TOKEN).build()
    start_handler = CommandHandler('start', start)
    application.add_handler(start_handler)

    print('🚀🚀🚀 TG BOT HAS STARTED 🚀🚀🚀')

    application.run_polling()
