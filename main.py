import os

from telegram import Update
from telegram.ext import ApplicationBuilder, ContextTypes, CommandHandler

TG_TOKEN = os.getenv('TG_KEY_BOT_TEST')

async def start(update: Update, context: ContextTypes.DEFAULT_TYPE):
    await context.bot.send_message(
        chat_id=update.effective_chat.id,
        text="I'm a bot, please talk to me!"
    )


if __name__ == '__main__':
    application = ApplicationBuilder().token(TG_TOKEN).build()
    start_handler = CommandHandler('start', start)
    application.add_handler(start_handler)

    application.run_polling()