# Docker HW

Проект генерирует CSV-данные и HTML-отчёт с помощью Docker-контейнеров.

## Структура проекта

- generator/ — контейнер для генерации данных
- reporter/ — контейнер для создания HTML-отчёта
- data/ — папка с данными (монтируется в контейнеры)
- run.sh — главный скрипт управления

## Команды

./run.sh build_generator   # собрать образ генератора
./run.sh run_generator     # сгенерировать data/data.csv
./run.sh create_local_data # создать data.csv локально в local_data/
./run.sh build_reporter    # собрать образ аналитика
./run.sh run_reporter      # сгенерировать data/report.html
./run.sh structure         # показать структуру проекта
./run.sh clear_data        # удалить data.csv и report.html
./run.sh inside_generator  # показать содержимое /data внутри генератора
./run.sh inside_reporter   # показать содержимое /data внутри аналитика
