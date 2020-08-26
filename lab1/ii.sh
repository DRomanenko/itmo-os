#!/bin/bash
MAX=-1
if [[ $1 -gt $2 ]]; then # >
	MAX=$1
else
	MAX=$2
fi
if [[ $MAX -lt $3 ]]; then # <
	MAX=$3
fi
echo $MAX