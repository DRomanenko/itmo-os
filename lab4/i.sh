#!/bin/bash

#date --help
#date +%[format-option]
# %d   	день месяца (напр., 01)
# %m   	месяц (01..12)
# %y   	последние две цифры года (00..99)
# %Y   	год (2019)

# %D   дата; аналогично %m/%d/%y

# %H   	час (00..23)
# %M  	минуты (00..59)
# %S    секунды (00..60)

# ping
# -c NUM - задать количество пинг запросов

DATE=$(date +%H:%M:%S_%d.%m.%Y)
WEBSITE="www.net_nikogo.ru"
WEBSITE1="isu.ifmo.ru"

mkdir $HOME/test && echo "catalog test was created successfully" > ~/report && touch ~/test/$DATE.txt
(ping $WEBSITE -c 1 && echo "$WEBSITE is available" >> ~/report) || echo "$WEBSITE isn't available"

rm -r ~/test
cat ~/report
