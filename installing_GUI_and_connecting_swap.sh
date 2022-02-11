#!/bin/bash
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root, use sudo "$0" instead" 1>&2
   exit 1
fi
#yum install epel-release
#yum groupinstall "X Window system"
echo -e 'Выберите окружение рабочего стола:\n1)gnome\n2)mate\n3)kde\n4)xfce\nВведите число соответствующего номеру окружения от 1 до 4. По умолчанию = 3.\n'
read shell_number
case $shell_number in
1 | gnome)
  echo  "Установка GNOME Desktop:"
  yum groupinstall "GNOME Desktop"
  ;;
2 | mate)
  echo  "Установка MATE Desktop:"
  yum groupinstall "MATE Desktop"
  ;;
3 | kde)
  echo  "Установка KDE Plasma Workspaces:"
  yum groupinstall "KDE Plasma Workspaces"
  ;;
4 | xfce)
  echo  "Установка Xfce:"
  yum groupinstall "Xfce"
  ;;
*)
  echo -n "Выбран вариант по умолчанию"
  yum groupinstall "KDE Plasma Workspaces"
  ;;
no)
  
  ;;
esac


echo  "Введите размер файла подкачки(swap) в Гб:"
echo  "Значение по умолчанию 5Гб:"
read swap_size
case $swap_size in
swap_size)
  echo  "Вы выделили $swap_size Гб места для swap"
  fallocate -l "$swap_size"G /swapfile
  ;;
*)
  let swap_size=5
  echo  "Выбран вариант по умолчанию"
  echo  "Вы выделили $swap_size Гб места для swap"
  fallocate -l "$swap_size"G /swapfile
  ;;
esac
chmod 600 /swapfile
swapon /swapfile
echo '/swapfile   swap    swap    sw  0   0' >> /etc/fstab
