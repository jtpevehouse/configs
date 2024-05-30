#!/bin/bash
TMUX_SESSION_NAME="home"
# WORK CONFIG
# MRN_DIR="/home/pevehousejosh/grmn/prj/mrn"

# tmux new-session -A -d -s home -n def && \
    #     tmux new-window -t $TMUX_SESSION_NAME -n "hydrogen" -c "$MRN_DIR/mfd-app" && \
    #     tmux new-window -t $TMUX_SESSION_NAME -n "alchemy" -c "$MRN_DIR/alchemy" && \
    #     tmux new-window -t $TMUX_SESSION_NAME -n "mrn-metrics" -c "$MRN_DIR/marine-metrics"

# HOME CONFIG
tmux new-session -A -d -s home -n home && \
    tmux new-window -t $TMUX_SESSION_NAME -n "workspace" -c "~/workspace"

tmux attach -t home:def
