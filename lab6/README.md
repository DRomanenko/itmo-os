## [Problems](problems.pdf):
[i.bat](i.bat): Создать каталог на диске `С:\` с именем `LAB6`. В нем создать файлы с
информацией о версии операционной системы, свободной и загруженной памяти, жестких дисках, подключенных в системе. Имена файлов должны соответствовать применяемой команде. Далее:
1. Создать подкаталог `TEST`, в него скопировать содержимое каталога `LAB6`.
2. Создать одной командой файл с содержимым всех файлов каталога `LAB6`.
3. Удалить все файлы в текущем каталоге, кроме созданного последним, указав явно
имена удаляемых файлов.
4. Создать текстовый файл со списком использованных команд и параметрами,
использованными для выполнения.

[ii.bat](ii.bat): В ручную узнать имя_хостового_компьютера (свойства компьютера). Далее:
1. Создать исполняемый файл [copier.bat](copier.bat), производящий копирование любого файла из дериктории `C:\cd\` объемом более 2 Мбайт на ресурс `\\имя_хостового_компьютера\temp` с поддержкой продолжения копирования при обрыве.
2. Настроить запуск файла по расписанию через 1 минуту.
3. Проверить запуск копирования; если процесс появился, принудительно завершить его.
4. Сравнить исходный и конечный файл. Проверить их целостность.
5. Продолжить копирование с места разрыва.
6. Создать текстовый файл со списком использованных команд с параметрами, использованными для выполнения.

[iii.bat](iii.bat): Получить файл, содержащий список служб, запущенных в системе. Далее:
1. Создать командный файл обеспечивающий:
	1. остановку служб `DNS-client`;
	2. с временной задержкой, создание файла, содержащего обновленный список служб, запущенных в системе;
	3. запуск другого командного файла, сравнивающего полученные файлы, и создающего разностный файл;
	4. восстановление работы служб.
2. Создать текстовый файл со списком использованных команд и параметрами, использованными для выполнения.

[iv.bat](iv.bat): Поместить список всех имен драйверов, загруженных в системе, в файл `DRIVERS`, в табличной форме. Далее:
1. Отсортировать полученные данные в обратном порядке по алфавиту.
2. Создать текстовый файл со списком использованных команд и параметрами,
использованными для выполнения.


## [Modifications](/lab6/mods/)
[mod-iii.bat](/lab6/mods/mod-iii.bat) 
