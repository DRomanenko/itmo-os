#!/bin/bash
# (II) - Information
# (WW) - Warning
grep -E -h "\(WW\)" $HOME/lab2/Xorg.0.log | sed -E "s/\(WW\)/Warning:/" > $HOME/lab2/full.log
grep -E -h "\(II\)" $HOME/lab2/Xorg.0.log | sed -E "s/\(II\)/Information:/" >> $HOME/lab2/full.log
cat $HOME/lab2/full.log
