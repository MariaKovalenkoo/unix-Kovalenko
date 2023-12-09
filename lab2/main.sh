#!/bin/sh

while true; do

#создание блокировки
exec 3>/var/lockfile
flock -x 3 

# Функция для получения доступного имени файла (001, 002 и тд)
fun_filename() {
i=1
while true;do
filename=$(printf "%03d" $i) #номер файла переделываем в формат с начальными нулями
if [ ! -e "/shared_volume/$filename" ]; then #проверяем существует файл с данным именем
printf "%03d" $i
break
fi
i=$((i+1))
done
}
 
filename=$(fun_filename)

# генирируем случайный индентикатор, состоящий из 12 символов
id=$(head /dev/urandom | tr -dc A-Za-z0-9 |head -c 12)

echo "Контейнер id: $id, filename: $filename"

# записываем id контейнера и порядковый номер файла в файл
echo "$id-$filename" > "/shared_volume/$filename"

# выводим, то что записано в файле
text=$(cat "/shared_volume/$filename")
echo "В файл $filename записали: $text" 

# снятие блокировки
exec 3<&-

# задержка 1 сек
sleep 1
echo "Удалили $filename"

# удаляем файл
rm "/shared_volume/$filename"

echo
sleep 1
done
