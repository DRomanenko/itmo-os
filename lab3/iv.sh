#!/bin/bash

#разность резидентной и разделяемой части памяти процесса для каждого PID
# Где хранится информация обо всех процессах: https://habr.com/ru/post/316806/

#как сделать перебор значений в bash:
#https://habr.com/ru/company/ruvds/blog/325928/
#Информация про файловую систему PROC в LINUX
#https://losst.ru/fajlovaya-sistema-proc-v-linux
# statm - информация о памяти процесса
# Нам понадобится файл /proc/<pid>/statm со следующим содержимым
#size       (1) total program size
#           (same as VmSize in /proc/[pid]/status)
#resident   (2) resident set size
#           (same as VmRSS in /proc/[pid]/status)
#share      (3) shared pages (i.e., backed by a file)
#text       (4) text (code)
#lib        (5) library (unused in Linux 2.6)
#data       (6) data + stack
#dt         (7) dirty pages (unused in Linux 2.6)
#т.к ps не хватает:
#%Mem - percent of memory
#VSZ - Virtual Size
#RSS - Resident Set Size
#SIZE - Equivalent to VSZ

for CURR_PID in $(ps ax -o pid | tail +2); do
	RESIDENT=$(cut -d " " -f 2 /proc/$CURR_PID/statm)
	SHARED=$(cut -d " " -f 3 /proc/$CURR_PID/statm)
	printf "$CURR_PID $(( $RESIDENT - $SHARED ))\n"
done | sort -r -n --key=2 | awk '{printf("%d:%d\n", $1, $2)}'

