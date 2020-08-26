#!/bin/bash

# grep https://zalinux.ru/?p=1270:
# -o, --only-matching	показывать только часть строки, совпадающей с ШАБЛОНОМ
# -i, --ignore-case     игнорировать различие регистра
# {n,\}  Предыдущий элемент встречается n или более раз (\ - экранирование пробела).
# {n,m} Предыдущий элемент встречается по крайней мере n раз, но не более чем m раз.

# tr – заменяет одни символы на другие.
# [:upper:] соответствует набору символов алфавита в верхнем регистре. Эквивалентно выражению [A-Z].
# [:lower:] соответствует набору алфавитных символов в нижнем регистре. Эквивалентно выражению [a-z].

# sort 
# sort мы делаем два раза, поскольку uniq удаляет элементы только, если они идут последовательно
# Опция -n используется всегда, когда нужно сортировать числа, разумеется в порядке возрастания (или убывания, добавив опцию -r).

# uniq
# -c	--count		Сообщит, сколько было одинаковых строк до их урезания

# head 
# -n взять n элементов от головы стека
man bash | grep -o -i "[[:alnum:]]\{4,\}" | tr "[:upper:]" "[:lower:]" | sort | uniq -c | sort -nr| head -3