#!/bin/bash

# file - отображает тип файла в Linux

# bash - скрипт. Это — сценарии командной строки.

# awk
# Встроенная функция system (command_line) выполняет команду "command_line", которая может быть строкой, вычисляющей, например, sprintf. Функция system возвращает состояние выполненной команды.

#file /bin/* | grep 'script' | awk -F ":" '{system("head -1 " $1)}' | sort | uniq -c | sort -nr | head -1 | awk '{print $2}'

head -1 $(find /bin/ -name "*" -type f) | grep --text '^#!' | sort | uniq -c | sort -nr | head -1 | awk '{print $2}'
