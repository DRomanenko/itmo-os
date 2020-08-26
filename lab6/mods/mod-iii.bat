@echo off
rem NET: https://ab57.ru/cmdlist/net.html
rem SC: https://ab57.ru/cmdlist/sc.html
SC QUERY type= service > "oldServices.log"
set /P nameSevice="What is nameSevice?"
SC STOP %nameSevice%
SC QUERY type= service > "newServices.log"
rem /A - Вывод только первой и последней строк для каждой группы различий.
FC "newServices.log" "oldServices.log"
SC START %nameSevice%
rem net stop DNS-client
find /V "rem" iii.bat | findstr /virc:"^$"