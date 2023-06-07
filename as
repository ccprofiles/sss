import requests
from bs4 import BeautifulSoup

# Отправляем GET-запрос к веб-странице
url = "https://www.example.com"  # Замените на нужный URL
response = requests.get(url)

# Проверяем успешность запроса
if response.status_code == 200:
    # Создаем объект BeautifulSoup и указываем парсер
    soup = BeautifulSoup(response.content, "html.parser")

    # Находим элементы на странице по тегам или классам
    # Примеры:
    # - Находим заголовок страницы по тегу 'h1'
    title = soup.find("h1").text
    print("Заголовок:", title)

    # - Находим все ссылки на странице по тегу 'a'
    links = soup.find_all("a")
    print("Ссылки:")
    for link in links:
        href = link.get("href")
        print(href)
else:
    print("Ошибка при запросе:", response.status_code)
