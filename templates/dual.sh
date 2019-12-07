#!/bin/sh

cDir=`basename $PWD`
tmux new -d -s "$cDir"
tmux splitw -h
tmux a

