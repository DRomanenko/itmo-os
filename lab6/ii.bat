@echo off
rem Если вместо %переменная% взять %переменная:~начало,длина% - получим часть строки
set /a curMinute=%time:~3,2%
set /a curHour=%time:~0,2%

if %curMinute% == 59 (
	set curMinute=0
	if %curHour% == 23 (
		set curHour=0
	) else (
		set /a curHour=%curHour%+1
	)
) else (
	set /a curMinute=%curMinute%+1
)

if %curHour% LSS 10 (
	set curHour=0%curHour%
)

if %curMinute% LSS 10 (
	set curMinute=0%curMinute%
)

rem https://ab57.ru/cmdlist/schtasks.html
rem /Create - Создание запланированной задачи.
rem /SC расписание  - Задает частоту повторения задачи. Допустимы следующие типы расписания: MINUTE, HOURLY, DAILY, WEEKLY, MONTHLY, ONCE, ONSTART, ONLOGON, ONIDLE, ONEVENT.
rem /TN <имя_задачи> - Имя, однозначно идентифицирующее запланированную задачу.
rem /TR   <программа> - Путь и имя файла программы, которая должна быть запущена в назначенное время. Пример: C:\windows\system32\calc.exe

SCHTASKS /Query /TN "myCopier" >NUL 2>&1 && SCHTASKS /Delete /TN "myCopier" /F >NUL 2

SCHTASKS /Create /SC once /TN "myCopier" /TR "C:\Lab6\ii\copier.bat" /ST %curHour%:%curMinute% 
rem если есть, то выключить
SCHTASKS /Query /TN "myCopier" >NUL 2>&1 && SCHTASKS /Delete /TN "myCopier" /F  

rem Web1.mp4 - someone big file

FC "C:\LAB6\ii\Web1.mp4" "C:\LAB6\ii\save\Web1.mp4"

xcopy /Z "C:\LAB6\ii\Web1.mp4" "C:\LAB6\ii\save" /C

find /V "rem" ii.bat | findstr /virc:"^$" 