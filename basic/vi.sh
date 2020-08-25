#!/bin/bash
if [[ $( pwd ) == $HOME ]]; then
	echo $HOME
  	echo 0
else 
	echo "Error: Current file isn't in the working directory."
  	echo 1
fi