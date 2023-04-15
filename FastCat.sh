#!/bin/bash

echo "Введите строку для поиска:"
read search_string

echo "Введите строку для замены:"
read replace_string

echo "Результаты поиска и замены:"

find . -type f | xargs -P 4 -I {} sh -c "sed -i 's/$search_string/$replace_string/g' {} && grep -l '$replace_string' {}" | while read filename
do
    echo "Файл: $filename"
    echo "Содержимое файла после замены:"
    cat "$filename"
    echo "------------------------"
done
