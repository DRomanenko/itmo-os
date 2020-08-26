#!/bin/bash

#find ..$(readlink /proc/$1/exe) -type f  | wc -l



#cd ..$(readlink /proc/$1/exe)



#ls -R $(echo $(readlink /proc/$1/exe) | grep -o '.*/' | grep -o '.*[^/]')




#https://unixforum.org/viewtopic.php?t=127759

find $(echo $(readlink /proc/$1/exe) | grep -o '.*/' | grep -o '.*[^/]') -type f | wc -l