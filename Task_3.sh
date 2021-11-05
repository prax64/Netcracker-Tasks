#!/bin/bash
# Посмтотреть df, grep, tr, cut, less, more
# посчитать кол-во свободного места на всех дисках
# запишем результат в массив
# циклом посчитать результ
# доп. Скрипт должен на входе вопсринимать модификатор G M K( в каких единицах мы считаем)
#
flag=0
while [[ flag -ne 1 ]]; do
    echo -n "Введите модификатор [G|g] или [M|m] или [K|k]  в каких единицах мы считаем) : "
    read -r modifier
    case $modifier in
        [Gg])
          modifier_=G
          flag=1
          ;;
        [Mm])
          modifier_=M
          flag=1
          ;;
        [Kk])
          modifier_=K
          flag=1
          ;;
        *)
        echo "Неверные входные данные. Попробуйте еще раз"
    esac
done

free_space_str=$(df -k 2>/dev/null | grep '^/dev' | tr -s ' ' | cut -d' ' -f4 )
free_space_sum=0
for free_space_section in $free_space_str ; do
  free_space_sum=$(( free_space_sum + free_space_section ))
done
if [[ $modifier_ == G ]]; then
    free_space_sum=$(( free_space_sum / 1024 / 1024 ))
  elif [[ $modifier_ == M ]]; then
    free_space_sum=$(( free_space_sum / 1024 ))
fi
echo "Размер свободного пространства $free_space_sum $modifier_"

