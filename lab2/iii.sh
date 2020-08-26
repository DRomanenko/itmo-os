#!/bin/bash

grep -E -h -o -s -r --binary-files=text "[[:alnum:]_.]+@[[:alnum:]_]+(\.[[:alpha:]]+)+" /etc/ | sort -u | tr -s '\n' ',' | sed '$ s/.$//' > $HOME/lab2/emails.lst
cat $HOME/lab2/emails.lst