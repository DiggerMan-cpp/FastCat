#!/bin/bash

echo "Введите директорию поиска:"
read search_string

echo "Результат поиска:"

find . -type f -exec grep -l "$search_string" {} ; | while read filename
do
    echo "Файл $filename"
    echo "Содержимое:"
    cat "$filename"
done
