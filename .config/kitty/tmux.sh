#!/bin/bash
TMUX_SESSION_NAME="work"
MRN_DIR="/grmn/prj/mrn"

tmux new-session -A -d -s $TMUX_SESSION_NAME -n def &&
	tmux new-window -t $TMUX_SESSION_NAME -n "hydrogen" -c "$MRN_DIR/mfd-app" &&
	tmux new-window -t $TMUX_SESSION_NAME -n "alchemy" -c "$MRN_DIR/alchemy" &&
	tmux new-window -t $TMUX_SESSION_NAME -n "mrn-metrics" -c "$MRN_DIR/marine-metrics"

tmux attach -t $TMUX_SESSION_NAME:def
