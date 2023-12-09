FROM ubuntu
#устанавливаем рабочий каталог
WORKDIR /Unix
#копируем файл внутрь контейнера
COPY main.sh /Unix/main.sh
#установили права на выполнение файла main.sh внутри контейнера
RUN chmod +x /Unix/main.sh
#том для хранения данных
VOLUME ["/shared_volume"]
#запуск main.sh при запуске контейнера
CMD ["/Unix/main.sh"]
