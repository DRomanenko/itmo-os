#!/bin/bash

echo $$ > a.pid

usr2() {
    cat b.pid | tail -1
}

trap 'usr2' USR2

while true; do
    read LINE
    case $LINE in
        "TERM")
            kill -SIGTERM $(cat .pid)
            exit
            ;;
        "+")
            kill -USR1 $(cat .pid)
        ;;
        "*")
            kill -USR2 $(cat .pid)
        ;;
        *)
            :
        ;;      
    esac
done