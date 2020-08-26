#!/bin/bash

./iv_gen.sh&PID1=$!
cpulimit -q --background --pid $PID1 --limit 15
./iv_gen.sh&PID2=$!

echo $PID1
echo $PID2
