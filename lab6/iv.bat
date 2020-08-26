@echo off
rem https://it-here.ru/windows/kak-posmotret-spisok-vseh-ustanovlenny-h-drajverov-windows/
rem SC QUERY type= driver альтернатива
driverquery /FO table > "DRIVERS"
sort /R "DRIVERS"
find /V "rem" iv.bat | findstr /virc:"^$"