#!/bin/sh

SESSION=`basename $PWD`
tmux new -d -t $SESSION
tmux split-window -h
tmux split-window -v
tmux select-pane -L
tmux a -t $SESSION