#!/bin/bash

#надо отгадывать число от 1 до 99

try_count=3
echo 'Угадайте загадонное число'
read dig
try_count=$(( $try_count - 1))
rand=$((RANDOM % 99 + 1))
echo $RANDOM
while [[ dig -ne rand ]]; do
    if [[ try_count -ne 0 ]]; then
        if [[ dig -lt rand  ]]; then
			echo "Ваше число < Загадонного"
			else
				echo "Ваше число > Загадонного"
        fi
        try_count=$(( $try_count - 1))
        else
			echo "Попытки кончились :)"
			echo "Было загадоно $rand"
			exit 0
    fi
	echo 'Введите повторно число'
	read dig
done
echo "Ах, какой проказник! Угадал!"
exit 0



