#!/bin/bash

for (( i=2; i <= $#; i++ )); do
     echo "$i "
done | xargs $(readlink /proc/$1/exe)