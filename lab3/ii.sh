#/bin/bash

# ps 
#https://1cloud.ru/help/security/ispolzovanie-komandy-ps-dlya-prosmotra-protsessov-linux

ps a -o pid,start --sort=start_time | tail -1
