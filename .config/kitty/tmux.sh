#!/bin/bash
TMUX_SESSION_NAME="home"

tmux new-session -A -d -s home -n home &&
	tmux new-window -t $TMUX_SESSION_NAME -n "workspace" -c "~/workspace"

tmux attach -t home:def
