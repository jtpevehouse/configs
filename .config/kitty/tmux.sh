#!/bin/bash
TMUX_SESSION_NAME="home"
WORKSPACE_DIR="/home/jtpevehouse/workspace"

tmux new-session -A -d -s $TMUX_SESSION_NAME -n "def" &&
	tmux new-window -t $TMUX_SESSION_NAME -n "workspace" -c "$WORKSPACE_DIR"

tmux attach -t $TMUX_SESSION_NAME:def
