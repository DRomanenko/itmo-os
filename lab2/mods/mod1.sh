#!/bin/bash

find $1/* -type f | grep -v "pycache/.*" | xargs -n 1 cat | wc -l
