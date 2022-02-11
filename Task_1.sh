#!/bin/bash
n=3
echo 'Угадайте загадонное число'
read -r dig
n=$(( $n - 1))
rand=$((RANDOM % 99 + 1))
while [[ dig -ne rand ]]; do
    if [[ n -ne 0 ]]; then
        if [[ dig -lt rand  ]];
        then
          echo "Ваше число < Загадонного"
        else
          echo "Ваше число > Загадонного"
        fi
        n=$(( $n - 1))
        else
          echo "Попытки кончились :)"
    fi
echo 'Введите повторно число'
read -r dig
done
echo "Ах, какой проказник! Угадал!"


