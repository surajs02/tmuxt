#!/bin/sh

cDir=`basename $PWD`
tmux new -d -s "$cDir"
tmux splitw -v
tmux splitw -v
tmux splitw -v
tmux selectl t
tmux a

