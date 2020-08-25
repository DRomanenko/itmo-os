#!/bin/bash

grep -r -h --binary-files=text "ACPI*" /var/log/ > $HOME/lab2/errors.log 
grep -E "/[!-Z_-~]+\.[[:alpha:]][[:alnum:]]+" $HOME/lab2/errors.log 

