@echo off
rem Использую xcopy для копирования с возобновлением
rem /Z - Копирование сетевых файлов с возобновлением.
rem /C - Продолжение копирования вне зависимости от наличия ошибок.

rem Web1.mp4 - someone big file
xcopy /Z "C:\LAB6\ii\Web1.mp4" "C:\LAB6\ii\save" /C