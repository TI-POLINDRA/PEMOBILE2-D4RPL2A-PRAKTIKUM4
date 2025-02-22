import os
import requests

def send_telegram_message(token, chat_id, file_path):
    url = f"https://api.telegram.org/bot{token}/sendDocument"
    files = {'document': open(file_path, 'rb')}
    data = {'chat_id': chat_id}
    response = requests.post(url, files=files, data=data)
    return response.json()

telegram_token = os.getenv('TELEGRAM_BOT_TOKEN')
chat_id = os.getenv('TELEGRAM_CHAT_ID')
version_name = os.getenv('VERSION_NAME')
file_path = f'build/app/outputs/flutter-apk/app-release-{version_name}.apk'

send_telegram_message(telegram_token, chat_id, file_path)