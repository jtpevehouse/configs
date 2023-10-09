set fish_greeting
theme_gruvbox dark medium

alias 'nv'='nvim'
alias 'll'='ls -lha'
alias 'vsc'='code .'
alias 'pc'='podman-compose'

set -gx EDITOR nvim

# LAUNCH TMUX BY DEFAULT
if status is-interactive
and not set -q TMUX
	exec tmux a || \
	tmux new -d -s home -n def && \
	tmux new-window -n dev && \
	tmux a -t "home"
end
