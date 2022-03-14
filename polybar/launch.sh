#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Launch Polybar, using default config location ~/.config/polybar/config
polybar top-left 2>&1 | polybar top-center 2>&1 | polybar top-right 2>&1 | tee -a /tmp/polybar.log & disown

echo "Polybar launched..."
